# 杨柳岸申论 Skill

> 公考申论解题与备考助手 —— 基于「杨柳岸申论方法体系（课程实料版）」提炼的 Agent Skills 格式技能包，可用于 WorkBuddy、Claude Code 等兼容工具。

[![skills.sh](https://skills.sh/b/TrafalgarYu/yangliuan-shenlun-skill)](https://skills.sh/TrafalgarYu/yangliuan-shenlun-skill)

## 这是什么

一个可直接安装到 [WorkBuddy](https://workbuddy.cn)（兼容 Agent Skills 目录结构）的 Skill：把公考申论名师**杨柳岸**系统课 27 节逐字稿，转化成可被 AI Agent 执行的判断系统与课程笔记。

当前版本重点保留课程中的适用条件与验证过程。题型、政策词、连词、阅读次数和常见结构都只作候选工具，最终服从题干与完整材料，避免把老师的反模板方法重新做成模板。

**触发场景**：申论解题、申论批改、申论学习方法、概括题/分析题/公文题/对策题/大作文作答，或明确提到"杨柳岸""柳岸""杨局"。

## 核心理念

- 申论是**模拟机关工作的考试**：材料＝大政方针的具体实践，题干＝领导指示，答案＝工作成果
- **反对模板化答题**："拿来就用的东西不会管你的死活"、"在考场上你越省事儿，你反而越容易出事儿"
- 总纲一句话：**答案不是找出来的，是读出来的、梳理出来的**
- 意识 > 能力 > 技巧

## 目录结构

```
.
├── SKILL.md                      # 技能主文件（Agent 加载入口）
├── CHANGELOG.md                  # 版本与忠实度修订记录
├── evals/evals.json              # 方法忠实度回归测试
└── references/                   # 参考资料库（按需加载，节省上下文）
    ├── method-system.md          # 完整方法体系总纲
    ├── exam-strategy.md          # 考场策略与备考规划
    └── notes/                    # 27 节课逐字稿蒸馏笔记（8 份）
        ├── 01-理念课A.md
        ├── 02-理念课B-阅卷与考场.md
        ├── 03-审题.md
        ├── 04-材料阅读-思维与中观.md
        ├── 05-微观阅读-概括与分析.md
        ├── 06-公文与对策.md
        ├── 07-大作文.md
        └── 08-体系总梳理.md
```

## 安装

### Agent Skills CLI（推荐）

```bash
npx skills add https://github.com/TrafalgarYu/yangliuan-shenlun-skill --skill yangliuan-shenlun
```

更新已安装的 Skill：

```bash
npx skills update yangliuan-shenlun
```

### WorkBuddy / 兼容目录

将本仓库克隆到 WorkBuddy 的技能目录：

```bash
git clone https://github.com/TrafalgarYu/yangliuan-shenlun-skill.git \
  ~/.workbuddy/skills/yangliuan-shenlun
```

### 本地校验

仓库提供一个不修改文件的静态检查脚本，用于确认入口文件、参考资料、评测 JSON 和 README 关键安装信息完整：

```bash
bash scripts/validate.sh
```

## 示例与回归测试

- `examples/反模板判断示例.md` 展示怎样把课程术语还原为“提出假设、回到材料验证、必要时弃用”的判断过程。
- `evals/evals.json` 包含十二个回归场景：六个基础作答题检查功能不回退，六个方法口径题检查阅读遍数、连词歧义、残缺材料、阅卷边界、中观与小标题、框架与模板。
- `docs/Skill打磨报告.md` 记录本轮课程对账、风险判断、改动依据和实跑结论。

## 许可证

课程衍生笔记、示例、Skill 指令和配套文档按 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可，仅限非商业使用，并须保留署名、以相同方式共享。课程原始内容、杨柳岸名称及相关商标权利不因本仓库许可而转移。

## 免责声明

本 Skill 内容提炼自公开课程的个人学习笔记，仅供个人备考学习使用，请勿用于商业用途。
