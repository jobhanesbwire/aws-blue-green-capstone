#!/bin/bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <URL> [EXPECTED_ENVIRONMENT]" >&2
  exit 1
fi

TARGET_URL="$1"
EXPECTED_ENVIRONMENT="${2:-}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

HTTP_HEADERS="$TMP_DIR/headers.txt"
HTTP_BODY="$TMP_DIR/body.html"

pass() {
  echo "[PASS] $1"
}

fail() {
  echo "[FAIL] $1" >&2
  exit 1
}

curl -sS -L --connect-timeout 5 --max-time 15 -D "$HTTP_HEADERS" -o "$HTTP_BODY" "$TARGET_URL" > /dev/null || fail "Unable to reach $TARGET_URL"

STATUS_CODE="$(awk 'NR==1 {print $2}' "$HTTP_HEADERS")"
if [[ "$STATUS_CODE" != "200" ]]; then
  fail "Expected HTTP 200 from $TARGET_URL but received $STATUS_CODE"
fi
pass "HTTP 200 received from $TARGET_URL"

if [[ -n "$EXPECTED_ENVIRONMENT" ]]; then
  if ! grep -qi "$EXPECTED_ENVIRONMENT" "$HTTP_BODY"; then
    fail "Expected page content containing '$EXPECTED_ENVIRONMENT' was not found"
  fi
  pass "Expected environment marker '$EXPECTED_ENVIRONMENT' found in the page content"
fi

curl -sS -L --connect-timeout 5 --max-time 15 -o /dev/null "$TARGET_URL/health" > /dev/null || fail "Health endpoint check failed"
pass "Health endpoint responded successfully"

echo "Smoke test completed successfully."
