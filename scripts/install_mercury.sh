#!/usr/bin/env bash

# WIP!!!!!!!!!!
# how tf do I install it

set -ex

pkgname=mercury
pkgver=22.01.9
pkgrel=1
pkgdesc="The mercury language compiler."

srcdir="${PWD}/src"
pkgdir="${PWD}/pkg"
MAKEFLAGS="${MAKEFLAGS:--j$(nproc)}"

source_url="http://dl.mercurylang.org/release/mercury-srcdist-${pkgver}.tar.xz"
source_archive="${srcdir}/mercury-srcdist-${pkgver}.tar.xz"
source_dir="${srcdir}/mercury-srcdist-${pkgver}"

expected_b2sum="9b7c5eff278e9d9e9cbebe0e3ae47ebba610865a9a65d3489b511f9cf3603cf01ed88ce6a8fa2ca2b66fda37316a6d1549097e22ab74a023832f6c68e6c1afee"

function check_dependencies() {
    local missing=()

    for cmd in gcc make flex bison curl b2sum; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            missing+=("$cmd")
        fi
    done

    if ((${#missing[@]})); then
        printf 'Missing required tools: %s\n' "${missing[*]}" >&2
        printf 'Install them using your distribution package manager.\n' >&2
        exit 1
    fi
}

function download_source() {
    mkdir -p "$srcdir"

    if [[ ! -f "$source_archive" ]]; then
        echo "Downloading Mercury ${pkgver}..."
        curl -fL "$source_url" -o "$source_archive"
    fi

    echo "Verifying source archive checksum..."
    printf '%s  %s\n' "$expected_b2sum" "$source_archive" | b2sum --check

    if [[ ! -d "$source_dir" ]]; then
        echo "Extracting source archive..."
        tar -xf "$source_archive" -C "$srcdir"
    fi
}

function build() {
    cd "$source_dir"

    echo "EXTRA_CFLAGS += -Wno-error=array-parameter" >>Mmake.params
    echo "EXTRA_CFLAGS += -Wno-error=discarded-qualifiers" >>Mmake.params

    echo "Configuring Mercury..."
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --disable-inefficient-grades

    echo "Building Mercury..."
    make PARALLEL="$MAKEFLAGS"
}

function package() {
    cd "$source_dir"

    mkdir -p "$pkgdir"

    echo "Installing Mercury into ${pkgdir}..."

    make \
        DESTDIR="$pkgdir" \
        INSTALL_PREFIX="${pkgdir}/usr" \
        INSTALL_MAN_DIR="${pkgdir}/usr/share/man" \
        INSTALL_INFO_DIR="${pkgdir}/usr/share/info" \
        MERCURY_COMPILER="${pkgdir}/usr/bin/mercury_compile" \
        MERCURY_CONFIG_DIR="${pkgdir}/usr/lib/mercury" \
        PARALLEL="$MAKEFLAGS" \
        LIBGRADES=asm_fast.gc \
        install

    rm -f \
        "${pkgdir}/usr/bin/mdb.bat" \
        "${pkgdir}/usr/bin/mercury.bat" \
        "${pkgdir}/usr/bin/mprof.bat"

    echo "Installation staged in: ${pkgdir}/usr"
}

function main() {
    check_dependencies
    download_source
    build
    package

    echo
    echo "Mercury ${pkgver} built successfully."
    echo "Staged installation directory: ${pkgdir}/usr"
    echo "No system-wide installation was performed."
}

main "$@"
