///|
fn merge_rules(left : ArrayView[SarifRule], right : ArrayView[SarifRule]) -> Array[SarifRule] {
  let out = left.to_owned()
  for rule in right {
    if find_rule_by_id(out, rule.id) is None {
      out.push(rule)
    }
  }
  out
}

///|
fn merge_artifacts(left : ArrayView[Artifact], right : ArrayView[Artifact]) -> Array[Artifact] {
  let out = left.to_owned()
  for artifact in right {
    let mut found = false
    for item in out {
      if item.location.uri == artifact.location.uri {
        found = true
      }
    }
    if !found {
      out.push(artifact)
    }
  }
  out
}

///|
pub fn find_rule_by_id(rules : ArrayView[SarifRule], id : StringView) -> SarifRule? {
  let needle = id.to_owned()
  for rule in rules {
    if rule.id == needle {
      return Some(rule)
    }
  }
  None
}

///|
pub fn SarifRun::merge_with(self : SarifRun, other : SarifRun) -> SarifRun {
  let driver = {
    ..self.tool,
    rules: merge_rules(self.tool.rules, other.tool.rules),
  }
  {
    tool: driver,
    results: self.results + other.results,
    artifacts: merge_artifacts(self.artifacts, other.artifacts),
    invocations: self.invocations + other.invocations,
    automation_id: self.automation_id,
  }
}

///|
pub fn merge_runs_by_tool(runs : ArrayView[SarifRun]) -> Array[SarifRun] {
  let out : Array[SarifRun] = []
  for run in runs {
    let mut merged = false
    for i, existing in out {
      if existing.tool.name == run.tool.name {
        out[i] = existing.merge_with(run)
        merged = true
      }
    }
    if !merged {
      out.push(run)
    }
  }
  out
}

///|
pub fn SarifLog::merge_with(self : SarifLog, other : SarifLog) -> SarifLog {
  { ..self, runs: merge_runs_by_tool(self.runs + other.runs) }
}

///|
pub fn merge_logs(logs : ArrayView[SarifLog]) -> SarifLog {
  let runs : Array[SarifRun] = []
  for log in logs {
    for run in log.runs {
      runs.push(run)
    }
  }
  SarifLog::SarifLog(merge_runs_by_tool(runs))
}
