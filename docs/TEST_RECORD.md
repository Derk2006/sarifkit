# 测试记录

## 2026-11-11（持续可用性复验，0.1.2）

测试环境：

- MoonBit：`moon 0.1.20260904`（`94521db`，2026-09-04）
- `moonc v0.10.12+1634b282e`（2026-09-07）
- `moonrun 0.1.20260904`（`94521db`，2026-09-04）
- 特性开关：`rr_moon_mod`、`rr_moon_pkg`
- 操作系统：Windows 11（Git Bash）；CI 在 Ubuntu 上执行同一组命令
- 包名：`Derk2006/sarifkit`，版本 `0.1.2`

执行命令与结果：

| 命令 | 结果 |
|---|---|
| `moon check --deny-warn` | 通过，零警告 |
| `moon build` | 通过（wasm） |
| `moon build --target wasm-gc` | 通过 |
| `moon build --target js` | 通过 |
| `moon test` | 19/19 通过 |
| `moon test --target wasm-gc` | 19/19 通过 |
| `moon test --target js` | 19/19 通过 |
| `moon run cmd/main` | 输出 `runs=1 rules=1 results=1 errors=0 warnings=1 notes=0 artifacts=1`、一条 GitHub annotation 与完整 SARIF JSON |
| `moon doc` | 通过 |
| `moon package` | 生成 `Derk2006-sarifkit-0.1.2.zip` |

本次修复的问题：

- 移除 `moon.mod.json`、`moon.pkg.json`、`cmd/main/moon.pkg.json`。此前每条 `moon` 命令都会打印三条「deprecated」警告；移除后 `moon check --deny-warn` 零输出。
- 旧记录中的工具链 `moon 0.1.20260724` 已过期，本次按新版重新验证，未改动任何源码即可通过——说明 0.1.1 的源码与新版清单格式、核心库 API 兼容。

## 2026-08-11

测试环境：

- MoonBit：`moon 0.1.20260724`
- 包名：`Derk2006/sarifkit`
- 目标：`wasm`

执行命令：

```bash
moon check
moon build
moon test
moon doc
moon run cmd/main
moon package
```

当前结果：

- `moon check`：通过。
- `moon test`：19 个测试全部通过。
- `moon run cmd/main`：示例成功输出摘要、GitHub annotation 命令和 SARIF JSON。
- `moon package`：通过，生成 `Derk2006-sarifkit-0.1.1.zip`。
- 有效 MoonBit 代码行数为 4408 行。

覆盖范围：

- SARIF 坐标、位置、message、rule、result 和 log 模型。
- builder 去重 rules/artifacts 和生成 fingerprint。
- JSON 输出与核心字段解析。
- 校验策略、错误和警告摘要。
- 统计、rule 聚合、Markdown 报告。
- 筛选、合并、baseline 标记。
- GitHub workflow annotation 转换。
- 规则模板目录和 schema 字段目录查询。
