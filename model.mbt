///|
/// Text carried by SARIF objects. SARIF allows both plain text and Markdown;
/// the plain text form is required in most places and is kept as the stable
/// fallback for tools that do not render Markdown.
pub struct SarifMessage {
  text : String
  markdown : String?
} derive(Eq, Debug, ToJson)

///|
pub fn SarifMessage::SarifMessage(
  text : StringView,
  markdown? : String,
) -> SarifMessage {
  { text: text.to_owned(), markdown }
}

///|
/// URI location for an artifact. `uri_base_id` mirrors SARIF's `uriBaseId`
/// field and is useful when a CI runner wants relative paths anchored to a
/// checkout root.
pub struct ArtifactLocation {
  uri : String
  uri_base_id : String?
  index : Int?
} derive(Eq, Debug, ToJson)

///|
pub fn ArtifactLocation::ArtifactLocation(
  uri : StringView,
  uri_base_id? : String,
  index? : Int,
) -> ArtifactLocation {
  { uri: uri.to_owned(), uri_base_id, index }
}

///|
/// Region in an artifact. SARIF positions are one-based. End positions are
/// optional because many diagnostics naturally refer to a single point.
pub struct Region {
  start_line : Int
  start_column : Int
  end_line : Int?
  end_column : Int?
  char_offset : Int?
  char_length : Int?
} derive(Eq, Debug, ToJson)

///|
pub fn Region::Region(
  start_line : Int,
  start_column? : Int = 1,
  end_line? : Int,
  end_column? : Int,
  char_offset? : Int,
  char_length? : Int,
) -> Region {
  {
    start_line,
    start_column,
    end_line,
    end_column,
    char_offset,
    char_length,
  }
}

///|
pub fn Region::single_line(
  line : Int,
  start_column : Int,
  end_column : Int,
) -> Region {
  Region::Region(line, start_column~, end_line=line, end_column=end_column)
}

///|
pub fn Region::contains_line(self : Region, line : Int) -> Bool {
  if line < self.start_line {
    return false
  }
  match self.end_line {
    Some(end_line) => line <= end_line
    None => line == self.start_line
  }
}

///|
pub fn Region::span_text(self : Region) -> String {
  let end_line = match self.end_line {
    Some(value) => value.to_string()
    None => self.start_line.to_string()
  }
  let end_column = match self.end_column {
    Some(value) => value.to_string()
    None => self.start_column.to_string()
  }
  "\{self.start_line}:\{self.start_column}-\{end_line}:\{end_column}"
}

///|
pub struct PhysicalLocation {
  artifact_location : ArtifactLocation
  region : Region?
} derive(Eq, Debug, ToJson)

///|
pub fn PhysicalLocation::PhysicalLocation(
  artifact_location : ArtifactLocation,
  region? : Region,
) -> PhysicalLocation {
  { artifact_location, region }
}

///|
pub fn PhysicalLocation::from_path(
  uri : StringView,
  line : Int,
  column? : Int = 1,
) -> PhysicalLocation {
  {
    artifact_location: ArtifactLocation::ArtifactLocation(uri),
    region: Some(Region::Region(line, start_column=column)),
  }
}

///|
pub struct SarifLocation {
  physical_location : PhysicalLocation
  message : SarifMessage?
  logical_name : String?
} derive(Eq, Debug, ToJson)

///|
pub fn SarifLocation::SarifLocation(
  physical_location : PhysicalLocation,
  message? : SarifMessage,
  logical_name? : String,
) -> SarifLocation {
  { physical_location, message, logical_name }
}

///|
pub fn SarifLocation::from_path(
  uri : StringView,
  line : Int,
  column? : Int = 1,
  message? : String,
) -> SarifLocation {
  {
    physical_location: PhysicalLocation::from_path(uri, line, column~),
    message: message.map(text => SarifMessage::SarifMessage(text)),
    logical_name: None,
  }
}

///|
pub struct Artifact {
  location : ArtifactLocation
  length : Int?
  mime_type : String?
  roles : Array[String]
} derive(Eq, Debug, ToJson)

