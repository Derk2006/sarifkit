fn string_array_json(items : ArrayView[String]) -> Json {
  Json::array(items.map(item => Json::string(item)))
}

///|
fn message_json(message : SarifMessage) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["text"] = Json::string(message.text)
  if message.markdown is Some(markdown) {
    obj["markdown"] = Json::string(markdown)
  }
  Json::object(obj)
}

///|
fn artifact_location_json(location : ArtifactLocation) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["uri"] = Json::string(location.uri)
  if location.uri_base_id is Some(value) {
    obj["uriBaseId"] = Json::string(value)
  }
  if location.index is Some(value) {
    obj["index"] = Json::number(value.to_double())
  }
  Json::object(obj)
}

///|
fn region_json(region : Region) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["startLine"] = Json::number(region.start_line.to_double())
  obj["startColumn"] = Json::number(region.start_column.to_double())
  if region.end_line is Some(value) {
    obj["endLine"] = Json::number(value.to_double())
  }
  if region.end_column is Some(value) {
    obj["endColumn"] = Json::number(value.to_double())
  }
  if region.char_offset is Some(value) {
    obj["charOffset"] = Json::number(value.to_double())
  }
  if region.char_length is Some(value) {
    obj["charLength"] = Json::number(value.to_double())
  }
  Json::object(obj)
}

///|
fn physical_location_json(location : PhysicalLocation) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["artifactLocation"] = artifact_location_json(location.artifact_location)
  if location.region is Some(region) {
    obj["region"] = region_json(region)
  }
  Json::object(obj)
}

///|
fn location_json(location : SarifLocation) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["physicalLocation"] = physical_location_json(location.physical_location)
  if location.message is Some(message) {
    obj["message"] = message_json(message)
  }
  if location.logical_name is Some(name) {
    let logical : Map[String, Json] = Map([])
    logical["name"] = Json::string(name)
    obj["logicalLocations"] = Json::array([Json::object(logical)])
  }
  Json::object(obj)
}

///|
fn artifact_json(artifact : Artifact) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["location"] = artifact_location_json(artifact.location)
  if artifact.length is Some(value) {
    obj["length"] = Json::number(value.to_double())
  }
  if artifact.mime_type is Some(value) {
    obj["mimeType"] = Json::string(value)
  }
  if artifact.roles.length() > 0 {
    obj["roles"] = string_array_json(artifact.roles)
  }
  Json::object(obj)
}

///|
fn rule_json(rule : SarifRule) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["id"] = Json::string(rule.id)
  if rule.name is Some(name) {
    obj["name"] = Json::string(name)
  }
  if rule.short_description is Some(message) {
    obj["shortDescription"] = message_json(message)
  }
  if rule.full_description is Some(message) {
    obj["fullDescription"] = message_json(message)
  }
  let config : Map[String, Json] = Map([])
  config["level"] = Json::string(rule.default_level)
  obj["defaultConfiguration"] = Json::object(config)
  if rule.help_uri is Some(uri) {
    obj["helpUri"] = Json::string(uri)
  }
  if rule.tags.length() > 0 {
    let props : Map[String, Json] = Map([])
    props["tags"] = string_array_json(rule.tags)
    obj["properties"] = Json::object(props)
  }
  Json::object(obj)
}

///|
fn tool_json(tool : ToolDriver) -> Json {
  let driver : Map[String, Json] = Map([])
  driver["name"] = Json::string(tool.name)
  if tool.version is Some(value) {
    driver["version"] = Json::string(value)
  }
  if tool.information_uri is Some(value) {
    driver["informationUri"] = Json::string(value)
  }
  if tool.rules.length() > 0 {
    driver["rules"] = Json::array(tool.rules.map(rule => rule_json(rule)))
  }
  let obj : Map[String, Json] = Map([])
  obj["driver"] = Json::object(driver)
  Json::object(obj)
}

