# 设计说明

## 目标

`Derk2006/sarifkit` 面向 MoonBit 开发工具生态，提供一个轻量、可测试、无外部运行时依赖的 SARIF 2.1.0 报告层。项目目标不是一次性覆盖 SARIF 官方 schema 的全部字段，而是优先覆盖静态分析、lint、包质量检查和 CI 输出最常用的路径。

## 模块划分

- `model.mbt`：核心数据模型、构造函数、level/kind/baseline 工具函数。
- `json_codec.mbt`：SARIF JSON 编码和核心字段解析。
- `builder.mbt`：单 run 构造器，自动维护 rules、artifacts 和 fingerprints。
- `validate.mbt`：校验策略、错误和警告诊断。
- `stats.mbt`：统计摘要和 rule 聚合。
- `filter.mbt`：按级别、规则、文件路径筛选结果。
- `merge.mbt`：多日志、多 run 合并。
- `baseline.mbt`：基于稳定指纹对比新旧结果。
- `annotations.mbt`：转换 GitHub workflow annotation。
- `markdown.mbt`：诊断和统计报告文本。
- `rule_catalog.mbt`：可复用规则模板目录。
- `schema_catalog.mbt`：SARIF 字段描述目录。
- `fixtures.mbt`：稳定示例数据。

## 数据建模

项目选择强类型结构体表达常用 SARIF 对象，数组和可选字段直接映射到 MoonBit 的 `Array[T]` 和 `T?`。复杂 property bag 使用 `SarifProperty` 与 `Fingerprint` 键值数组表示，避免暴露未约束的动态对象，同时保留扩展能力。

## JSON 策略

编码路径保留 SARIF 标准字段名，例如 `ruleId`、`partialFingerprints`、`artifactLocation` 和 `startLine`。解码路径覆盖日志、run、tool、result、message、location、artifactLocation 和 region 等核心字段，遇到结构错误返回 `SarifError`。

## 校验策略

默认校验关注实际 CI 可用性：

- log 必须为 SARIF 2.1.0。
- run 必须声明 tool driver。
- result 应引用已声明 rule。
- result message 不应为空。
- location uri 和 region 坐标需要有效。
- level、kind、baselineState 应使用 SARIF 标准值。

调用方可通过 `SarifValidationPolicy` 调整是否要求 location、artifact 声明、最低级别和每个 run 的最大结果数。

## 后续扩展

- 完整建模 codeFlows、threadFlows、graphs 和 taxonomies。
- 增加更严格的官方 schema 校验子集。
- 增加大型日志流式编码和报告切分。
- 增加更多 CI 平台输出适配。
