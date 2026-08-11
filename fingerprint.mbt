///|
fn fnv1a_step(hash : Int, ch : Char) -> Int {
  let mut value = hash
  value = value ^ ch.to_int()
  value = value * 16777619
  value & 0x7fffffff
}

///|
pub fn stable_hash(text : StringView) -> String {
  let mut hash = 5381
  for ch in text {
    hash = fnv1a_step(hash, ch)
  }
  hash.to_string()
}

///|
pub fn stable_result_key(
  rule_id : StringView,
  message : StringView,
  uri : StringView,
  line : Int,
  column : Int,
) -> String {
  let raw = "\{rule_id}|\{message}|\{uri}|\{line}|\{column}"
  stable_hash(raw)
}

///|
pub fn SarifResult::with_fingerprint(
  self : SarifResult,
  key : StringView,
  value : StringView,
) -> SarifResult {
  let fingerprints = self.fingerprints.copy()
  let needle = key.to_owned()
  for i, item in fingerprints {
    if item.key == needle {
      fingerprints[i] = Fingerprint::Fingerprint(key, value)
      return { ..self, fingerprints }
    }
  }
  fingerprints.push(Fingerprint::Fingerprint(key, value))
  { ..self, fingerprints }
}

///|
pub fn SarifResult::with_stable_fingerprint(self : SarifResult) -> SarifResult {
  match (self.primary_uri(), self.primary_region()) {
    (Some(uri), Some(region)) => {
      let key = stable_result_key(
        self.rule_id,
        self.message.text,
        uri,
        region.start_line,
        region.start_column,
      )
      self.with_fingerprint("stableKey", key)
    }
    _ => self.with_fingerprint("stableKey", stable_hash("\{self.rule_id}|\{self.message.text}"))
  }
}

///|
pub fn SarifRun::with_stable_fingerprints(self : SarifRun) -> SarifRun {
  { ..self, results: self.results.map(result => result.with_stable_fingerprint()) }
}

///|
pub fn SarifLog::with_stable_fingerprints(self : SarifLog) -> SarifLog {
  { ..self, runs: self.runs.map(run => run.with_stable_fingerprints()) }
}
