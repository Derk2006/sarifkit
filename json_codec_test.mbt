///|
test "sample log serializes to SARIF JSON and parses core fields back" {
  let log = @sarifkit.sample_log()
  let text = log.to_json_string(indent=2)
  assert_true(text.contains("\"version\": \"2.1.0\""))
  assert_true(text.contains("\"ruleId\": \"MB001\""))
  assert_true(text.contains("\"partialFingerprints\""))
  let parsed = @sarifkit.SarifLog::from_json_string(text)
  guard parsed is Ok(decoded) else {
    fail("expected SARIF JSON to parse")
  }
  @test.assert_eq(decoded.version, "2.1.0")
  @test.assert_eq(decoded.runs.length(), 1)
  @test.assert_eq(decoded.runs[0].tool.name, "moonlint")
  @test.assert_eq(decoded.runs[0].results.length(), 2)
}

///|
test "json decoder reports malformed and structurally invalid input" {
  guard @sarifkit.SarifLog::from_json_string("{") is Err(@sarifkit.JsonParse(..)) else {
    fail("expected parse error")
  }
  guard @sarifkit.SarifLog::from_json_string("{\"version\":\"2.1.0\"}")
    is Err(@sarifkit.MissingField(field="runs")) else {
    fail("expected missing runs")
  }
}
