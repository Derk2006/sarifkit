///|
pub struct GithubAnnotation {
  path : String
  start_line : Int
  end_line : Int
  annotation_level : String
  message : String
  title : String?
} derive(Eq, Debug, ToJson)

///|
pub fn GithubAnnotation::GithubAnnotation(
  path : StringView,
  start_line : Int,
  end_line : Int,
  annotation_level : StringView,
  message : StringView,
  title? : String,
) -> GithubAnnotation {
  {
    path: path.to_owned(),
    start_line,
    end_line,
    annotation_level: annotation_level.to_owned(),
    message: message.to_owned(),
    title,
  }
}

///|
pub fn github_annotation_level(level : StringView) -> String {
  match normalize_level(level) {
    "error" => "failure"
    "warning" => "warning"
    _ => "notice"
  }
}

///|
pub fn SarifResult::to_github_annotation(
  self : SarifResult,
) -> GithubAnnotation? {
  match (self.primary_uri(), self.primary_region()) {
    (Some(uri), Some(region)) => {
      let end_line = match region.end_line {
        Some(value) => value
        None => region.start_line
      }
      Some(
        GithubAnnotation::GithubAnnotation(
          uri,
          region.start_line,
          end_line,
          github_annotation_level(self.level),
          self.message.text,
          title=self.rule_id,
        ),
      )
    }
    _ => None
  }
}

///|
pub fn SarifRun::github_annotations(self : SarifRun) -> Array[GithubAnnotation] {
  let out : Array[GithubAnnotation] = []
  for result in self.results {
    if result.to_github_annotation() is Some(annotation) {
      out.push(annotation)
    }
  }
  out
}

///|
pub fn SarifLog::github_annotations(self : SarifLog) -> Array[GithubAnnotation] {
  let out : Array[GithubAnnotation] = []
  for run in self.runs {
    for annotation in run.github_annotations() {
      out.push(annotation)
    }
  }
  out
}

///|
pub fn GithubAnnotation::workflow_command(self : GithubAnnotation) -> String {
  let title = match self.title {
    Some(value) => ",title=\{value}"
    None => ""
  }
  "::\{self.annotation_level} file=\{self.path},line=\{self.start_line},endLine=\{self.end_line}\{title}::\{self.message}"
}

///|
pub fn SarifLog::github_annotation_commands(self : SarifLog) -> Array[String] {
  self.github_annotations().map(annotation => annotation.workflow_command())
}
