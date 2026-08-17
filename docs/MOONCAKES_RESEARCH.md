# Mooncakes 非重复调研

调研日期：2026-08-11
复核日期：2026-08-17

## 检索范围

在 Mooncakes 包搜索中检索以下关键词：

- `sarif`
- `code scanning`
- `static analysis`
- `diagnostic report`
- `annotations`

## 调研结论

检索结果显示 Mooncakes 中已经存在 SARIF 相关能力，但未发现功能高度重合的 MoonBit SARIF 报告构造、校验、合并和 CI annotation 工具库。

`Derk2006/sarifkit` 的定位是 MoonBit 原生 SARIF 2.1.0 工具库，面向开发工具、lint、静态分析、安全扫描和包质量检查。该方向与 Mooncakes 中已有常规解析器、Web 客户端、模板、地理、状态管理等包不重合，具备明确生态补位价值。

## 已发现的相关项目

- `cogna-dev/x/sarif`：提供 SARIF 2.1.0 静态类型与 JSON 编解码，属于实验性多包集合的一部分。
- 部分 MoonBit 开发工具会把自身检查结果输出为 SARIF，属于具体工具的报告格式能力。

这些项目说明 SARIF 方向已经有生态需求，但它们不是面向其他 MoonBit 工具复用的完整 SARIF 报告层。

## 差异与价值

- SARIF 是开发工具与 CI 平台之间的诊断交换格式。
- MoonBit 工具生态需要统一的报告输出层，以便 lint、安全扫描和质量检查结果可以被 CI 读取。
- 本项目提供构造、轻量解析、校验策略、统计、筛选、合并、baseline、annotation 转换、规则模板目录和 schema 字段目录，不是单一 JSON 结构定义，也不是某个具体扫描工具的内置输出模块。
- 项目无外部运行时依赖，适合被其他 MoonBit 工具库复用。
