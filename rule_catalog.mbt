///|
/// Curated reusable rule templates for SARIF-producing MoonBit tools.
/// The catalog is intentionally domain-neutral: package validators, linters,
/// build tools and security scanners can reuse these descriptors as stable
/// defaults and then attach project-specific results.
///|
pub fn catalog_rule_sk001() -> SarifRule {
  SarifRule::SarifRule(
    "SK001",
    name="secret-literal",
    short_description="Secret-like literal should not be committed",
    full_description="Secret-like literal should not be committed. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk001",
    tags=["security", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk002() -> SarifRule {
  SarifRule::SarifRule(
    "SK002",
    name="weak-random",
    short_description="Weak random source used for security-sensitive code",
    full_description="Weak random source used for security-sensitive code. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk002",
    tags=["security", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk003() -> SarifRule {
  SarifRule::SarifRule(
    "SK003",
    name="insecure-url",
    short_description="HTTP URL appears in release configuration",
    full_description="HTTP URL appears in release configuration. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk003",
    tags=["security", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk004() -> SarifRule {
  SarifRule::SarifRule(
    "SK004",
    name="wide-permission",
    short_description="Permission scope is wider than required",
    full_description="Permission scope is wider than required. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk004",
    tags=["security", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk005() -> SarifRule {
  SarifRule::SarifRule(
    "SK005",
    name="missing-license",
    short_description="Distributed artifact has no license declaration",
    full_description="Distributed artifact has no license declaration. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk005",
    tags=["compliance", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk006() -> SarifRule {
  SarifRule::SarifRule(
    "SK006",
    name="unknown-license",
    short_description="License expression is not recognized",
    full_description="License expression is not recognized. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk006",
    tags=["compliance", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk007() -> SarifRule {
  SarifRule::SarifRule(
    "SK007",
    name="missing-readme",
    short_description="Package has no README",
    full_description="Package has no README. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk007",
    tags=["documentation", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk008() -> SarifRule {
  SarifRule::SarifRule(
    "SK008",
    name="stale-changelog",
    short_description="Changelog does not mention current version",
    full_description="Changelog does not mention current version. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk008",
    tags=["documentation", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk009() -> SarifRule {
  SarifRule::SarifRule(
    "SK009",
    name="empty-description",
    short_description="Package description is empty",
    full_description="Package description is empty. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk009",
    tags=["metadata", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk010() -> SarifRule {
  SarifRule::SarifRule(
    "SK010",
    name="missing-repository",
    short_description="Package repository URL is missing",
    full_description="Package repository URL is missing. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk010",
    tags=["metadata", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk011() -> SarifRule {
  SarifRule::SarifRule(
    "SK011",
    name="untracked-example",
    short_description="Runnable example is not referenced by README",
    full_description="Runnable example is not referenced by README. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk011",
    tags=["examples", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk012() -> SarifRule {
  SarifRule::SarifRule(
    "SK012",
    name="example-fails",
    short_description="Example command failed during verification",
    full_description="Example command failed during verification. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk012",
    tags=["examples", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk013() -> SarifRule {
  SarifRule::SarifRule(
    "SK013",
    name="test-gap",
    short_description="Public API lacks focused tests",
    full_description="Public API lacks focused tests. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk013",
    tags=["testing", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk014() -> SarifRule {
  SarifRule::SarifRule(
    "SK014",
    name="ci-missing",
    short_description="Repository has no CI workflow",
    full_description="Repository has no CI workflow. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk014",
    tags=["ci", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk015() -> SarifRule {
  SarifRule::SarifRule(
    "SK015",
    name="ci-too-narrow",
    short_description="CI workflow misses build or test step",
    full_description="CI workflow misses build or test step. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk015",
    tags=["ci", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk016() -> SarifRule {
  SarifRule::SarifRule(
    "SK016",
    name="large-file",
    short_description="Large file should be excluded or justified",
    full_description="Large file should be excluded or justified. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk016",
    tags=["repository", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk017() -> SarifRule {
  SarifRule::SarifRule(
    "SK017",
    name="generated-artifact",
    short_description="Generated build artifact is committed",
    full_description="Generated build artifact is committed. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk017",
    tags=["repository", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk018() -> SarifRule {
  SarifRule::SarifRule(
    "SK018",
    name="unstable-api",
    short_description="Public API exposes unstable naming",
    full_description="Public API exposes unstable naming. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk018",
    tags=["api", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk019() -> SarifRule {
  SarifRule::SarifRule(
    "SK019",
    name="ambiguous-error",
    short_description="Error message lacks actionable context",
    full_description="Error message lacks actionable context. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk019",
    tags=["api", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk020() -> SarifRule {
  SarifRule::SarifRule(
    "SK020",
    name="panic-path",
    short_description="Library path may panic instead of returning Result",
    full_description="Library path may panic instead of returning Result. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk020",
    tags=["api", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk021() -> SarifRule {
  SarifRule::SarifRule(
    "SK021",
    name="path-assumption",
    short_description="Path handling assumes one operating system",
    full_description="Path handling assumes one operating system. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk021",
    tags=["portability", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk022() -> SarifRule {
  SarifRule::SarifRule(
    "SK022",
    name="clock-assumption",
    short_description="Logic depends on wall clock time",
    full_description="Logic depends on wall clock time. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk022",
    tags=["determinism", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk023() -> SarifRule {
  SarifRule::SarifRule(
    "SK023",
    name="order-unstable",
    short_description="Report output is not deterministic",
    full_description="Report output is not deterministic. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk023",
    tags=["determinism", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk024() -> SarifRule {
  SarifRule::SarifRule(
    "SK024",
    name="duplicate-rule",
    short_description="Rule id is declared more than once",
    full_description="Rule id is declared more than once. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk024",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk025() -> SarifRule {
  SarifRule::SarifRule(
    "SK025",
    name="missing-location",
    short_description="Result does not carry a physical location",
    full_description="Result does not carry a physical location. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk025",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk026() -> SarifRule {
  SarifRule::SarifRule(
    "SK026",
    name="unknown-level",
    short_description="Result level is not SARIF standard",
    full_description="Result level is not SARIF standard. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk026",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk027() -> SarifRule {
  SarifRule::SarifRule(
    "SK027",
    name="invalid-region",
    short_description="Region uses invalid one-based coordinates",
    full_description="Region uses invalid one-based coordinates. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk027",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk028() -> SarifRule {
  SarifRule::SarifRule(
    "SK028",
    name="empty-message",
    short_description="SARIF message text is empty",
    full_description="SARIF message text is empty. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk028",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk029() -> SarifRule {
  SarifRule::SarifRule(
    "SK029",
    name="missing-fingerprint",
    short_description="Result has no stable fingerprint",
    full_description="Result has no stable fingerprint. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk029",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk030() -> SarifRule {
  SarifRule::SarifRule(
    "SK030",
    name="baseline-drift",
    short_description="Baseline state is inconsistent with comparison",
    full_description="Baseline state is inconsistent with comparison. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk030",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk031() -> SarifRule {
  SarifRule::SarifRule(
    "SK031",
    name="oversized-report",
    short_description="SARIF report has too many results for CI upload",
    full_description="SARIF report has too many results for CI upload. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk031",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk032() -> SarifRule {
  SarifRule::SarifRule(
    "SK032",
    name="missing-tool-version",
    short_description="Tool driver has no version",
    full_description="Tool driver has no version. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk032",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk033() -> SarifRule {
  SarifRule::SarifRule(
    "SK033",
    name="missing-help-uri",
    short_description="Rule has no help URI",
    full_description="Rule has no help URI. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="note",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk033",
    tags=["documentation", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk034() -> SarifRule {
  SarifRule::SarifRule(
    "SK034",
    name="tagless-rule",
    short_description="Rule has no taxonomy tags",
    full_description="Rule has no taxonomy tags. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="note",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk034",
    tags=["documentation", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk035() -> SarifRule {
  SarifRule::SarifRule(
    "SK035",
    name="absolute-path",
    short_description="Report contains absolute local path",
    full_description="Report contains absolute local path. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk035",
    tags=["privacy", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk036() -> SarifRule {
  SarifRule::SarifRule(
    "SK036",
    name="user-path",
    short_description="Report may expose user-specific path segments",
    full_description="Report may expose user-specific path segments. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk036",
    tags=["privacy", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk037() -> SarifRule {
  SarifRule::SarifRule(
    "SK037",
    name="binary-content",
    short_description="Text report includes binary-looking content",
    full_description="Text report includes binary-looking content. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk037",
    tags=["privacy", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk038() -> SarifRule {
  SarifRule::SarifRule(
    "SK038",
    name="token-shaped-text",
    short_description="Report contains token-shaped text",
    full_description="Report contains token-shaped text. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk038",
    tags=["privacy", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk039() -> SarifRule {
  SarifRule::SarifRule(
    "SK039",
    name="unbounded-array",
    short_description="Array growth is not bounded by policy",
    full_description="Array growth is not bounded by policy. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk039",
    tags=["performance", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk040() -> SarifRule {
  SarifRule::SarifRule(
    "SK040",
    name="quadratic-scan",
    short_description="Nested scan may be expensive on large reports",
    full_description="Nested scan may be expensive on large reports. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk040",
    tags=["performance", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk041() -> SarifRule {
  SarifRule::SarifRule(
    "SK041",
    name="missing-limit",
    short_description="CLI accepts no result limit",
    full_description="CLI accepts no result limit. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="note",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk041",
    tags=["performance", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk042() -> SarifRule {
  SarifRule::SarifRule(
    "SK042",
    name="slow-json",
    short_description="JSON conversion repeatedly rebuilds objects",
    full_description="JSON conversion repeatedly rebuilds objects. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="note",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk042",
    tags=["performance", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk043() -> SarifRule {
  SarifRule::SarifRule(
    "SK043",
    name="unchecked-json",
    short_description="JSON input type is not checked before decoding",
    full_description="JSON input type is not checked before decoding. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk043",
    tags=["parser", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk044() -> SarifRule {
  SarifRule::SarifRule(
    "SK044",
    name="lossy-json",
    short_description="JSON roundtrip drops supported fields",
    full_description="JSON roundtrip drops supported fields. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk044",
    tags=["parser", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk045() -> SarifRule {
  SarifRule::SarifRule(
    "SK045",
    name="bad-default",
    short_description="Default value weakens validation",
    full_description="Default value weakens validation. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk045",
    tags=["config", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk046() -> SarifRule {
  SarifRule::SarifRule(
    "SK046",
    name="silent-ignore",
    short_description="Configuration silently ignores unknown fields",
    full_description="Configuration silently ignores unknown fields. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="warning",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk046",
    tags=["config", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk047() -> SarifRule {
  SarifRule::SarifRule(
    "SK047",
    name="no-schema",
    short_description="Output does not include SARIF schema URI",
    full_description="Output does not include SARIF schema URI. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="note",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk047",
    tags=["config", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk048() -> SarifRule {
  SarifRule::SarifRule(
    "SK048",
    name="no-automation-id",
    short_description="Run lacks automation id in CI context",
    full_description="Run lacks automation id in CI context. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="note",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk048",
    tags=["ci", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk049() -> SarifRule {
  SarifRule::SarifRule(
    "SK049",
    name="failed-invocation",
    short_description="Invocation marks execution unsuccessful",
    full_description="Invocation marks execution unsuccessful. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="error",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk049",
    tags=["ci", "sarifkit"],
  )
}
///|
pub fn catalog_rule_sk050() -> SarifRule {
  SarifRule::SarifRule(
    "SK050",
    name="empty-artifacts",
    short_description="Run has results but no artifact list",
    full_description="Run has results but no artifact list. The rule is provided by the sarifkit reusable catalog and can be used directly or copied into a tool-specific rule set.",
    default_level="note",
    help_uri="https://github.com/Derk2006/sarifkit/tree/master/docs/rules#sk050",
    tags=["sarif", "sarifkit"],
  )
}
///|
pub fn catalog_rules() -> Array[SarifRule] {
  [
    catalog_rule_sk001(),
    catalog_rule_sk002(),
    catalog_rule_sk003(),
    catalog_rule_sk004(),
    catalog_rule_sk005(),
    catalog_rule_sk006(),
    catalog_rule_sk007(),
    catalog_rule_sk008(),
    catalog_rule_sk009(),
    catalog_rule_sk010(),
    catalog_rule_sk011(),
    catalog_rule_sk012(),
    catalog_rule_sk013(),
    catalog_rule_sk014(),
    catalog_rule_sk015(),
    catalog_rule_sk016(),
    catalog_rule_sk017(),
    catalog_rule_sk018(),
    catalog_rule_sk019(),
    catalog_rule_sk020(),
    catalog_rule_sk021(),
    catalog_rule_sk022(),
    catalog_rule_sk023(),
    catalog_rule_sk024(),
    catalog_rule_sk025(),
    catalog_rule_sk026(),
    catalog_rule_sk027(),
    catalog_rule_sk028(),
    catalog_rule_sk029(),
    catalog_rule_sk030(),
    catalog_rule_sk031(),
    catalog_rule_sk032(),
    catalog_rule_sk033(),
    catalog_rule_sk034(),
    catalog_rule_sk035(),
    catalog_rule_sk036(),
    catalog_rule_sk037(),
    catalog_rule_sk038(),
    catalog_rule_sk039(),
    catalog_rule_sk040(),
    catalog_rule_sk041(),
    catalog_rule_sk042(),
    catalog_rule_sk043(),
    catalog_rule_sk044(),
    catalog_rule_sk045(),
    catalog_rule_sk046(),
    catalog_rule_sk047(),
    catalog_rule_sk048(),
    catalog_rule_sk049(),
    catalog_rule_sk050(),
  ]
}
///|
pub fn catalog_rule_ids() -> Array[String] {
  catalog_rules().map(rule => rule.id)
}
///|
pub fn catalog_rules_by_tag(tag : StringView) -> Array[SarifRule] {
  let needle = tag.to_owned()
  catalog_rules().filter(rule => rule.tags.contains(needle))
}
///|
pub fn catalog_rules_by_level(minimum : StringView) -> Array[SarifRule] {
  catalog_rules().filter(rule => level_at_least(rule.default_level, minimum))
}
///|
pub fn catalog_lookup(rule_id : StringView) -> SarifRule? {
  let needle = rule_id.to_owned()
  for rule in catalog_rules() {
    if rule.id == needle { return Some(rule) }
  }
  None
}
///|
pub fn catalog_report() -> String {
  let rules = catalog_rules()
  let mut out = "sarifkit catalog rules=" + rules.length().to_string()
  for rule in rules {
    out = out + "\n" + rule.id + " " + rule.default_level + " " + rule.name.unwrap_or("")
  }
  out
}