///|
fn fingerprints_json(items : ArrayView[Fingerprint]) -> Json {
  let obj : Map[String, Json] = Map([])
  for item in items {
    obj[item.key] = Json::string(item.value)
  }
  Json::object(obj)
}

///|
fn properties_json(items : ArrayView[SarifProperty]) -> Json {
  let obj : Map[String, Json] = Map([])
  for item in items {
    obj[item.key] = Json::string(item.value)
  }
  Json::object(obj)
}

///|
fn result_json(result : SarifResult) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["ruleId"] = Json::string(result.rule_id)
  obj["level"] = Json::string(normalize_level(result.level))
  obj["kind"] = Json::string(result.kind)
  obj["message"] = message_json(result.message)
  if result.locations.length() > 0 {
    obj["locations"] = Json::array(result.locations.map(location => location_json(location)))
  }
  if result.fingerprints.length() > 0 {
    obj["partialFingerprints"] = fingerprints_json(result.fingerprints)
  }
  if result.properties.length() > 0 {
    obj["properties"] = properties_json(result.properties)
  }
  if result.baseline_state is Some(value) {
    obj["baselineState"] = Json::string(value)
  }
  Json::object(obj)
}

///|
fn invocation_json(invocation : SarifInvocation) -> Json {
  let obj : Map[String, Json] = Map([])
  if invocation.command_line is Some(value) {
    obj["commandLine"] = Json::string(value)
  }
  if invocation.working_directory is Some(value) {
    obj["workingDirectory"] = artifact_location_json(ArtifactLocation::ArtifactLocation(value))
  }
  obj["executionSuccessful"] = Json::boolean(invocation.execution_successful)
  Json::object(obj)
}

///|
fn run_json(run : SarifRun) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["tool"] = tool_json(run.tool)
  obj["results"] = Json::array(run.results.map(result => result_json(result)))
  if run.artifacts.length() > 0 {
    obj["artifacts"] = Json::array(run.artifacts.map(artifact => artifact_json(artifact)))
  }
  if run.invocations.length() > 0 {
    obj["invocations"] = Json::array(run.invocations.map(item => invocation_json(item)))
  }
  if run.automation_id is Some(value) {
    let details : Map[String, Json] = Map([])
    details["id"] = Json::string(value)
    obj["automationDetails"] = Json::object(details)
  }
  Json::object(obj)
}

///|
pub fn SarifLog::to_json(self : SarifLog) -> Json {
  let obj : Map[String, Json] = Map([])
  obj["version"] = Json::string(self.version)
  if self.schema is Some(schema) {
    obj["$schema"] = Json::string(schema)
  }
  obj["runs"] = Json::array(self.runs.map(run => run_json(run)))
  Json::object(obj)
}

///|
pub fn SarifLog::to_json_string(self : SarifLog, indent? : Int = 0) -> String {
  self.to_json().stringify(indent~)
}

///|
fn json_get(obj : Map[String, Json], key : String) -> Json? {
  obj.get(key)
}

///|
fn required(obj : Map[String, Json], key : String) -> Result[Json, SarifError] {
  match json_get(obj, key) {
    Some(value) => Ok(value)
    None => Err(MissingField(field=key))
  }
}

///|
fn decode_string(obj : Map[String, Json], key : String) -> Result[String, SarifError] {
  match required(obj, key) {
    Ok(String(value)) => Ok(value)
    Ok(_) => Err(JsonDecode(path=key, expected="string"))
    Err(err) => Err(err)
  }
}

///|
fn decode_optional_string(
  obj : Map[String, Json],
  key : String,
) -> Result[String?, SarifError] {
  match json_get(obj, key) {
    None | Some(Null) => Ok(None)
    Some(String(value)) => Ok(Some(value))
    Some(_) => Err(JsonDecode(path=key, expected="string or null"))
  }
}

