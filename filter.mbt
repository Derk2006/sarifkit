///|
pub fn SarifRun::filter_results(
  self : SarifRun,
  keep : (SarifResult) -> Bool,
) -> SarifRun {
  { ..self, results: self.results.filter(keep) }
}

///|
pub fn SarifLog::filter_results(
  self : SarifLog,
  keep : (SarifResult) -> Bool,
) -> SarifLog {
  { ..self, runs: self.runs.map(run => run.filter_results(keep)) }
}

///|
pub fn SarifRun::filter_by_level(
  self : SarifRun,
  minimum : StringView,
) -> SarifRun {
  self.filter_results(result => level_at_least(result.level, minimum))
}

///|
pub fn SarifLog::filter_by_level(
  self : SarifLog,
  minimum : StringView,
) -> SarifLog {
  self.filter_results(result => level_at_least(result.level, minimum))
}

///|
pub fn SarifRun::filter_by_rule(
  self : SarifRun,
  rule_id : StringView,
) -> SarifRun {
  let needle = rule_id.to_owned()
  self.filter_results(result => result.rule_id == needle)
}

///|
pub fn SarifLog::filter_by_rule(
  self : SarifLog,
  rule_id : StringView,
) -> SarifLog {
  let needle = rule_id.to_owned()
  self.filter_results(result => result.rule_id == needle)
}

///|
pub fn SarifRun::filter_by_uri(
  self : SarifRun,
  uri : StringView,
) -> SarifRun {
  let needle = uri.to_owned()
  self.filter_results(result =>
    match result.primary_uri() {
      Some(value) => value == needle
      None => false
    },
  )
}

///|
pub fn SarifLog::filter_by_uri(self : SarifLog, uri : StringView) -> SarifLog {
  let needle = uri.to_owned()
  self.filter_results(result =>
    match result.primary_uri() {
      Some(value) => value == needle
      None => false
    },
  )
}

///|
pub fn SarifRun::limit_results(self : SarifRun, max : Int) -> SarifRun {
  if max < 0 {
    return { ..self, results: [] }
  }
  let out : Array[SarifResult] = []
  for i, result in self.results {
    if i < max {
      out.push(result)
    }
  }
  { ..self, results: out }
}

///|
pub fn SarifLog::limit_results_per_run(self : SarifLog, max : Int) -> SarifLog {
  { ..self, runs: self.runs.map(run => run.limit_results(max)) }
}

///|
pub fn SarifRun::without_notes(self : SarifRun) -> SarifRun {
  self.filter_by_level("warning")
}

///|
pub fn SarifLog::without_notes(self : SarifLog) -> SarifLog {
  self.filter_by_level("warning")
}

///|
pub fn SarifRun::only_errors(self : SarifRun) -> SarifRun {
  self.filter_by_level("error")
}

///|
pub fn SarifLog::only_errors(self : SarifLog) -> SarifLog {
  self.filter_by_level("error")
}

///|
pub fn SarifRun::drop_baseline_absent(self : SarifRun) -> SarifRun {
  self.filter_results(result =>
    match result.baseline_state {
      Some("absent") => false
      _ => true
    },
  )
}

///|
pub fn SarifLog::drop_baseline_absent(self : SarifLog) -> SarifLog {
  self.filter_results(result =>
    match result.baseline_state {
      Some("absent") => false
      _ => true
    },
  )
}
