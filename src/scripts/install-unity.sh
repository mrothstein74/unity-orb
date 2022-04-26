#!/usr/bin/env bash

install_unity_windows() {
  # The piped empty space is required to prevent the script from hanging indefinitely.
  # https://serverfault.com/a/932946
  printf '%s\n' "" | choco install unity-hub --version 3.1.1
  printf '%s\n' "PATH=$PATH:/c/Program Files/Unity Hub" >> "$BASH_ENV"
  
  # shellcheck source=/dev/null
  source "$BASH_ENV"
  
  # shellcheck disable=SC2140
  "Unity Hub.exe" -- --headless install --version "2021" --module windows-il2cpp --childModules
}

if [ "$PLATFORM" == "windows" ]; then
  install_unity_windows
fi