///|
pub fn Artifact::Artifact(
  uri : StringView,
  length? : Int,
  mime_type? : String,
  roles? : ArrayView[String] = [],
) -> Artifact {
  {
    location: ArtifactLocation::ArtifactLocation(uri),
    length,
    mime_type,
    roles: roles.to_owned(),
  }
}

///|
pub struct SarifRule {
  id : String
  name : String?
  short_description : SarifMessage?
  full_description : SarifMessage?
  default_level : String
  help_uri : String?
  tags : Array[String]
} derive(Eq, Debug, ToJson)

///|
pub fn SarifRule::SarifRule(
  id : StringView,
  name? : String,
  short_description? : String,
  full_description? : String,
  default_level? : String = "warning",
  help_uri? : String,
  tags? : ArrayView[String] = [],
) -> SarifRule {
  {
    id: id.to_owned(),
    name,
    short_description: short_description.map(text => SarifMessage::SarifMessage(text)),
    full_description: full_description.map(text => SarifMessage::SarifMessage(text)),
    default_level,
    help_uri,
    tags: tags.to_owned(),
  }
}

///|
pub struct ToolDriver {
  name : String
  version : String?
  information_uri : String?
  rules : Array[SarifRule]
} derive(Eq, Debug, ToJson)

///|
pub fn ToolDriver::ToolDriver(
  name : StringView,
  version? : String,
  information_uri? : String,
  rules? : ArrayView[SarifRule] = [],
) -> ToolDriver {
  {
    name: name.to_owned(),
    version,
    information_uri,
    rules: rules.to_owned(),
  }
}

///|
pub struct Fingerprint {
  key : String
  value : String
} derive(Eq, Debug, ToJson)

///|
pub fn Fingerprint::Fingerprint(key : StringView, value : StringView) -> Fingerprint {
  { key: key.to_owned(), value: value.to_owned() }
}

///|
pub struct SarifProperty {
  key : String
  value : String
} derive(Eq, Debug, ToJson)

///|
pub fn SarifProperty::SarifProperty(
  key : StringView,
  value : StringView,
) -> SarifProperty {
  { key: key.to_owned(), value: value.to_owned() }
}

///|
pub struct SarifResult {
  rule_id : String
  level : String
  kind : String
  message : SarifMessage
  locations : Array[SarifLocation]
  fingerprints : Array[Fingerprint]
  properties : Array[SarifProperty]
  baseline_state : String?
} derive(Eq, Debug, ToJson)

///|
pub fn SarifResult::SarifResult(
  rule_id : StringView,
  message : StringView,
  level? : String = "warning",
  kind? : String = "fail",
  locations? : ArrayView[SarifLocation] = [],
  fingerprints? : ArrayView[Fingerprint] = [],
  properties? : ArrayView[SarifProperty] = [],
  baseline_state? : String,
) -> SarifResult {
  {
    rule_id: rule_id.to_owned(),
    level,
    kind,
    message: SarifMessage::SarifMessage(message),
    locations: locations.to_owned(),
    fingerprints: fingerprints.to_owned(),
    properties: properties.to_owned(),
    baseline_state,
  }
}

///|
pub fn SarifResult::primary_uri(self : SarifResult) -> String? {
  if self.locations.length() == 0 {
    None
  } else {
    Some(self.locations[0].physical_location.artifact_location.uri)
  }
}

///|
pub fn SarifResult::primary_region(self : SarifResult) -> Region? {
  if self.locations.length() == 0 {
    None
  } else {
    self.locations[0].physical_location.region
  }
}

///|
pub fn SarifResult::fingerprint_value(
  self : SarifResult,
  key : StringView,
) -> String? {
  let needle = key.to_owned()
  for item in self.fingerprints {
    if item.key == needle {
      return Some(item.value)
    }
  }
  None
}

///|
pub fn SarifResult::property_value(
  self : SarifResult,
  key : StringView,
) -> String? {
  let needle = key.to_owned()
  for item in self.properties {
    if item.key == needle {
      return Some(item.value)
    }
  }
  None
}

///|
pub struct SarifInvocation {
  command_line : String?
  working_directory : String?
  execution_successful : Bool
} derive(Eq, Debug, ToJson)

