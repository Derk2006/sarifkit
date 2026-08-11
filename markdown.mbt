///|
pub fn SarifDiagnostic::line(self : SarifDiagnostic) -> String {
  "- [\{self.severity}] \{self.code} at \{self.path}: \{self.message}"
}

///|
pub fn diagnostics_report(items : ArrayView[SarifDiagnostic]) -> String {
  let mut out = "SARIF validation\n\{diagnostics_summary(items)}"
  for item in items {
    out = out + "\n" + item.line()
  }
  out
}

///|
pub fn SarifStats::markdown(self : SarifStats) -> String {
  "| metric | value |\n| --- | --- |\n| runs | \{self.runs} |\n| rules | \{self.rules} |\n| results | \{self.results} |\n| errors | \{self.errors} |\n| warnings | \{self.warnings} |\n| notes | \{self.notes} |\n| artifacts | \{self.artifacts} |"
}

///|
pub fn RuleSummary::markdown_row(self : RuleSummary) -> String {
  "| `\{self.rule_id}` | \{self.count} | \{self.errors} | \{self.warnings} | \{self.notes} |"
}

///|
pub fn rule_summary_markdown(items : ArrayView[RuleSummary]) -> String {
  let mut out = "| rule | count | errors | warnings | notes |\n| --- | ---: | ---: | ---: | ---: |"
  for item in items {
    out = out + "\n" + item.markdown_row()
  }
  out
}

///|
pub fn SarifRun::markdown_report(self : SarifRun) -> String {
  let stats = self.stats()
  "# SARIF run report\n\nTool: `\{self.tool.name}`\n\n\{stats.markdown()}\n\n\{rule_summary_markdown(self.rule_summaries())}"
}

///|
pub fn SarifLog::markdown_report(self : SarifLog) -> String {
  let stats = self.stats()
  "# SARIF log report\n\n\{stats.markdown()}\n\n\{rule_summary_markdown(self.rule_summaries())}"
}
