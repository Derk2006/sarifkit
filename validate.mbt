///|
pub struct SarifValidationPolicy {
  require_results_have_locations : Bool
  require_declared_rules : Bool
  require_artifacts_for_locations : Bool
  min_level : String
  max_results_per_run : Int?
} derive(Eq, Debug, ToJson)

///|
pub fn SarifValidationPolicy::SarifValidationPolicy(
  require_results_have_locations? : Bool = true,
  require_declared_rules? : Bool = true,
  require_artifacts_for_locations? : Bool = false,
  min_level? : String = "none",
  max_results_per_run? : Int,
) -> SarifValidationPolicy {
  {
    require_results_have_locations,
    require_declared_rules,
    require_artifacts_for_locations,
    min_level: normalize_level(min_level),
    max_results_per_run,
  }
}

///|
pub fn default_validation_policy() -> SarifValidationPolicy {
  SarifValidationPolicy::SarifValidationPolicy()
}

///|
fn push_error(
  out : Array[SarifDiagnostic],
  code : StringView,
  path : StringView,
  message : StringView,
) -> Unit {
  out.push(SarifDiagnostic::SarifDiagnostic("error", code, path, message))
}

///|
fn push_warning(
  out : Array[SarifDiagnostic],
  code : StringView,
  path : StringView,
  message : StringView,
) -> Unit {
  out.push(SarifDiagnostic::SarifDiagnostic("warning", code, path, message))
}

///|
fn rule_exists(rules : ArrayView[SarifRule], id : StringView) -> Bool {
  let needle = id.to_owned()
  for rule in rules {
    if rule.id == needle {
      return true
    }
  }
  false
}

///|
fn artifact_exists(artifacts : ArrayView[Artifact], uri : StringView) -> Bool {
  let needle = uri.to_owned()
  for artifact in artifacts {
    if artifact.location.uri == needle {
      return true
    }
  }
  false
}

///|
fn validate_region(
  region : Region,
  path : StringView,
  out : Array[SarifDiagnostic],
) -> Unit {
  if region.start_line < 1 {
    push_error(out, "region.startLine", path, "startLine must be one-based")
  }
  if region.start_column < 1 {
    push_error(out, "region.startColumn", path, "startColumn must be one-based")
  }
  if region.end_line is Some(end_line) {
    if end_line < region.start_line {
      push_error(
        out, "region.endLine", path, "endLine must not precede startLine",
      )
    }
  }
  if region.end_column is Some(end_column) {
    if end_column < 1 {
      push_error(out, "region.endColumn", path, "endColumn must be one-based")
    }
  }
  if region.char_offset is Some(offset) {
    if offset < 0 {
      push_error(
        out, "region.charOffset", path, "charOffset must be non-negative",
      )
    }
  }
  if region.char_length is Some(length) {
    if length < 0 {
      push_error(
        out, "region.charLength", path, "charLength must be non-negative",
      )
    }
  }
}

///|
fn validate_location(
  location : SarifLocation,
  path : StringView,
  artifacts : ArrayView[Artifact],
  policy : SarifValidationPolicy,
  out : Array[SarifDiagnostic],
) -> Unit {
  let uri = location.physical_location.artifact_location.uri
  if is_blank(uri) {
    push_error(
      out, "location.uri", path, "artifactLocation.uri must be non-empty",
    )
  }
  if policy.require_artifacts_for_locations && !artifact_exists(artifacts, uri) {
    push_warning(
      out, "location.artifact", path, "location uri is not listed in artifacts",
    )
  }
  if location.physical_location.region is Some(region) {
    validate_region(region, "\{path}.physicalLocation.region", out)
  }
}

///|
fn validate_rule(
  rule : SarifRule,
  path : StringView,
  out : Array[SarifDiagnostic],
) -> Unit {
  if is_blank(rule.id) {
    push_error(out, "rule.id", path, "rule id must be non-empty")
  }
  if !is_known_level(rule.default_level) {
    push_warning(
      out, "rule.level", path, "rule default level is not a standard SARIF level",
    )
  }
  if rule.tags.length() == 0 {
    push_warning(out, "rule.tags", path, "rule has no tags")
  }
}