///|
pub fn SarifInvocation::SarifInvocation(
  command_line? : String,
  working_directory? : String,
  execution_successful? : Bool = true,
) -> SarifInvocation {
  { command_line, working_directory, execution_successful }
}

///|
pub struct SarifRun {
  tool : ToolDriver
  results : Array[SarifResult]
  artifacts : Array[Artifact]
  invocations : Array[SarifInvocation]
  automation_id : String?
} derive(Eq, Debug, ToJson)

///|
pub fn SarifRun::SarifRun(
  tool : ToolDriver,
  results? : ArrayView[SarifResult] = [],
  artifacts? : ArrayView[Artifact] = [],
  invocations? : ArrayView[SarifInvocation] = [],
  automation_id? : String,
) -> SarifRun {
  {
    tool,
    results: results.to_owned(),
    artifacts: artifacts.to_owned(),
    invocations: invocations.to_owned(),
    automation_id,
  }
}

///|
pub struct SarifLog {
  version : String
  schema : String?
  runs : Array[SarifRun]
} derive(Eq, Debug, ToJson)

///|
pub fn SarifLog::SarifLog(
  runs : ArrayView[SarifRun],
  schema? : String = "https://json.schemastore.org/sarif-2.1.0.json",
) -> SarifLog {
  { version: "2.1.0", schema: Some(schema), runs: runs.to_owned() }
}

///|
pub struct SarifDiagnostic {
  severity : String
  code : String
  path : String
  message : String
} derive(Eq, Debug, ToJson)

///|
pub fn SarifDiagnostic::SarifDiagnostic(
  severity : StringView,
  code : StringView,
  path : StringView,
  message : StringView,
) -> SarifDiagnostic {
  {
    severity: severity.to_owned(),
    code: code.to_owned(),
    path: path.to_owned(),
    message: message.to_owned(),
  }
}

///|
pub(all) enum SarifError {
  JsonParse(message~ : String)
  JsonDecode(path~ : String, expected~ : String)
  MissingField(field~ : String)
  InvalidField(field~ : String, message~ : String)
} derive(Eq, Debug, ToJson)

///|
pub fn SarifError::message(self : SarifError) -> String {
  match self {
    JsonParse(message~) => "JSON parse error: \{message}"
    JsonDecode(path~, expected~) =>
      "JSON decode error at \{path}: expected \{expected}"
    MissingField(field~) => "missing required field: \{field}"
    InvalidField(field~, message~) => "invalid field \{field}: \{message}"
  }
}

///|
pub fn known_levels() -> Array[String] {
  ["none", "note", "warning", "error"]
}

///|
pub fn known_kinds() -> Array[String] {
  ["fail", "open", "review", "pass", "informational", "notApplicable"]
}

///|
pub fn known_baseline_states() -> Array[String] {
  ["new", "unchanged", "updated", "absent"]
}

///|
pub fn normalize_level(level : StringView) -> String {
  let text = level.trim().to_owned()
  match text {
    "fatal" | "critical" | "high" => "error"
    "medium" | "warn" => "warning"
    "low" | "info" | "notice" => "note"
    "none" | "note" | "warning" | "error" => text
    _ => text
  }
}

///|
pub fn is_known_level(level : StringView) -> Bool {
  known_levels().contains(normalize_level(level))
}

///|
pub fn level_rank(level : StringView) -> Int {
  match normalize_level(level) {
    "error" => 3
    "warning" => 2
    "note" => 1
    _ => 0
  }
}

///|
pub fn level_at_least(level : StringView, minimum : StringView) -> Bool {
  level_rank(level) >= level_rank(minimum)
}

///|
pub fn is_known_kind(kind : StringView) -> Bool {
  known_kinds().contains(kind.to_owned())
}

///|
pub fn is_known_baseline_state(state : StringView) -> Bool {
  known_baseline_states().contains(state.to_owned())
}

///|
pub fn is_blank(text : StringView) -> Bool {
  text.trim().length() == 0
}

///|
pub fn first_non_empty(primary : StringView, fallback : StringView) -> String {
  if is_blank(primary) {
    fallback.to_owned()
  } else {
    primary.to_owned()
  }
}
