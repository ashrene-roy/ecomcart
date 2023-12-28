#!/bin/bash

# Usage: replace-placeholders.sh <FilePath> <OutputDirectory> <placeholder1=value1> <placeholder2=value2> ...

FilePath="$1"
OutputDirectory="$2"
shift 2

mkdir -p "$OutputDirectory"

find "$FilePath" -type f | while read -r file; do
    filecontent=$(cat "$file")

    for arg in "$@"; do
        placeholder="${arg%%=*}"
        value="${arg#"$placeholder="}"
        filecontent=${filecontent//@@$placeholder@@/$value}
    done

    new_file_name=$(basename "$file")
    echo "$filecontent" > "$OutputDirectory/$new_file_name"
done
