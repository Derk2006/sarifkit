///|
pub struct SarifStats {
  runs : Int
  rules : Int
  results : Int
  artifacts : Int
  invocations : Int
  errors : Int
  warnings : Int
  notes : Int
  none : Int
  baselined : Int
} derive(Eq, Debug, ToJson)

///|
pub fn SarifStats::empty() -> SarifStats {
  {
    runs: 0,
    rules: 0,
    results: 0,
    artifacts: 0,
    invocations: 0,
    errors: 0,
    warnings: 0,
    notes: 0,
    none: 0,
    baselined: 0,
  }
}

///|
pub fn SarifStats::total_findings(self : SarifStats) -> Int {
  self.errors + self.warnings + self.notes + self.none
}

///|
pub fn SarifStats::has_blocking_findings(self : SarifStats) -> Bool {
  self.errors > 0
}

///|
fn add_level(stats : SarifStats, level : StringView) -> SarifStats {
  match normalize_level(level) {
    "error" => { ..stats, errors: stats.errors + 1 }
    "warning" => { ..stats, warnings: stats.warnings + 1 }
    "note" => { ..stats, notes: stats.notes + 1 }
    _ => { ..stats, none: stats.none + 1 }
  }
}

///|
pub fn SarifRun::stats(self : SarifRun) -> SarifStats {
  let mut stats = SarifStats::empty()
  stats = { ..stats, runs: 1, rules: self.tool.rules.length(), artifacts: self.artifacts.length(), invocations: self.invocations.length() }
  for result in self.results {
    stats = add_level(stats, result.level)
    if result.baseline_state is Some(_) {
      stats = { ..stats, baselined: stats.baselined + 1 }
    }
  }
  { ..stats, results: self.results.length() }
}

///|
pub fn SarifLog::stats(self : SarifLog) -> SarifStats {
  let mut out = SarifStats::empty()
  for run in self.runs {
    let stats = run.stats()
    out = {
      runs: out.runs + stats.runs,
      rules: out.rules + stats.rules,
      results: out.results + stats.results,
      artifacts: out.artifacts + stats.artifacts,
      invocations: out.invocations + stats.invocations,
      errors: out.errors + stats.errors,
      warnings: out.warnings + stats.warnings,
      notes: out.notes + stats.notes,
      none: out.none + stats.none,
      baselined: out.baselined + stats.baselined,
    }
  }
  out
}

///|
pub struct RuleSummary {
  rule_id : String
  count : Int
  errors : Int
  warnings : Int
  notes : Int
} derive(Eq, Debug, ToJson)

///|
fn find_rule_summary(items : ArrayView[RuleSummary], rule_id : StringView) -> Int? {
  let needle = rule_id.to_owned()
  for i, item in items {
    if item.rule_id == needle {
      return Some(i)
    }
  }
  None
}

///|
pub fn SarifRun::rule_summaries(self : SarifRun) -> Array[RuleSummary] {
  let out : Array[RuleSummary] = []
  for result in self.results {
    match find_rule_summary(out, result.rule_id) {
      Some(index) => {
        let current = out[index]
        let next = match normalize_level(result.level) {
          "error" => { ..current, count: current.count + 1, errors: current.errors + 1 }
          "warning" => { ..current, count: current.count + 1, warnings: current.warnings + 1 }
          "note" => { ..current, count: current.count + 1, notes: current.notes + 1 }
          _ => { ..current, count: current.count + 1 }
        }
        out[index] = next
      }
      None => {
        let base = { rule_id: result.rule_id, count: 1, errors: 0, warnings: 0, notes: 0 }
        let next = match normalize_level(result.level) {
          "error" => { ..base, errors: 1 }
          "warning" => { ..base, warnings: 1 }
          "note" => { ..base, notes: 1 }
          _ => base
        }
        out.push(next)
      }
    }
  }
  out
}

///|
pub fn SarifLog::rule_summaries(self : SarifLog) -> Array[RuleSummary] {
  let out : Array[RuleSummary] = []
  for run in self.runs {
    for summary in run.rule_summaries() {
      match find_rule_summary(out, summary.rule_id) {
        Some(index) => {
          let current = out[index]
          out[index] = {
            rule_id: current.rule_id,
            count: current.count + summary.count,
            errors: current.errors + summary.errors,
            warnings: current.warnings + summary.warnings,
            notes: current.notes + summary.notes,
          }
        }
        None => out.push(summary)
      }
    }
  }
  out
}

///|
pub fn SarifStats::summary(self : SarifStats) -> String {
  "runs=\{self.runs} rules=\{self.rules} results=\{self.results} errors=\{self.errors} warnings=\{self.warnings} notes=\{self.notes} artifacts=\{self.artifacts}"
}

///|
pub fn SarifLog::summary(self : SarifLog) -> String {
  self.stats().summary()
}
