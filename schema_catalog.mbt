///|
/// SARIF schema field descriptors used by documentation, validation reports
/// and tool UIs that need to explain which part of a SARIF log is being
/// inspected. This is a compact MoonBit-native reference table, not a full
/// replacement for the SARIF specification.
pub struct SarifFieldDescriptor {
  object_name : String
  field_name : String
  required : Bool
  value_kind : String
  note : String
} derive(Eq, Debug, ToJson)
///|
pub fn SarifFieldDescriptor::SarifFieldDescriptor(
  object_name : StringView,
  field_name : StringView,
  required? : Bool = false,
  value_kind? : String = "string",
  note? : String = "",
) -> SarifFieldDescriptor {
  { object_name: object_name.to_owned(), field_name: field_name.to_owned(), required, value_kind, note }
}
///|
pub fn schema_field_001() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "version",
    required=true,
    value_kind="string",
    note="log.version is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_002() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "schema",
    required=false,
    value_kind="string",
    note="log.schema is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_003() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "runs",
    required=true,
    value_kind="array",
    note="log.runs is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_004() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "tool",
    required=false,
    value_kind="object",
    note="log.tool is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_005() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "results",
    required=false,
    value_kind="array",
    note="log.results is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_006() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "artifacts",
    required=false,
    value_kind="array",
    note="log.artifacts is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_007() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "invocations",
    required=false,
    value_kind="array",
    note="log.invocations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_008() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "automationDetails",
    required=false,
    value_kind="object",
    note="log.automationDetails is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_009() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "driver",
    required=false,
    value_kind="object",
    note="log.driver is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_010() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "name",
    required=false,
    value_kind="string",
    note="log.name is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_011() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "version",
    required=true,
    value_kind="string",
    note="log.version is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_012() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "informationUri",
    required=false,
    value_kind="string",
    note="log.informationUri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_013() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "rules",
    required=false,
    value_kind="array",
    note="log.rules is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_014() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "id",
    required=false,
    value_kind="string",
    note="log.id is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_015() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "shortDescription",
    required=false,
    value_kind="string",
    note="log.shortDescription is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_016() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "fullDescription",
    required=false,
    value_kind="string",
    note="log.fullDescription is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_017() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "defaultConfiguration",
    required=false,
    value_kind="object",
    note="log.defaultConfiguration is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_018() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "helpUri",
    required=false,
    value_kind="string",
    note="log.helpUri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_019() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "properties",
    required=false,
    value_kind="object",
    note="log.properties is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_020() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "ruleId",
    required=false,
    value_kind="string",
    note="log.ruleId is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_021() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "level",
    required=false,
    value_kind="string",
    note="log.level is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_022() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "kind",
    required=false,
    value_kind="string",
    note="log.kind is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_023() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "message",
    required=false,
    value_kind="object",
    note="log.message is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_024() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "locations",
    required=false,
    value_kind="array",
    note="log.locations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_025() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "partialFingerprints",
    required=false,
    value_kind="object",
    note="log.partialFingerprints is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_026() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "baselineState",
    required=false,
    value_kind="integer",
    note="log.baselineState is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_027() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "physicalLocation",
    required=false,
    value_kind="object",
    note="log.physicalLocation is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_028() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "logicalLocations",
    required=false,
    value_kind="array",
    note="log.logicalLocations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_029() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "artifactLocation",
    required=false,
    value_kind="object",
    note="log.artifactLocation is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_030() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "region",
    required=false,
    value_kind="object",
    note="log.region is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_031() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "uri",
    required=false,
    value_kind="string",
    note="log.uri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_032() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "uriBaseId",
    required=false,
    value_kind="string",
    note="log.uriBaseId is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_033() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "index",
    required=false,
    value_kind="integer",
    note="log.index is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_034() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "startLine",
    required=false,
    value_kind="integer",
    note="log.startLine is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_035() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "startColumn",
    required=false,
    value_kind="integer",
    note="log.startColumn is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_036() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "endLine",
    required=false,
    value_kind="integer",
    note="log.endLine is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_037() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "endColumn",
    required=false,
    value_kind="integer",
    note="log.endColumn is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_038() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "charOffset",
    required=false,
    value_kind="integer",
    note="log.charOffset is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_039() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "charLength",
    required=false,
    value_kind="integer",
    note="log.charLength is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_040() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "length",
    required=false,
    value_kind="integer",
    note="log.length is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_041() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "mimeType",
    required=false,
    value_kind="string",
    note="log.mimeType is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_042() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "roles",
    required=false,
    value_kind="array",
    note="log.roles is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_043() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "commandLine",
    required=false,
    value_kind="integer",
    note="log.commandLine is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_044() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "workingDirectory",
    required=false,
    value_kind="object",
    note="log.workingDirectory is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_045() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "executionSuccessful",
    required=false,
    value_kind="boolean",
    note="log.executionSuccessful is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_046() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "tags",
    required=false,
    value_kind="array",
    note="log.tags is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_047() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "securitySeverity",
    required=false,
    value_kind="string",
    note="log.securitySeverity is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_048() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "precision",
    required=false,
    value_kind="string",
    note="log.precision is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_049() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "problemSeverity",
    required=false,
    value_kind="string",
    note="log.problemSeverity is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_050() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "log",
    "stableKey",
    required=false,
    value_kind="string",
    note="log.stableKey is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_051() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "version",
    required=false,
    value_kind="string",
    note="run.version is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_052() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "schema",
    required=false,
    value_kind="string",
    note="run.schema is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_053() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "runs",
    required=false,
    value_kind="array",
    note="run.runs is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_054() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "tool",
    required=true,
    value_kind="object",
    note="run.tool is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_055() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "results",
    required=false,
    value_kind="array",
    note="run.results is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_056() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "artifacts",
    required=false,
    value_kind="array",
    note="run.artifacts is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_057() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "invocations",
    required=false,
    value_kind="array",
    note="run.invocations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_058() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "automationDetails",
    required=false,
    value_kind="object",
    note="run.automationDetails is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_059() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "driver",
    required=false,
    value_kind="object",
    note="run.driver is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_060() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "name",
    required=false,
    value_kind="string",
    note="run.name is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_061() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "version",
    required=false,
    value_kind="string",
    note="run.version is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_062() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "informationUri",
    required=false,
    value_kind="string",
    note="run.informationUri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_063() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "rules",
    required=false,
    value_kind="array",
    note="run.rules is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_064() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "id",
    required=false,
    value_kind="string",
    note="run.id is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_065() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "shortDescription",
    required=false,
    value_kind="string",
    note="run.shortDescription is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_066() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "fullDescription",
    required=false,
    value_kind="string",
    note="run.fullDescription is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_067() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "defaultConfiguration",
    required=false,
    value_kind="object",
    note="run.defaultConfiguration is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_068() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "helpUri",
    required=false,
    value_kind="string",
    note="run.helpUri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_069() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "properties",
    required=false,
    value_kind="object",
    note="run.properties is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_070() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "ruleId",
    required=false,
    value_kind="string",
    note="run.ruleId is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_071() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "level",
    required=false,
    value_kind="string",
    note="run.level is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_072() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "kind",
    required=false,
    value_kind="string",
    note="run.kind is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_073() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "message",
    required=false,
    value_kind="object",
    note="run.message is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_074() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "locations",
    required=false,
    value_kind="array",
    note="run.locations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_075() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "partialFingerprints",
    required=false,
    value_kind="object",
    note="run.partialFingerprints is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_076() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "baselineState",
    required=false,
    value_kind="integer",
    note="run.baselineState is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_077() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "physicalLocation",
    required=false,
    value_kind="object",
    note="run.physicalLocation is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_078() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "logicalLocations",
    required=false,
    value_kind="array",
    note="run.logicalLocations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_079() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "artifactLocation",
    required=false,
    value_kind="object",
    note="run.artifactLocation is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_080() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "region",
    required=false,
    value_kind="object",
    note="run.region is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_081() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "uri",
    required=false,
    value_kind="string",
    note="run.uri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_082() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "uriBaseId",
    required=false,
    value_kind="string",
    note="run.uriBaseId is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_083() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "index",
    required=false,
    value_kind="integer",
    note="run.index is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_084() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "startLine",
    required=false,
    value_kind="integer",
    note="run.startLine is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_085() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "startColumn",
    required=false,
    value_kind="integer",
    note="run.startColumn is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_086() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "endLine",
    required=false,
    value_kind="integer",
    note="run.endLine is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_087() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "endColumn",
    required=false,
    value_kind="integer",
    note="run.endColumn is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_088() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "charOffset",
    required=false,
    value_kind="integer",
    note="run.charOffset is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_089() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "charLength",
    required=false,
    value_kind="integer",
    note="run.charLength is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_090() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "length",
    required=false,
    value_kind="integer",
    note="run.length is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_091() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "mimeType",
    required=false,
    value_kind="string",
    note="run.mimeType is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_092() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "roles",
    required=false,
    value_kind="array",
    note="run.roles is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_093() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "commandLine",
    required=false,
    value_kind="integer",
    note="run.commandLine is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_094() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "workingDirectory",
    required=false,
    value_kind="object",
    note="run.workingDirectory is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_095() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "executionSuccessful",
    required=false,
    value_kind="boolean",
    note="run.executionSuccessful is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_096() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "tags",
    required=false,
    value_kind="array",
    note="run.tags is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_097() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "securitySeverity",
    required=false,
    value_kind="string",
    note="run.securitySeverity is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_098() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "precision",
    required=false,
    value_kind="string",
    note="run.precision is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_099() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "problemSeverity",
    required=false,
    value_kind="string",
    note="run.problemSeverity is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_100() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "run",
    "stableKey",
    required=false,
    value_kind="string",
    note="run.stableKey is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_101() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "version",
    required=false,
    value_kind="string",
    note="tool.version is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_102() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "schema",
    required=false,
    value_kind="string",
    note="tool.schema is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_103() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "runs",
    required=false,
    value_kind="array",
    note="tool.runs is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_104() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "tool",
    required=false,
    value_kind="object",
    note="tool.tool is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_105() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "results",
    required=false,
    value_kind="array",
    note="tool.results is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_106() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "artifacts",
    required=false,
    value_kind="array",
    note="tool.artifacts is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_107() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "invocations",
    required=false,
    value_kind="array",
    note="tool.invocations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_108() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "automationDetails",
    required=false,
    value_kind="object",
    note="tool.automationDetails is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_109() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "driver",
    required=true,
    value_kind="object",
    note="tool.driver is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_110() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "name",
    required=false,
    value_kind="string",
    note="tool.name is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_111() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "version",
    required=false,
    value_kind="string",
    note="tool.version is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_112() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "informationUri",
    required=false,
    value_kind="string",
    note="tool.informationUri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_113() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "rules",
    required=false,
    value_kind="array",
    note="tool.rules is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_114() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "id",
    required=false,
    value_kind="string",
    note="tool.id is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_115() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "shortDescription",
    required=false,
    value_kind="string",
    note="tool.shortDescription is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_116() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "fullDescription",
    required=false,
    value_kind="string",
    note="tool.fullDescription is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_117() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "defaultConfiguration",
    required=false,
    value_kind="object",
    note="tool.defaultConfiguration is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_118() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "helpUri",
    required=false,
    value_kind="string",
    note="tool.helpUri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_119() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "properties",
    required=false,
    value_kind="object",
    note="tool.properties is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_120() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "ruleId",
    required=false,
    value_kind="string",
    note="tool.ruleId is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_121() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "level",
    required=false,
    value_kind="string",
    note="tool.level is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_122() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "kind",
    required=false,
    value_kind="string",
    note="tool.kind is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_123() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "message",
    required=false,
    value_kind="object",
    note="tool.message is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_124() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "locations",
    required=false,
    value_kind="array",
    note="tool.locations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_125() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "partialFingerprints",
    required=false,
    value_kind="object",
    note="tool.partialFingerprints is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_126() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "baselineState",
    required=false,
    value_kind="integer",
    note="tool.baselineState is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_127() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "physicalLocation",
    required=false,
    value_kind="object",
    note="tool.physicalLocation is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_128() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "logicalLocations",
    required=false,
    value_kind="array",
    note="tool.logicalLocations is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_129() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "artifactLocation",
    required=false,
    value_kind="object",
    note="tool.artifactLocation is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_130() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "region",
    required=false,
    value_kind="object",
    note="tool.region is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_131() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "uri",
    required=false,
    value_kind="string",
    note="tool.uri is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_132() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "uriBaseId",
    required=false,
    value_kind="string",
    note="tool.uriBaseId is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_133() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "index",
    required=false,
    value_kind="integer",
    note="tool.index is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_134() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "startLine",
    required=false,
    value_kind="integer",
    note="tool.startLine is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_field_135() -> SarifFieldDescriptor {
  SarifFieldDescriptor::SarifFieldDescriptor(
    "tool",
    "startColumn",
    required=false,
    value_kind="integer",
    note="tool.startColumn is part of the SARIF 2.1.0 shape handled by sarifkit.",
  )
}
///|
pub fn schema_fields() -> Array[SarifFieldDescriptor] {
  [
    schema_field_001(),
    schema_field_002(),
    schema_field_003(),
    schema_field_004(),
    schema_field_005(),
    schema_field_006(),
    schema_field_007(),
    schema_field_008(),
    schema_field_009(),
    schema_field_010(),
    schema_field_011(),
    schema_field_012(),
    schema_field_013(),
    schema_field_014(),
    schema_field_015(),
    schema_field_016(),
    schema_field_017(),
    schema_field_018(),
    schema_field_019(),
    schema_field_020(),
    schema_field_021(),
    schema_field_022(),
    schema_field_023(),
    schema_field_024(),
    schema_field_025(),
    schema_field_026(),
    schema_field_027(),
    schema_field_028(),
    schema_field_029(),
    schema_field_030(),
    schema_field_031(),
    schema_field_032(),
    schema_field_033(),
    schema_field_034(),
    schema_field_035(),
    schema_field_036(),
    schema_field_037(),
    schema_field_038(),
    schema_field_039(),
    schema_field_040(),
    schema_field_041(),
    schema_field_042(),
    schema_field_043(),
    schema_field_044(),
    schema_field_045(),
    schema_field_046(),
    schema_field_047(),
    schema_field_048(),
    schema_field_049(),
    schema_field_050(),
    schema_field_051(),
    schema_field_052(),
    schema_field_053(),
    schema_field_054(),
    schema_field_055(),
    schema_field_056(),
    schema_field_057(),
    schema_field_058(),
    schema_field_059(),
    schema_field_060(),
    schema_field_061(),
    schema_field_062(),
    schema_field_063(),
    schema_field_064(),
    schema_field_065(),
    schema_field_066(),
    schema_field_067(),
    schema_field_068(),
    schema_field_069(),
    schema_field_070(),
    schema_field_071(),
    schema_field_072(),
    schema_field_073(),
    schema_field_074(),
    schema_field_075(),
    schema_field_076(),
    schema_field_077(),
    schema_field_078(),
    schema_field_079(),
    schema_field_080(),
    schema_field_081(),
    schema_field_082(),
    schema_field_083(),
    schema_field_084(),
    schema_field_085(),
    schema_field_086(),
    schema_field_087(),
    schema_field_088(),
    schema_field_089(),
    schema_field_090(),
    schema_field_091(),
    schema_field_092(),
    schema_field_093(),
    schema_field_094(),
    schema_field_095(),
    schema_field_096(),
    schema_field_097(),
    schema_field_098(),
    schema_field_099(),
    schema_field_100(),
    schema_field_101(),
    schema_field_102(),
    schema_field_103(),
    schema_field_104(),
    schema_field_105(),
    schema_field_106(),
    schema_field_107(),
    schema_field_108(),
    schema_field_109(),
    schema_field_110(),
    schema_field_111(),
    schema_field_112(),
    schema_field_113(),
    schema_field_114(),
    schema_field_115(),
    schema_field_116(),
    schema_field_117(),
    schema_field_118(),
    schema_field_119(),
    schema_field_120(),
    schema_field_121(),
    schema_field_122(),
    schema_field_123(),
    schema_field_124(),
    schema_field_125(),
    schema_field_126(),
    schema_field_127(),
    schema_field_128(),
    schema_field_129(),
    schema_field_130(),
    schema_field_131(),
    schema_field_132(),
    schema_field_133(),
    schema_field_134(),
    schema_field_135(),
  ]
}
///|
pub fn schema_fields_for(object_name : StringView) -> Array[SarifFieldDescriptor] {
  let needle = object_name.to_owned()
  schema_fields().filter(field => field.object_name == needle)
}
///|
pub fn schema_required_fields_for(object_name : StringView) -> Array[SarifFieldDescriptor] {
  schema_fields_for(object_name).filter(field => field.required)
}
///|
pub fn schema_lookup(object_name : StringView, field_name : StringView) -> SarifFieldDescriptor? {
  let object_needle = object_name.to_owned()
  let field_needle = field_name.to_owned()
  for field in schema_fields() {
    if field.object_name == object_needle && field.field_name == field_needle { return Some(field) }
  }
  None
}
///|
pub fn schema_catalog_report() -> String {
  let fields = schema_fields()
  let mut out = "sarifkit schema fields=" + fields.length().to_string()
  for field in fields {
    let marker = if field.required { " required" } else { " optional" }
    out = out + "\n" + field.object_name + "." + field.field_name + marker + " " + field.value_kind
  }
  out
}

