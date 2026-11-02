#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 || -z $1 ]]; then
  printf 'Usage: %s "post title"\n' "${0##*/}" >&2
  exit 2
fi

title=$1
if [[ $title == */* || $title == *$'\n'* ]]; then
  printf 'The title must not contain slashes or newlines.\n' >&2
  exit 2
fi

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
posts_dir="$script_dir/_posts"
if [[ ! -d $posts_dir ]]; then
  printf 'Posts directory not found: %s\n' "$posts_dir" >&2
  exit 1
fi

latest_date=
for file in "$posts_dir"/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*.md; do
  [[ -e $file ]] || continue
  filename=${file##*/}
  file_date=${filename:0:10}
  if [[ -z $latest_date || $file_date > $latest_date ]]; then
    latest_date=$file_date
  fi
done

if [[ -z $latest_date ]]; then
  printf 'No dated Markdown posts found in %s\n' "$posts_dir" >&2
  exit 1
fi

next_date=$(date -d "$latest_date + 1 day" +%F)
slug=${title// /-}
new_file="$posts_dir/$next_date-$slug.md"
if [[ -e $new_file ]]; then
  printf 'File already exists: %s\n' "$new_file" >&2
  exit 1
fi

if ! printf '%s\n\nstyle: post\n\ntitle: %s\n\n---\n' '---' "$title" > "$new_file"; then
  printf 'Could not create file: %s\n' "$new_file" >&2
  exit 1
fi

printf 'Created %s\n' "$new_file"
