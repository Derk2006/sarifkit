///|
test "stats and rule summaries aggregate result levels" {
  let log = @sarifkit.sample_log()
  let stats = log.stats()
  @test.assert_eq(stats.runs, 1)
  @test.assert_eq(stats.results, 2)
  @test.assert_eq(stats.errors, 1)
  @test.assert_eq(stats.warnings, 1)
  assert_true(stats.has_blocking_findings())
  let summaries = log.rule_summaries()
  @test.assert_eq(summaries.length(), 2)
  assert_true(log.summary().contains("results=2"))
  assert_true(log.markdown_report().contains("SARIF log report"))
}

///|
test "filters keep by level rule uri and limit" {
  let log = @sarifkit.sample_log()
  @test.assert_eq(log.only_errors().stats().results, 1)
  @test.assert_eq(log.without_notes().stats().results, 2)
  @test.assert_eq(log.filter_by_rule("MB001").stats().results, 1)
  @test.assert_eq(log.filter_by_uri("moon.mod").stats().results, 1)
  @test.assert_eq(log.limit_results_per_run(1).stats().results, 1)
}

///|
test "merge combines runs by tool and keeps unique rules and artifacts" {
  let left = @sarifkit.sample_log()
  let right = @sarifkit.quick_log(
    "moonlint", "MB777", "new issue", "src/new.mbt", 1,
  )
  let merged = left.merge_with(right)
  @test.assert_eq(merged.runs.length(), 1)
  @test.assert_eq(merged.stats().results, 3)
  assert_true(merged.runs[0].tool.rules.length() >= 3)
  assert_true(merged.runs[0].artifacts.length() >= 3)
}

///|
test "baseline marks new unchanged and absent results" {
  let previous = @sarifkit.sample_run().with_stable_fingerprints()
  let builder = @sarifkit.SarifBuilder::SarifBuilder("moonlint")
  builder.add_fingerprinted_result(
    "MB001",
    "debug print should be removed",
    "src/main.mbt",
    12,
    column=3,
  )
  |> ignore
  builder.add_fingerprinted_result("MB123", "new warning", "src/new.mbt", 1)
  |> ignore
  let current = builder.run().mark_against(previous)
  let summary = @sarifkit.baseline_summary(current.results)
  assert_true(summary.contains("new=1"))
  assert_true(summary.contains("unchanged=1"))
  assert_true(summary.contains("absent=1"))
}

///|
test "github annotations map SARIF levels to workflow command levels" {
  let log = @sarifkit.sample_log()
  let annotations = log.github_annotations()
  @test.assert_eq(annotations.length(), 2)
  assert_true(annotations[0].workflow_command().contains("file=src/main.mbt"))
  assert_true(log.github_annotation_commands().length() == 2)
}

///|
test "catalog exposes reusable rules by tag level and id" {
  let rules = @sarifkit.catalog_rules()
  assert_true(rules.length() >= 50)
  assert_true(@sarifkit.catalog_rule_ids().contains("SK001"))
  assert_true(@sarifkit.catalog_rules_by_tag("security").length() >= 4)
  assert_true(@sarifkit.catalog_rules_by_level("error").length() >= 5)
  guard @sarifkit.catalog_lookup("SK014") is Some(rule) else {
    fail("expected catalog rule")
  }
  @test.assert_eq(rule.default_level, "error")
  assert_true(@sarifkit.catalog_report().contains("sarifkit catalog"))
}

///|
test "schema catalog exposes required SARIF fields" {
  assert_true(@sarifkit.schema_fields().length() >= 100)
  assert_true(@sarifkit.schema_fields_for("log").length() > 0)
  assert_true(@sarifkit.schema_required_fields_for("log").length() >= 2)
  guard @sarifkit.schema_lookup("log", "version") is Some(field) else {
    fail("expected schema field")
  }
  assert_true(field.required)
  @test.assert_eq(field.value_kind, "string")
  assert_true(@sarifkit.schema_catalog_report().contains("sarifkit schema"))
}
