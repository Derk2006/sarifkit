# 版本发布记录

## 0.1.2

发布日期：2026-11-11

发布目标：

- 发布 `Derk2006/sarifkit@0.1.2`，回应 MoonBit 开源大赛组委会的持续可用性检查。
- 保持公开 API 与行为不变，只做工具链兼容性与工程记录维护。

发布前检查：

- `moon version --all` 记录为 `moon 0.1.20260904` / `moonc v0.10.12+1634b282e` / `moonrun 0.1.20260904`。
- `moon check --deny-warn` 通过，零警告（旧版清单已移除）。
- wasm、wasm-gc、js 三个后端的构建与测试均通过，19/19。
- `moon run cmd/main`、`moon doc`、`moon package` 通过。
- 在全新项目中 `moon add Derk2006/sarifkit@0.1.2` 后按 README 示例调用公开 API，可编译并输出预期结果。

## 0.1.1

发布日期：2026-08-17

发布目标：

- 发布 `Derk2006/sarifkit@0.1.1`。
- 同步最终验收口径的 README、申报书、测试记录、工作记录和非重复调研说明。
- 保持 MoonBit 原生 SARIF 2.1.0 报告构造、校验、合并、baseline 和 annotation 能力稳定可用。

发布前检查：

- 有效 MoonBit 代码行数为 4408 行。
- Git 提交记录已超过 5 次，每次提交对应真实功能或工程材料。
- `moon check`、`moon build`、`moon test`、`moon run cmd/main`、`moon package` 已验证通过。
- Mooncakes 方向已完成非重复调研。
- 项目使用 MIT 许可证。

## 0.1.0

发布日期：2026-08-11

发布目标：

- 发布 `Derk2006/sarifkit@0.1.0`。
- 提供 MoonBit 原生 SARIF 2.1.0 报告构造、校验和合并能力。
- 满足构建、测试、示例、README、CI、许可证和过程记录要求。

发布前检查：

- 有效 MoonBit 代码行数为 4408 行。
- Git 提交记录已超过 5 次，每次提交对应真实功能或工程材料。
- Mooncakes 方向已完成非重复调研。
- 项目使用 MIT 许可证。
