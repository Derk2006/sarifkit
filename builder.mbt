///|
/// Mutable builder for constructing a single-run SARIF log.
pub struct SarifBuilder {
  tool_name : String
  mut tool_version : String?
  mut information_uri : String?
  rules : Array[SarifRule]
  results : Array[SarifResult]
  artifacts : Array[Artifact]
  invocations : Array[SarifInvocation]
  mut automation_id : String?
} derive(Debug)

///|
pub fn SarifBuilder::SarifBuilder(
  tool_name : StringView,
  tool_version? : String,
  information_uri? : String,
) -> SarifBuilder {
  {
    tool_name: tool_name.to_owned(),
    tool_version,
    information_uri,
    rules: [],
    results: [],
    artifacts: [],
    invocations: [],
    automation_id: None,
  }
}

///|
pub fn SarifBuilder::set_tool_version(
  self : SarifBuilder,
  version : StringView,
) -> Unit {
  self.tool_version = Some(version.to_owned())
}

///|
pub fn SarifBuilder::set_information_uri(
  self : SarifBuilder,
  uri : StringView,
) -> Unit {
  self.information_uri = Some(uri.to_owned())
}

///|
pub fn SarifBuilder::set_automation_id(
  self : SarifBuilder,
  id : StringView,
) -> Unit {
  self.automation_id = Some(id.to_owned())
}

///|
pub fn SarifBuilder::rule_count(self : SarifBuilder) -> Int {
  self.rules.length()
}

///|
pub fn SarifBuilder::result_count(self : SarifBuilder) -> Int {
  self.results.length()
}

///|
pub fn SarifBuilder::artifact_count(self : SarifBuilder) -> Int {
  self.artifacts.length()
}

///|
fn find_rule_index(rules : ArrayView[SarifRule], id : StringView) -> Int? {
  let needle = id.to_owned()
  for i, rule in rules {
    if rule.id == needle {
      return Some(i)
    }
  }
  None
}

///|
fn find_artifact_index(
  artifacts : ArrayView[Artifact],
  uri : StringView,
) -> Int? {
  let needle = uri.to_owned()
  for i, artifact in artifacts {
    if artifact.location.uri == needle {
      return Some(i)
    }
  }
  None
}

///|
pub fn SarifBuilder::add_rule(
  self : SarifBuilder,
  id : StringView,
  name? : String,
  short_description? : String,
  default_level? : String = "warning",
  tags? : ArrayView[String] = [],
) -> Int {
  match find_rule_index(self.rules, id) {
    Some(index) => index
    None => {
      let index = self.rules.length()
      self.rules.push({
        id: id.to_owned(),
        name,
        short_description: short_description.map(text => {
          SarifMessage::SarifMessage(text)
        }),
        full_description: None,
        default_level: normalize_level(default_level),
        help_uri: None,
        tags: tags.to_owned(),
      })
      index
    }
  }
}

///|
pub fn SarifBuilder::add_rule_object(
  self : SarifBuilder,
  rule : SarifRule,
) -> Int {
  match find_rule_index(self.rules, rule.id) {
    Some(index) => index
    None => {
      let index = self.rules.length()
      self.rules.push(rule)
      index
    }
  }
}

///|
pub fn SarifBuilder::add_artifact(
  self : SarifBuilder,
  uri : StringView,
  length? : Int,
  mime_type? : String,
  roles? : ArrayView[String] = [],
) -> Int {
  match find_artifact_index(self.artifacts, uri) {
    Some(index) => index
    None => {
      let index = self.artifacts.length()
      let artifact = {
        location: ArtifactLocation::ArtifactLocation(uri),
        length,
        mime_type,
        roles: roles.to_owned(),
      }
      self.artifacts.push(artifact)
      index
    }
  }
}

///|
pub fn SarifBuilder::add_invocation(
  self : SarifBuilder,
  command_line? : String,
  working_directory? : String,
  execution_successful? : Bool = true,
) -> Unit {
  self.invocations.push({
    command_line,
    working_directory,
    execution_successful,
  })
}

///|
pub fn SarifBuilder::add_result(
  self : SarifBuilder,
  rule_id : StringView,
  message : StringView,
  level? : String = "warning",
  uri? : String,
  line? : Int,
  column? : Int = 1,
) -> Int {
  self.add_rule(rule_id, default_level=level) |> ignore
  let locations : Array[SarifLocation] = []
  if uri is Some(path) {
    self.add_artifact(path) |> ignore
    let row = match line {
      Some(value) => value
      None => 1
    }
    locations.push(SarifLocation::from_path(path, row, column~))
  }
  let result = SarifResult::SarifResult(
    rule_id,
    message,
    level=normalize_level(level),
    locations~,
  )
  let index = self.results.length()
  self.results.push(result)
  index
}

///|
pub fn SarifBuilder::add_result_object(
  self : SarifBuilder,
  result : SarifResult,
) -> Int {
  self.add_rule(result.rule_id, default_level=result.level) |> ignore
  if result.primary_uri() is Some(uri) {
    self.add_artifact(uri) |> ignore
  }
  let index = self.results.length()
  self.results.push(result)
  index
}

///|
pub fn SarifBuilder::add_fingerprinted_result(
  self : SarifBuilder,
  rule_id : StringView,
  message : StringView,
  uri : StringView,
  line : Int,
  column? : Int = 1,
  level? : String = "warning",
) -> Int {
  let location = SarifLocation::from_path(uri, line, column~)
  let key = stable_result_key(rule_id, message, uri, line, column)
  let result = SarifResult::SarifResult(
    rule_id,
    message,
    level=normalize_level(level),
    locations=[location],
    fingerprints=[Fingerprint::Fingerprint("stableKey", key)],
  )
  self.add_result_object(result)
}

///|
pub fn SarifBuilder::run(self : SarifBuilder) -> SarifRun {
  let driver = {
    name: self.tool_name,
    version: self.tool_version,
    information_uri: self.information_uri,
    rules: self.rules.copy(),
  }
  {
    tool: driver,
    results: self.results.copy(),
    artifacts: self.artifacts.copy(),
    invocations: self.invocations.copy(),
    automation_id: self.automation_id,
  }
}

///|
pub fn SarifBuilder::log(self : SarifBuilder) -> SarifLog {
  SarifLog::SarifLog([self.run()])
}

///|
pub fn quick_log(
  tool_name : StringView,
  rule_id : StringView,
  message : StringView,
  uri : StringView,
  line : Int,
  column? : Int = 1,
  level? : String = "warning",
) -> SarifLog {
  let builder = SarifBuilder::SarifBuilder(tool_name)
  builder.add_fingerprinted_result(rule_id, message, uri, line, column~, level~)
  |> ignore
  builder.log()
}
