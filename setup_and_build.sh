#!/usr/bin/env bash

# Bootstrap and build the website and resume on a fresh Debian/Ubuntu machine.
# Run this script from anywhere after cloning the repository:
#
#   ./setup_and_build.sh

set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

log() {
  printf '\n==> %s\n' "$1"
}

fail() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

[[ "$(uname -s)" == "Linux" ]] || fail "This script currently supports Linux only."
command -v apt-get >/dev/null 2>&1 || \
  fail "This script requires a Debian/Ubuntu system with apt-get."

if [[ "${EUID}" -eq 0 ]]; then
  APT=(apt-get)
  INSTALL=(install)
else
  command -v sudo >/dev/null 2>&1 || \
    fail "sudo is required to install system packages."
  APT=(sudo apt-get)
  INSTALL=(sudo install)
fi

cd "${SCRIPT_DIR}"

log "Installing system build dependencies"
"${APT[@]}" update
"${APT[@]}" install -y \
  build-essential \
  bundler \
  ca-certificates \
  curl \
  git \
  libcurl4-openssl-dev \
  libffi-dev \
  libssl-dev \
  libyaml-dev \
  pkg-config \
  ruby-dev \
  ruby-full \
  xz-utils \
  zlib1g-dev

if ! command -v tectonic >/dev/null 2>&1; then
  log "Installing Tectonic"
  readonly TECTONIC_TMP="$(mktemp -d)"
  trap 'rm -rf -- "${TECTONIC_TMP}"' EXIT

  (
    cd "${TECTONIC_TMP}"
    curl --proto '=https' --tlsv1.2 -fsSL \
      https://drop-sh.fullyjustified.net \
      -o install-tectonic.sh
    sh install-tectonic.sh
  )

  "${INSTALL[@]}" -d /usr/local/bin
  "${INSTALL[@]}" -m 0755 "${TECTONIC_TMP}/tectonic" /usr/local/bin/tectonic
fi

log "Installing the locked Jekyll dependencies"
bundle config set --local path vendor/bundle
bundle install --jobs 4 --retry 3

log "Building the Jekyll website"
bundle exec jekyll build

log "Building the resume PDF"
make resume

log "Build complete"
printf 'Website: %s\n' "${SCRIPT_DIR}/_site"
printf 'Resume:  %s\n' "${SCRIPT_DIR}/files/Zijian_Qin_Resume.pdf"
