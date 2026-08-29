#!/usr/bin/env bash
# v0.1.0 / 2026-08-29
# 静态校验 Skill 入口、参考资料、评测 JSON 和 README 安装信息；不修改仓库文件。
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Windows（Git Bash/MSYS）下 pwd 返回 msys 风格路径（/c/...），Windows 版 Python 不识别，
# 会误报"缺少必备文件"；经 cygpath 转为 Windows 路径后再传入。Linux/macOS 无 cygpath，保持原路径。
if command -v cygpath >/dev/null 2>&1; then
  ROOT="$(cygpath -w "$ROOT")"
fi

python - "$ROOT" <<'PY'
import json
import re
import sys
from pathlib import Path

root = Path(sys.argv[1])
required = [
    "SKILL.md",
    "README.md",
    "LICENSE",
    "CHANGELOG.md",
    "docs/Skill打磨报告.md",
    "evals/evals.json",
    "examples/反模板判断示例.md",
    "references/method-system.md",
    "references/exam-strategy.md",
]

missing = [path for path in required if not (root / path).is_file()]
if missing:
    raise SystemExit(f"缺少必备文件：{', '.join(missing)}")

skill = (root / "SKILL.md").read_text(encoding="utf-8")
frontmatter = re.search(r"\A---\n(.*?)\n---\n", skill, re.S)
if not frontmatter or not re.search(r"^name:\s*\S+", frontmatter.group(1), re.M):
    raise SystemExit("SKILL.md 缺少有效 name frontmatter")
if not re.search(r"^description:\s*.+", frontmatter.group(1), re.M):
    raise SystemExit("SKILL.md 缺少有效 description frontmatter")

evals = json.loads((root / "evals/evals.json").read_text(encoding="utf-8"))
if len(evals.get("evals", [])) < 12:
    raise SystemExit("评测数量少于 12 组")

readme = (root / "README.md").read_text(encoding="utf-8")
for marker in ("npx skills add", "skills.sh/b/", "bash scripts/validate.sh"):
    if marker not in readme:
        raise SystemExit(f"README 缺少关键标记：{marker}")

print(f"validate: OK ({len(required)} 个必备文件，{len(evals['evals'])} 组评测)")
PY
