# aihome-agent

统一管理 AIHome 体系的 Agent、Skills、规则、MCP 与项目配置。

## 仓库边界

- `aihome-agent`：Agent 定义、可复用 Skills、规则、MCP、项目 Profile。
- `aihome-tools`：脚本、工具、Docker 沙箱和自动化执行器。
- 业务仓：业务代码、业务合同、私有数据和项目专属配置。

## 当前覆盖项目

LLMFreeway、proxy-subscription-hub、aihome、privatecam-edge、utils、交易系统、儿童家教系统、C++/LiteOS/Modem/RIL 项目。

## Skills 原则

采用薄 `SKILL.md` 入口，复杂内容放入 `references/`，可执行逻辑放入 `scripts/`，资源放入 `assets/`。避免重复 Skills 和上下文污染。

## 外部项目

TeamAI CLI 用于实验性同步；Superpowers、ECC、i-have-adhd、Vercel Skills、OpenAI Skills 等仅作为经过审查的参考或依赖，不直接复制未审计内容。

## 使用方式

1. 读取对应 `profiles/<project>.yaml`。
2. 按需加载 Skills。
3. 完成后运行校验脚本并记录版本。

详见 `docs/architecture.md`、`docs/migration-plan.md` 和 `profiles/`。
