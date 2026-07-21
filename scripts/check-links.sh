#!/usr/bin/env bash
# Extract every URL from the READMEs and report non-200 responses.
# Usage: ./scripts/check-links.sh [file ...]   (defaults to both READMEs)

set -uo pipefail
cd "$(dirname "$0")/.."

files=("${@:-}")
if [ -z "${files[0]:-}" ]; then
  files=(README.md README.zh-CN.md)
fi

urls=$(grep -ho 'https\?://[^)" ]*' "${files[@]}" | sed 's/[.,]$//' | sort -u)
total=$(printf '%s\n' "$urls" | grep -c . || true)

echo "Checking $total unique URLs from: ${files[*]}"
echo

fail=0
while IFS= read -r url; do
  [ -z "$url" ] && continue
  code=$(curl -sL -o /dev/null -w '%{http_code}' -m 25 \
    -A 'Mozilla/5.0 (compatible; awesome-codex-linkcheck/1.0)' "$url" || echo 000)
  case "$code" in
    200|301|302|403|429)
      # 403/429 are usually bot protection, not a dead link. Reported, not failed.
      [ "$code" = "200" ] || echo "  note $code  $url"
      ;;
    *)
      echo "  FAIL $code  $url"
      fail=$((fail + 1))
      ;;
  esac
done <<< "$urls"

echo
if [ "$fail" -gt 0 ]; then
  echo "$fail broken link(s) out of $total."
  exit 1
fi
echo "All $total links OK."
