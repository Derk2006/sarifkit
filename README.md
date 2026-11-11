# Derk2006/sarifkit

`Derk2006/sarifkit` 是一个 MoonBit 原生 SARIF 2.1.0 报告工具库，用于静态分析、lint、安全扫描、包质量检查和 CI 诊断结果的结构化输出。

SARIF 是 GitHub Code Scanning、静态分析器和安全工具常用的交换格式。本项目提供报告构造、JSON 输出、轻量解析、校验诊断、统计摘要、结果筛选、日志合并、baseline 标记、GitHub annotation 转换、规则模板目录和 SARIF 字段目录，便于 MoonBit 生态中的开发工具直接生成可上传、可审计、可维护的诊断报告。

## 安装

```bash
moon add Derk2006/sarifkit@0.1.2
```

Mooncakes 包名：

```text
Derk2006/sarifkit
```

`moon add` 只写入模块依赖，`@sarifkit` 这个别名要在**使用方的包**里声明，不在 `moon.mod` 里：

```text
import {
  "Derk2006/sarifkit" @sarifkit,
}
```

声明后即可在 `src/main.mbt` 里直接使用 `@sarifkit.quick_log(...)`。下面的「快速示例」就是在这样的项目里实测通过的内容。

## 快速示例

```mbt
test {
  let log = @sarifkit.quick_log(
    "moonlint",
    "MB001",
    "debug print should be removed",
    "src/main.mbt",
    12,
    column=3,
  )
  inspect(log.summary(), content="runs=1 rules=1 results=1 errors=0 warnings=1 notes=0 artifacts=1")
}
```

## 本地运行

```bash
moon check
moon build                        # wasm，默认后端
moon build --target wasm-gc
moon build --target js
moon test                         # 19 个测试，三个后端均可运行
moon doc
moon run cmd/main
moon package
```

## 工具链兼容性

最近一次维护验证：**2026-11-11**，对应 2026 年 8/9/10 月黑客松项目的持续可用性检查。

验证使用的工具链（`moon version --all` 原样记录）：

```text
moon 0.1.20260904 (94521db 2026-09-04) ~\.moon\bin\bin\moon.exe
moonc v0.10.12+1634b282e (2026-09-07) ~\.moon\bin\bin\moonc.exe
moonrun 0.1.20260904 (94521db 2026-09-04) ~\.moon\bin\bin\moonrun.exe

Feature flags enabled: rr_moon_mod,rr_moon_pkg
```

同一次验证的结果：

| 命令 | 结果 |
|---|---|
| `moon check --deny-warn` | 通过，零警告 |
| `moon build`（wasm） | 通过 |
| `moon build --target wasm-gc` | 通过 |
| `moon build --target js` | 通过 |
| `moon test` | 19/19 通过 |
| `moon test --target wasm-gc` | 19/19 通过 |
| `moon test --target js` | 19/19 通过 |
| `moon run cmd/main` | 输出摘要、GitHub annotation 与 SARIF JSON |
| `moon doc` | 通过 |
| `moon package` | 生成 `Derk2006-sarifkit-0.1.2.zip` |

支持的后端是 **wasm（默认，`preferred_target`）、wasm-gc、js**。三个后端都构建同一个库与示例，测试在三者上全部通过，代码不依赖文件系统、网络或平台特定 API，因此没有平台限制；验证在 Windows 11 上完成，CI 在 Ubuntu 上执行同一组命令。

清单格式：仓库只保留新版 `moon.mod` / `moon.pkg`。旧版 `moon.mod.json`、`moon.pkg.json` 在 0.1.2 中移除——它们与新版并存会让 `moon` 每条命令都打印弃用警告，新版工具链也已只采用新格式。

CI（`.github/workflows/ci.yml`）逐次执行上表中的检查、三个后端的构建与测试、示例运行、文档生成和打包，因此后续工具链变化会在提交时暴露，而不是等到下一次维护提醒。

## 核心能力

- SARIF 2.1.0 数据模型：`SarifLog`、`SarifRun`、`SarifResult`、`SarifRule`、`Region`、`Artifact`
- 构造器：`SarifBuilder`、`quick_log`、`add_fingerprinted_result`
- JSON：`SarifLog::to_json_string`、`SarifLog::from_json_string`
- 校验：`validate`、`validate_with_policy`、`SarifValidationPolicy`
- 统计：`stats`、`rule_summaries`、`summary`、`markdown_report`
- 筛选：`filter_by_level`、`filter_by_rule`、`filter_by_uri`、`limit_results_per_run`
- 合并：`merge_with`、`merge_logs`、`merge_runs_by_tool`
- baseline：`mark_against`、`baseline_summary`
- CI 注解：`github_annotations`、`github_annotation_commands`
- 指纹：`stable_hash`、`stable_result_key`、`with_stable_fingerprints`
- 目录：`catalog_rules`、`catalog_lookup`、`schema_fields`、`schema_lookup`

## 适用场景

- MoonBit lint、格式检查、包质量扫描输出 SARIF
- CI 中把错误、警告和说明转换成 GitHub workflow annotation
- 多个工具的诊断结果合并为一个报告
- 发布前比较当前扫描结果和历史 baseline
- 将包元数据、许可证、README、示例和测试检查结果结构化记录
- 为开发工具 UI 提供 SARIF 字段说明和规则模板

## 生态定位

本项目定位为可被其他 MoonBit 开发工具复用的 SARIF 报告层，不是单一 SARIF 类型定义，也不是某个具体扫描工具的内置输出模块。项目重点覆盖从诊断结果到可上传 SARIF 报告的完整链路，包括构造、轻量解析、校验策略、统计、筛选、合并、baseline、GitHub annotation、规则模板目录和字段目录。

## 支持范围

- 构建后端：wasm（默认）、wasm-gc、js，构建、测试与示例均通过
- 单文件 SARIF 2.1.0 日志
- 单 run 与多 run 构造、合并和筛选
- tool.driver、rules、results、locations、artifacts、invocations、automationDetails
- result level、kind、baselineState、partialFingerprints、properties
- 基础 JSON 编码和核心字段解码
- 常见规则模板与 SARIF schema 字段目录

## 暂不支持范围

- 完整 SARIF 官方 JSON Schema 的全字段强校验
- 外部文件读取、网络上传或平台 API 调用
- codeFlows、threadFlows、graphs、taxonomies 的完整建模
- SARIF 压缩、签名和大型日志流式编码

## 开源与合规

本项目采用 MIT 许可证。项目为原创 MoonBit 实现，不移植第三方源代码，不包含来源不明素材或私有代码。SARIF 相关字段和语义依据公开格式约定实现，核心功能全部使用 MoonBit 编写。

## 工程记录

- 项目申报书：`SUBMISSION.md`
- 设计说明：`docs/DESIGN.md`
- Mooncakes 非重复调研：`docs/MOONCAKES_RESEARCH.md`
- 工单记录：`docs/WORKLOG.md`
- 测试记录：`docs/TEST_RECORD.md`
- 版本发布记录：`docs/RELEASE_NOTES.md`
- 更新日志：`CHANGELOG.md`