///|
fn validate_result(
  result : SarifResult,
  path : StringView,
  run : SarifRun,
  policy : SarifValidationPolicy,
  out : Array[SarifDiagnostic],
) -> Unit {
  if is_blank(result.rule_id) {
    push_error(out, "result.ruleId", path, "result ruleId must be non-empty")
  }
  if policy.require_declared_rules &&
    !rule_exists(run.tool.rules, result.rule_id) {
    push_warning(
      out, "result.ruleId", path, "result references an undeclared rule",
    )
  }
  if !is_known_level(result.level) {
    push_warning(
      out, "result.level", path, "result level is not a standard SARIF level",
    )
  }
  if !is_known_kind(result.kind) {
    push_warning(
      out, "result.kind", path, "result kind is not a standard SARIF kind",
    )
  }
  if is_blank(result.message.text) {
    push_error(
      out, "result.message", path, "result message text must be non-empty",
    )
  }
  if policy.require_results_have_locations && result.locations.length() == 0 {
    push_warning(
      out, "result.locations", path, "result has no physical location",
    )
  }
  if !level_at_least(result.level, policy.min_level) {
    push_warning(
      out, "result.level.min", path, "result is below the configured minimum level",
    )
  }
  if result.baseline_state is Some(state) {
    if !is_known_baseline_state(state) {
      push_warning(
        out, "result.baselineState", path, "baselineState is not a standard SARIF value",
      )
    }
  }
  for i, location in result.locations {
    validate_location(
      location,
      "\{path}.locations[\{i}]",
      run.artifacts,
      policy,
      out,
    )
  }
}

///|
pub fn SarifRun::validate_with_policy(
  self : SarifRun,
  policy : SarifValidationPolicy,
) -> Array[SarifDiagnostic] {
  let out : Array[SarifDiagnostic] = []
  if is_blank(self.tool.name) {
    push_error(
      out, "tool.driver.name", "tool.driver", "tool driver name must be non-empty",
    )
  }
  if self.tool.rules.length() == 0 {
    push_warning(
      out, "tool.rules", "tool.driver.rules", "tool declares no rules",
    )
  }
  for i, rule in self.tool.rules {
    validate_rule(rule, "tool.driver.rules[\{i}]", out)
  }
  if policy.max_results_per_run is Some(max) {
    if self.results.length() > max {
      push_warning(
        out, "run.results.max", "results", "run exceeds configured result limit",
      )
    }
  }
  for i, result in self.results {
    validate_result(result, "results[\{i}]", self, policy, out)
  }
  out
}

///|
pub fn SarifRun::validate(self : SarifRun) -> Array[SarifDiagnostic] {
  self.validate_with_policy(default_validation_policy())
}

///|
pub fn SarifLog::validate_with_policy(
  self : SarifLog,
  policy : SarifValidationPolicy,
) -> Array[SarifDiagnostic] {
  let out : Array[SarifDiagnostic] = []
  if self.version != "2.1.0" {
    push_error(out, "log.version", "version", "SARIF version must be 2.1.0")
  }
  if self.runs.length() == 0 {
    push_error(
      out, "log.runs", "runs", "SARIF log must contain at least one run",
    )
  }
  for i, run in self.runs {
    for diag in run.validate_with_policy(policy) {
      out.push({ ..diag, path: "runs[\{i}].\{diag.path}" })
    }
  }
  out
}

///|
pub fn SarifLog::validate(self : SarifLog) -> Array[SarifDiagnostic] {
  self.validate_with_policy(default_validation_policy())
}

///|
pub fn SarifLog::is_valid(self : SarifLog) -> Bool {
  for diagnostic in self.validate() {
    if diagnostic.severity == "error" {
      return false
    }
  }
  true
}

///|
pub fn diagnostics_summary(items : ArrayView[SarifDiagnostic]) -> String {
  let mut errors = 0
  let mut warnings = 0
  for item in items {
    if item.severity == "error" {
      errors = errors + 1
    } else if item.severity == "warning" {
      warnings = warnings + 1
    }
  }
  "diagnostics errors=\{errors} warnings=\{warnings}"
}
