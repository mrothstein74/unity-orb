#!/usr/bin/env bash

readonly os_name="$(uname -s | tr '[:upper:]' '[:lower:]')"

if [ "$os_name" == "linux"* ]; then
  printf '%s\n' "Detected OS: Linux."
  printf '%s\n' "export OS_NAME=linux" >> "$BASH_ENV"

elif [ "$os_name" == "darwin"* ]; then
  printf '%s\n' "Detected OS: macOS."
  printf '%s\n' "export OS_NAME=macos" >> "$BASH_ENV"

elif [ "$os_name" == "msys"* || "$os_name" == "cygwin"* ]; then
  printf '%s\n' "Detected OS: Windows."
  printf '%s\n' "export OS_NAME=windows" >> "$BASH_ENV"
  
else
  echo "Unsupported OS: \"$os_name\"."
  exit 1
fi
