#!/usr/bin/env bash
# _quarto.yml의 {{YEAR}}, {{LAST_UPDATED}} 자리표시자를 현재 날짜로 치환합니다.
# - GitHub Actions 배포 시 자동 실행됩니다.
# - 로컬 미리보기: `bash scripts/stamp-date.sh` 실행 후 `quarto preview` (git에는 커밋하지 마세요)
set -euo pipefail

cd "$(dirname "$0")/.."

YEAR=$(date +%Y)
LAST_UPDATED=$(date "+%b. %Y")   # 예: Aug. 2026

sed -i.bak \
  -e "s/{{YEAR}}/${YEAR}/g" \
  -e "s/{{LAST_UPDATED}}/${LAST_UPDATED}/g" \
  _quarto.yml
rm -f _quarto.yml.bak

echo "Stamped: © ${YEAR} / Last updated: ${LAST_UPDATED}"
