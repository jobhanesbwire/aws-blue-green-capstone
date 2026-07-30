#!/bin/bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <BLUE_URL> <GREEN_URL>" >&2
  exit 1
fi

BLUE_URL="$1"
GREEN_URL="$2"

check_url() {
  local name="$1"
  local url="$2"
  local status
  local health_status
  local response_body
  local temp_file
  temp_file="$(mktemp)"

  if ! status="$(curl -sS -o "$temp_file" -w '%{http_code}' --max-time 10 "$url")"; then
    echo "[FAIL] $name: unable to reach $url" >&2
    rm -f "$temp_file"
    return 1
  fi

  if [[ "$status" != "200" ]]; then
    echo "[FAIL] $name: expected HTTP 200 but received $status" >&2
    rm -f "$temp_file"
    return 1
  fi

  if ! health_status="$(curl -sS -o /dev/null -w '%{http_code}' --max-time 10 "$url/health")"; then
    echo "[FAIL] $name: unable to reach ${url}/health" >&2
    rm -f "$temp_file"
    return 1
  fi

  response_body="$(tr -d '\r\n' < "$temp_file")"
  echo "[PASS] $name: HTTP 200 from $url"
  echo "[PASS] $name: /health returned HTTP $health_status"
  echo "[INFO] $name: response preview: ${response_body:0:120}"
  rm -f "$temp_file"
}

check_url "Blue" "$BLUE_URL"
check_url "Green" "$GREEN_URL"

echo
echo "Note: This script verifies basic availability and response behavior only."
echo "Please compare networking, security groups, instance type, AMI, IAM role, subnets, and tags in the AWS Console."
