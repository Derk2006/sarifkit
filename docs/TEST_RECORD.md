# 测试记录

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
