///|
test "validation accepts sample log and summarizes diagnostics" {
  let log = @sarifkit.sample_log()
  let diagnostics = log.validate()
  @test.assert_eq(@sarifkit.diagnostics_summary(diagnostics), "diagnostics errors=0 warnings=0")
  assert_true(log.is_valid())
}

///|
test "validation catches invalid version region and empty message" {
  let bad_result = @sarifkit.SarifResult::SarifResult(
    "UNKNOWN",
    "",
    level="fatal",
    kind="strange",
    locations=[
      @sarifkit.SarifLocation::SarifLocation(
        @sarifkit.PhysicalLocation::PhysicalLocation(
          @sarifkit.ArtifactLocation::ArtifactLocation(""),
          region=@sarifkit.Region::Region(0, start_column=0),
        ),
      ),
    ],
  )
  let run = @sarifkit.SarifRun::SarifRun(
    @sarifkit.ToolDriver::ToolDriver("tool", rules=[]),
    results=[bad_result],
  )
  let log = @sarifkit.SarifLog::SarifLog([run])
  let diagnostics = log.validate()
  assert_true(diagnostics.length() >= 5)
  assert_false(log.is_valid())
  assert_true(@sarifkit.diagnostics_report(diagnostics).contains("SARIF validation"))
}

///|
test "validation policy can require artifact declarations" {
  let log = @sarifkit.quick_log("tool", "R1", "message", "src/a.mbt", 1)
  let policy = @sarifkit.SarifValidationPolicy::SarifValidationPolicy(
    require_artifacts_for_locations=true,
  )
  let diagnostics = log.validate_with_policy(policy)
  assert_true(diagnostics.length() >= 1)
  assert_true(@sarifkit.diagnostics_summary(diagnostics).contains("warnings="))
}