///|
fn decode_int_optional(
  obj : Map[String, Json],
  key : String,
) -> Result[Int?, SarifError] {
  match json_get(obj, key) {
    None | Some(Null) => Ok(None)
    Some(Number(value, ..)) => Ok(Some(value.to_int()))
    Some(_) => Err(JsonDecode(path=key, expected="integer or null"))
  }
}

///|
fn decode_message(json : Json, path : String) -> Result[SarifMessage, SarifError] {
  match json {
    Object(obj) => {
      let text = match decode_string(obj, "text") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let markdown = match decode_optional_string(obj, "markdown") {
        Ok(value) => value
        Err(_) => None
      }
      Ok({ text, markdown })
    }
    _ => Err(JsonDecode(path~, expected="message object"))
  }
}

///|
fn decode_artifact_location(
  json : Json,
  path : String,
) -> Result[ArtifactLocation, SarifError] {
  match json {
    Object(obj) => {
      let uri = match decode_string(obj, "uri") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let uri_base_id = match decode_optional_string(obj, "uriBaseId") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let index = match decode_int_optional(obj, "index") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      Ok({ uri, uri_base_id, index })
    }
    _ => Err(JsonDecode(path~, expected="artifactLocation object"))
  }
}

///|
fn decode_region(json : Json, path : String) -> Result[Region, SarifError] {
  match json {
    Object(obj) => {
      let start_line = match required(obj, "startLine") {
        Ok(Number(value, ..)) => value.to_int()
        Ok(_) => return Err(JsonDecode(path="startLine", expected="integer"))
        Err(err) => return Err(err)
      }
      let start_column = match json_get(obj, "startColumn") {
        Some(Number(value, ..)) => value.to_int()
        None => 1
        Some(_) => return Err(JsonDecode(path="startColumn", expected="integer"))
      }
      let end_line = match decode_int_optional(obj, "endLine") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let end_column = match decode_int_optional(obj, "endColumn") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      Ok({
        start_line,
        start_column,
        end_line,
        end_column,
        char_offset: None,
        char_length: None,
      })
    }
    _ => Err(JsonDecode(path~, expected="region object"))
  }
}

///|
fn decode_location(json : Json, path : String) -> Result[SarifLocation, SarifError] {
  match json {
    Object(obj) => {
      let physical = match required(obj, "physicalLocation") {
        Ok(Object(phys)) => {
          let artifact = match required(phys, "artifactLocation") {
            Ok(value) => match decode_artifact_location(value, "\{path}.physicalLocation.artifactLocation") {
              Ok(decoded) => decoded
              Err(err) => return Err(err)
            }
            Err(err) => return Err(err)
          }
          let region = match json_get(phys, "region") {
            Some(value) => match decode_region(value, "\{path}.physicalLocation.region") {
              Ok(decoded) => Some(decoded)
              Err(err) => return Err(err)
            }
            None => None
          }
          { artifact_location: artifact, region }
        }
        Ok(_) => return Err(JsonDecode(path="\{path}.physicalLocation", expected="object"))
        Err(err) => return Err(err)
      }
      let message = match json_get(obj, "message") {
        Some(value) => match decode_message(value, "\{path}.message") {
          Ok(decoded) => Some(decoded)
          Err(err) => return Err(err)
        }
        None => None
      }
      Ok({ physical_location: physical, message, logical_name: None })
    }
    _ => Err(JsonDecode(path~, expected="location object"))
  }
}

///|
fn decode_locations(
  obj : Map[String, Json],
  path : String,
) -> Result[Array[SarifLocation], SarifError] {
  match json_get(obj, "locations") {
    None => Ok([])
    Some(Array(items)) => {
      let out : Array[SarifLocation] = []
      for i, item in items {
        match decode_location(item, "\{path}.locations[\{i}]") {
          Ok(value) => out.push(value)
          Err(err) => return Err(err)
        }
      }
      Ok(out)
    }
    Some(_) => Err(JsonDecode(path="\{path}.locations", expected="array"))
  }
}

