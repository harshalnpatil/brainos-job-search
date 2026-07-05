#!/usr/bin/env zsh
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: create-company-from-templates.zsh [--output-root DIR] Company Name Parts...

Creates companies/YYYY_MM_DD_<slug>/ from templates/ and renames CompanyName_* files.
EOF
}

script_dir="${0:A:h}"
repo_root="${script_dir:h}"
templates_root="${repo_root}/templates"
output_root="${repo_root}/companies"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --output-root)
      shift
      [[ $# -gt 0 ]] || { echo "Missing value for --output-root" >&2; exit 1; }
      output_root="$1"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
    *)
      break
      ;;
  esac
done

if [[ $# -lt 1 ]]; then
  usage >&2
  exit 1
fi

company_name="$*"
company_slug="$(printf '%s' "$company_name" \
  | tr '[:upper:]' '[:lower:]' \
  | sed -E 's/[[:space:]]+/_/g; s/[^a-z0-9_]+/_/g; s/_+/_/g; s/^_|_$//g')"

if [[ -z "$company_slug" ]]; then
  echo "Company name slug resolved to empty (input was: '$company_name')." >&2
  exit 1
fi

if [[ ! -d "$templates_root" ]]; then
  echo "Templates folder not found: $templates_root" >&2
  exit 1
fi

date_part="$(date +%Y_%m_%d)"
destination_root="${output_root}/${date_part}_${company_slug}"

if [[ -e "$destination_root" ]]; then
  echo "Destination already exists: $destination_root" >&2
  exit 1
fi

mkdir -p "$destination_root"

for template in "$templates_root"/*.md(N); do
  cp "$template" "$destination_root/"
done

find "$destination_root" -depth -name 'CompanyName_*' | while IFS= read -r path; do
  base="${path:t}"
  new_base="${base/#CompanyName_/${company_slug}_}"
  mv "$path" "${path:h}/$new_base"
done

print -r -- "Created: $destination_root"
