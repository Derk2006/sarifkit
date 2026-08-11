///|
fn result_identity(result : SarifResult) -> String {
  match result.fingerprint_value("stableKey") {
    Some(value) => value
    None => match (result.primary_uri(), result.primary_region()) {
      (Some(uri), Some(region)) =>
        stable_result_key(
          result.rule_id,
          result.message.text,
          uri,
          region.start_line,
          region.start_column,
        )
      _ => stable_hash("\{result.rule_id}|\{result.message.text}")
    }
  }
}

///|
fn contains_identity(results : ArrayView[SarifResult], id : StringView) -> Bool {
  let needle = id.to_owned()
  for result in results {
    if result_identity(result) == needle {
      return true
    }
  }
  false
}

///|
pub fn mark_baseline(
  current : ArrayView[SarifResult],
  previous : ArrayView[SarifResult],
) -> Array[SarifResult] {
  let out : Array[SarifResult] = []
  for result in current {
    let id = result_identity(result)
    let state = if contains_identity(previous, id) { "unchanged" } else { "new" }
    out.push({ ..result, baseline_state: Some(state) })
  }
  for old in previous {
    let id = result_identity(old)
    if !contains_identity(current, id) {
      out.push({ ..old, baseline_state: Some("absent") })
    }
  }
  out
}

///|
pub fn SarifRun::mark_against(self : SarifRun, previous : SarifRun) -> SarifRun {
  { ..self, results: mark_baseline(self.results, previous.results) }
}

///|
pub fn SarifLog::mark_against(self : SarifLog, previous : SarifLog) -> SarifLog {
  let out : Array[SarifRun] = []
  for i, run in self.runs {
    if i < previous.runs.length() {
      out.push(run.mark_against(previous.runs[i]))
    } else {
      out.push({ ..run, results: mark_baseline(run.results, []) })
    }
  }
  { ..self, runs: out }
}

///|
pub fn baseline_summary(results : ArrayView[SarifResult]) -> String {
  let mut new_count = 0
  let mut unchanged = 0
  let mut absent = 0
  let mut updated = 0
  for result in results {
    match result.baseline_state {
      Some("new") => new_count = new_count + 1
      Some("unchanged") => unchanged = unchanged + 1
      Some("absent") => absent = absent + 1
      Some("updated") => updated = updated + 1
      _ => ()
    }
  }
  "baseline new=\{new_count} unchanged=\{unchanged} updated=\{updated} absent=\{absent}"
}
