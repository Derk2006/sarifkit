///|
test "region span and containment use one based SARIF coordinates" {
  let region = @sarifkit.Region::single_line(3, 4, 12)
  @test.assert_eq(region.span_text(), "3:4-3:12")
  assert_true(region.contains_line(3))
  assert_false(region.contains_line(2))
  assert_false(region.contains_line(4))
}

///|
test "result exposes primary uri region properties and fingerprints" {
  let result = @sarifkit.sample_result()
  @test.assert_eq(result.primary_uri(), Some("src/main.mbt"))
  guard result.primary_region() is Some(region) else {
    fail("expected primary region")
  }
  @test.assert_eq(region.start_line, 12)
  assert_true(result.fingerprint_value("stableKey") is Some(_))
  @test.assert_eq(result.property_value("missing"), None)
}

///|
test "level normalization maps common scanner words to SARIF levels" {
  @test.assert_eq(@sarifkit.normalize_level("critical"), "error")
  @test.assert_eq(@sarifkit.normalize_level("warn"), "warning")
  @test.assert_eq(@sarifkit.normalize_level("info"), "note")
  assert_true(@sarifkit.level_at_least("error", "warning"))
  assert_false(@sarifkit.level_at_least("note", "warning"))
}

///|
test "stable fingerprint is deterministic and location sensitive" {
  let a = @sarifkit.stable_result_key("R", "msg", "a.mbt", 1, 1)
  let b = @sarifkit.stable_result_key("R", "msg", "a.mbt", 1, 1)
  let c = @sarifkit.stable_result_key("R", "msg", "a.mbt", 1, 2)
  @test.assert_eq(a, b)
  assert_true(a != c)
}
