///|
test "builder deduplicates rules and artifacts while adding results" {
  let builder = @sarifkit.SarifBuilder::SarifBuilder(
    "moonlint",
    tool_version="0.1.0",
  )
  let first = builder.add_rule("MB001", name="no-debug", default_level="warning")
  let again = builder.add_rule("MB001", name="no-debug", default_level="warning")
  @test.assert_eq(first, again)
  builder.add_result(
    "MB001",
    "debug print",
    uri="src/main.mbt",
    line=10,
    column=2,
  ) |> ignore
  builder.add_result(
    "MB001",
    "second debug print",
    uri="src/main.mbt",
    line=12,
    column=2,
  ) |> ignore
  @test.assert_eq(builder.rule_count(), 1)
  @test.assert_eq(builder.artifact_count(), 1)
  @test.assert_eq(builder.result_count(), 2)
  let log = builder.log()
  @test.assert_eq(log.runs.length(), 1)
  @test.assert_eq(log.runs[0].results.length(), 2)
}

///|
test "quick_log creates a valid single result SARIF log" {
  let log = @sarifkit.quick_log(
    "moonlint",
    "MB001",
    "debug print",
    "src/main.mbt",
    5,
    column=7,
  )
  assert_true(log.is_valid())
  @test.assert_eq(log.stats().results, 1)
  @test.assert_eq(log.runs[0].results[0].level, "warning")
}

///|
test "builder can attach invocation and automation details" {
  let builder = @sarifkit.SarifBuilder::SarifBuilder("moonlint")
  builder.set_automation_id("ci")
  builder.add_invocation(command_line="moon test", working_directory=".")
  let run = builder.run()
  @test.assert_eq(run.automation_id, Some("ci"))
  @test.assert_eq(run.invocations.length(), 1)
  assert_true(run.invocations[0].execution_successful)
}
