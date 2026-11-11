# Changelog

## 0.1.2

维护版本，对应 MoonBit 开源大赛组委会 2026-11-11 的持续可用性检查。功能与公开 API 未变。

- 移除 `moon.mod.json`、`moon.pkg.json`、`cmd/main/moon.pkg.json`。旧版清单与新版并存时，`moon` 每条命令都会打印「using the new format, please remove the deprecated」警告；新版工具链只采用新格式，继续保留只会制造噪音。
- README 增加「工具链兼容性」一节，记录实际验证的 `moon version --all` 输出（moon `0.1.20260904`、moonc `v0.10.12+1634b282e`、moonrun `0.1.20260904`）、验证日期、逐条命令的结果矩阵，以及支持的后端（wasm / wasm-gc / js）。
- README 补充使用方 `moon.pkg` 的 `@sarifkit` 别名声明写法。`moon add` 只写模块依赖，缺这一步时第一条使用语句就报 `Package sarifkit not found`。
- CI 增加工具链版本打印、三个后端的构建与测试、`moon doc`，与 README 声明的入口一一对应；此前只构建和测试默认的 wasm 后端。
- 测试记录与工作记录补充 2026-11-11 的复验结果：19 个测试在三个后端上全部通过，`moon package` 生成发布包。

## 0.1.1

- 同步最终验收口径的 README、申报书和工程记录。
- 明确 Mooncakes 非重复调研边界和 SARIF 生态定位。
- 记录 4408 行有效 MoonBit 代码规模、构建测试结果和已完成范围。

## 0.1.0

- 建立 SARIF 2.1.0 核心数据模型。
- 实现 SARIF builder、JSON 输出和核心字段解析。
- 实现校验策略、诊断摘要和 Markdown 报告。
- 实现结果筛选、日志合并、稳定指纹和 baseline 标记。
- 实现 GitHub workflow annotation 转换。
- 增加 50 条可复用规则模板和 135 条 SARIF 字段描述。
- 添加单元测试、示例入口、README、CI、设计说明、申报书和发布记录。
- 复核并补充 Mooncakes 非重复调研说明。
- 将申报书和验收记录调整为已完成口径，记录 4408 行有效 MoonBit 代码规模。
