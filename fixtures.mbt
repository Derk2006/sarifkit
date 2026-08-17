///|
pub fn sample_rule() -> SarifRule {
  SarifRule::SarifRule(
    "MB001",
    name="no-debug-print",
    short_description="Debug print should not be committed",
    full_description="Reports println-style debug statements in checked-in MoonBit source.",
    default_level="warning",
    tags=["maintainability", "ci"],
  )
}

///|
pub fn sample_error_rule() -> SarifRule {
  SarifRule::SarifRule(
    "MB999",
    name="unsafe-config",
    short_description="Configuration violates release policy",
    default_level="error",
    tags=["security", "release"],
  )
}

///|
pub fn sample_result() -> SarifResult {
  SarifResult::SarifResult(
    "MB001",
    "debug print should be removed",
    level="warning",
    locations=[SarifLocation::from_path("src/main.mbt", 12, column=3)],
  ).with_stable_fingerprint()
}

///|
pub fn sample_error_result() -> SarifResult {
  SarifResult::SarifResult(
    "MB999",
    "release config allows insecure transport",
    level="error",
    locations=[SarifLocation::from_path("moon.mod", 8, column=1)],
  ).with_stable_fingerprint()
}

///|
pub fn sample_run() -> SarifRun {
  let driver = ToolDriver::ToolDriver(
    "moonlint",
    version="0.1.0",
    information_uri="https://github.com/Derk2006/sarifkit",
    rules=[sample_rule(), sample_error_rule()],
  )
  SarifRun::SarifRun(
    driver,
    results=[sample_result(), sample_error_result()],
    artifacts=[
      Artifact::Artifact("src/main.mbt"),
      Artifact::Artifact("moon.mod"),
    ],
    invocations=[SarifInvocation::SarifInvocation(command_line="moon test")],
    automation_id="ci",
  )
}

///|
pub fn sample_log() -> SarifLog {
  SarifLog::SarifLog([sample_run()])
}
