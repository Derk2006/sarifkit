# Mooncakes 非重复调研

调研日期：2026-08-11

## 检索范围

在 Mooncakes 包搜索中检索以下关键词：

- `sarif`
- `code scanning`
- `static analysis`
- `diagnostic report`
- `annotations`

## 调研结论

检索结果未发现功能高度重合的 MoonBit SARIF 报告构造、校验、合并和 CI annotation 工具库。

`Derk2006/sarifkit` 的定位是 MoonBit 原生 SARIF 2.1.0 工具库，面向开发工具、lint、静态分析、安全扫描和包质量检查。该方向与 Mooncakes 中已有常规解析器、Web 客户端、模板、地理、状态管理等包不重合，具备明确生态补位价值。

## 差异与价值

- SARIF 是开发工具与 CI 平台之间的诊断交换格式。
- MoonBit 工具生态需要统一的报告输出层，以便 lint、安全扫描和质量检查结果可以被 CI 读取。
- 本项目提供构造、校验、统计、合并、baseline 和 annotation 转换，不是单一 JSON 结构定义。
- 项目无外部运行时依赖，适合被其他 MoonBit 工具库复用。
