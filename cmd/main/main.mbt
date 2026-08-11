fn main {
  let builder = @sarifkit.SarifBuilder::SarifBuilder(
    "moonlint",
    tool_version="0.1.0",
    information_uri="https://github.com/Derk2006/sarifkit",
  )
  builder.add_rule(
    "MB001",
    name="no-debug-print",
    short_description="Debug print should not be committed",
    default_level="warning",
    tags=["maintainability", "ci"],
  ) |> ignore
  builder.add_fingerprinted_result(
    "MB001",
    "debug print should be removed before release",
    "src/main.mbt",
    12,
    column=3,
  ) |> ignore
  let log = builder.log()
  println(log.summary())
  println(log.github_annotation_commands()[0])
  println(log.to_json_string(indent=2))
}
