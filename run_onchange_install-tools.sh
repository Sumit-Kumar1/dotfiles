#!/bin/bash
set -e
command -v cargo-binstall >/dev/null || curl -L --proto '=https' --tlsv1.2 -sSf \
  https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

cargo binstall -y --only-signed=false ripgrep fd-find bat eza zoxide git-delta just \
  bottom atuin zellij xh jless du-dust procs sd tokei hyperfine yazi-fm yazi-cli git-absorb

command -v mise >/dev/null && mise install
