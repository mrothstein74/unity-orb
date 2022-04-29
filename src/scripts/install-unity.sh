#!/usr/bin/env bash

install_hub_windows() {
  # The piped empty space is required to prevent the script from hanging indefinitely.
  # https://serverfault.com/a/932946
  printf '%s\n' "" | choco install unity-hub --version 3.1.2 --checksum64 B12C5390400243B52F5F37153087F7669EDC25A56F282C0A5835B76B9EF61771
  printf '%s\n' 'export PATH=$PATH:/c/Program Files/Unity Hub' >> "$BASH_ENV"
  
  # shellcheck source=/dev/null
  source "$BASH_ENV"
}

install_editor_windows() {
  # shellcheck disable=SC2140
  "/c/Program Files/Unity Hub/Unity Hub.exe" -- --headless install --version "2021" --module windows-il2cpp --childModules
}

install_hub_"$PLATFORM"
install_editor_"$PLATFORM"