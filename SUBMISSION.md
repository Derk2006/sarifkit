# 2026 MoonBit 8月黑客松项目申报书

## 项目信息

- 项目名称：Derk2006/sarifkit
- 项目类型：原创 MoonBit 开源库
- 参赛者：苗张琨
- 手机号：15176082079
- GitHub：Derk2006
- 许可证：MIT
- 代码仓库：https://github.com/Derk2006/sarifkit
- Mooncakes 包名：Derk2006/sarifkit

## 项目现有基础

项目已建立 MoonBit 工程结构，包含 SARIF 2.1.0 核心模型、构造器、JSON 编码与解码、校验策略、统计摘要、筛选、合并、baseline 标记、GitHub annotation 转换、规则目录、字段目录、单元测试、示例入口、README、CI、设计说明、测试记录和发布记录。

## 本次计划开发或新增内容

本次黑客松完成一个可复用的 MoonBit 原生 SARIF 工具库。重点新增：

- SARIF 日志、run、rule、result、location、region、artifact 等基础模型。
- `SarifBuilder` 和 `quick_log`，降低工具生成 SARIF 的接入成本。
- JSON 输出和核心字段解析，支持报告落盘、上传和回读。
- 校验策略和诊断摘要，便于 CI 中检查 SARIF 输出质量。
- 统计、规则聚合、Markdown 报告和 GitHub workflow annotation 转换。
- 结果筛选、日志合并、稳定指纹和 baseline 对比。
- 可复用规则模板目录和 SARIF schema 字段目录。

## 项目预期目标和技术路线

技术路线是以 MoonBit 标准库 JSON 能力为基础，先建立强类型 SARIF 子集模型，再围绕开发工具常见工作流补充构造、校验、统计、合并和输出能力。项目保持无外部运行时依赖，核心功能均由 MoonBit 实现。

预期目标：

- 可作为 MoonBit lint、包质量检查、安全扫描和 CI 工具的 SARIF 输出层。
- 可在 GitHub Actions 中把 SARIF 结果转换成 annotation。
- 可为后续 MoonBit 开发工具提供稳定的诊断交换格式基础。
- 项目边界清晰，后续可继续扩展 codeFlows、taxonomies 和完整 schema 校验。

## 预计完成功能、测试和文档

- 功能：构造、JSON、校验、统计、筛选、合并、baseline、annotation、规则目录、字段目录。
- 测试：覆盖模型、builder、JSON roundtrip、错误解析、校验策略、统计、筛选、合并、baseline、annotation 和目录查询。
- 文档：README、设计说明、非重复调研、测试记录、工作记录、发布记录和更新日志。
- CI：GitHub Actions 执行 `moon check`、`moon build`、`moon test`、`moon run cmd/main`、`moon package`。

## Mooncakes 非重复说明

在 Mooncakes 上检索 `sarif`、`code scanning`、`static analysis`、`diagnostic report`、`annotations` 等关键词，已发现 SARIF 静态类型和具体工具的 SARIF 输出能力，但未发现以 SARIF 报告构造、轻量解析、校验策略、统计、筛选、合并、baseline、GitHub annotation、规则模板目录和字段目录为完整边界的通用 MoonBit 工具库。本项目方向具备独立性和生态补位价值。
