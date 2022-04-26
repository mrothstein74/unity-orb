#!/usr/bin/env bash

readonly os_name="$(uname -s | tr '[:upper:]' '[:lower:]')"

case "$os_name" in
  linux*)
    printf '%s\n' "Detected OS: Linux."
    printf '%s\n' "export OS_NAME=linux" >> "$BASH_ENV"
    ;;
  darwin*)
    printf '%s\n' "Detected OS: macOS."
    printf '%s\n' "export OS_NAME=macos" >> "$BASH_ENV"
    ;;
  msys*|cygwin*)
    printf '%s\n' "Detected OS: Windows."
    printf '%s\n' "export OS_NAME=windows" >> "$BASH_ENV"
    ;;
  *)
    echo "Unsupported OS: \"$os_name\"."
    exit 1
    ;;
esac