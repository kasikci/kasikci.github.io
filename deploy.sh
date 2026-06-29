#!/usr/bin/env bash
set -euo pipefail

remote="${DEPLOY_REMOTE:-baris@recycle.cs.washington.edu:/cse/web/homes/baris/}"
host="${JEKYLL_HOST:-127.0.0.1}"
port="${JEKYLL_PORT:-4000}"
wait_seconds="${JEKYLL_WAIT_SECONDS:-60}"
dry_run=0
jekyll_pid=""
log_file=""

usage() {
  cat <<'USAGE'
Usage: ./deploy.sh [--dry-run]

Builds the Jekyll site by starting `jekyll serve`, then syncs `_site/` to:
  baris@recycle.cs.washington.edu:/cse/web/homes/baris/

Environment overrides:
  DEPLOY_REMOTE          rsync destination
  JEKYLL_HOST            local Jekyll host, default 127.0.0.1
  JEKYLL_PORT            local Jekyll port, default 4000
  JEKYLL_WAIT_SECONDS    seconds to wait for Jekyll, default 60
USAGE
}

cleanup() {
  if [[ -n "$jekyll_pid" ]] && kill -0 "$jekyll_pid" 2>/dev/null; then
    kill "$jekyll_pid" 2>/dev/null || true
    wait "$jekyll_pid" 2>/dev/null || true
  fi

  if [[ -n "$log_file" && -f "$log_file" ]]; then
    rm -f "$log_file"
  fi
}

trap cleanup EXIT

case "${1:-}" in
  "")
    ;;
  "--dry-run")
    dry_run=1
    ;;
  "-h"|"--help")
    usage
    exit 0
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac

if [[ ! -f "_config.yml" ]]; then
  echo "deploy.sh must be run from the repository root." >&2
  exit 1
fi

if ! command -v jekyll >/dev/null 2>&1; then
  echo "jekyll is not installed or not on PATH." >&2
  exit 1
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "rsync is not installed or not on PATH." >&2
  exit 1
fi

log_file="$(mktemp "${TMPDIR:-/tmp}/jekyll-serve.XXXXXX.log")"

echo "Starting Jekyll to regenerate _site/..."
jekyll serve --host "$host" --port "$port" --no-watch >"$log_file" 2>&1 &
jekyll_pid="$!"

for ((elapsed = 0; elapsed < wait_seconds; elapsed++)); do
  if ! kill -0 "$jekyll_pid" 2>/dev/null; then
    echo "jekyll serve exited before the site was ready. Output:" >&2
    cat "$log_file" >&2
    exit 1
  fi

  if grep -Eq "Server address:|Server running|Auto-regeneration" "$log_file"; then
    break
  fi

  sleep 1
done

if ! grep -Eq "Server address:|Server running|Auto-regeneration" "$log_file"; then
  echo "Timed out waiting for jekyll serve. Output:" >&2
  cat "$log_file" >&2
  exit 1
fi

if [[ ! -d "_site" ]]; then
  echo "Jekyll did not create _site/." >&2
  exit 1
fi

rsync_args=(-av --delete)
if [[ "$dry_run" -eq 1 ]]; then
  rsync_args+=(--dry-run)
  echo "Dry run: no files will be copied."
fi

echo "Syncing _site/ to $remote"
rsync "${rsync_args[@]}" _site/ "$remote"