///|
fn decode_result(json : Json, path : String) -> Result[SarifResult, SarifError] {
  match json {
    Object(obj) => {
      let rule_id = match decode_string(obj, "ruleId") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let level = match decode_optional_string(obj, "level") {
        Ok(Some(value)) => value
        Ok(None) => "warning"
        Err(err) => return Err(err)
      }
      let kind = match decode_optional_string(obj, "kind") {
        Ok(Some(value)) => value
        Ok(None) => "fail"
        Err(err) => return Err(err)
      }
      let message = match required(obj, "message") {
        Ok(value) => match decode_message(value, "\{path}.message") {
          Ok(decoded) => decoded
          Err(err) => return Err(err)
        }
        Err(err) => return Err(err)
      }
      let locations = match decode_locations(obj, path) {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let baseline_state = match decode_optional_string(obj, "baselineState") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      Ok({
        rule_id,
        level,
        kind,
        message,
        locations,
        fingerprints: [],
        properties: [],
        baseline_state,
      })
    }
    _ => Err(JsonDecode(path~, expected="result object"))
  }
}

///|
fn decode_tool(json : Json, path : String) -> Result[ToolDriver, SarifError] {
  match json {
    Object(obj) => match required(obj, "driver") {
      Ok(Object(driver)) => {
        let name = match decode_string(driver, "name") {
          Ok(value) => value
          Err(err) => return Err(err)
        }
        let version = match decode_optional_string(driver, "version") {
          Ok(value) => value
          Err(err) => return Err(err)
        }
        let information_uri = match decode_optional_string(driver, "informationUri") {
          Ok(value) => value
          Err(err) => return Err(err)
        }
        Ok({ name, version, information_uri, rules: [] })
      }
      Ok(_) => Err(JsonDecode(path="\{path}.driver", expected="object"))
      Err(err) => Err(err)
    }
    _ => Err(JsonDecode(path~, expected="tool object"))
  }
}

///|
fn decode_run(json : Json, path : String) -> Result[SarifRun, SarifError] {
  match json {
    Object(obj) => {
      let tool = match required(obj, "tool") {
        Ok(value) => match decode_tool(value, "\{path}.tool") {
          Ok(decoded) => decoded
          Err(err) => return Err(err)
        }
        Err(err) => return Err(err)
      }
      let results = match json_get(obj, "results") {
        None => []
        Some(Array(items)) => {
          let out : Array[SarifResult] = []
          for i, item in items {
            match decode_result(item, "\{path}.results[\{i}]") {
              Ok(value) => out.push(value)
              Err(err) => return Err(err)
            }
          }
          out
        }
        Some(_) => return Err(JsonDecode(path="\{path}.results", expected="array"))
      }
      Ok({
        tool,
        results,
        artifacts: [],
        invocations: [],
        automation_id: None,
      })
    }
    _ => Err(JsonDecode(path~, expected="run object"))
  }
}

///|
pub fn SarifLog::from_json(json : Json) -> Result[SarifLog, SarifError] {
  match json {
    Object(obj) => {
      let version = match decode_string(obj, "version") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let schema = match decode_optional_string(obj, "$schema") {
        Ok(value) => value
        Err(err) => return Err(err)
      }
      let runs = match required(obj, "runs") {
        Ok(Array(items)) => {
          let out : Array[SarifRun] = []
          for i, item in items {
            match decode_run(item, "runs[\{i}]") {
              Ok(value) => out.push(value)
              Err(err) => return Err(err)
            }
          }
          out
        }
        Ok(_) => return Err(JsonDecode(path="runs", expected="array"))
        Err(err) => return Err(err)
      }
      Ok({ version, schema, runs })
    }
    _ => Err(JsonDecode(path="root", expected="object"))
  }
}

///|
pub fn SarifLog::from_json_string(text : StringView) -> Result[SarifLog, SarifError] {
  let json = @json.parse(text) catch {
    err => return Err(JsonParse(message=err.to_string()))
  }
  SarifLog::from_json(json)
}
