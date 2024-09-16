# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Command-line Polkit tool"
HOMEPAGE="https://github.com/OmarCastro/cmd-polkit"
SRC_URI="https://github.com/OmarCastro/cmd-polkit/archive/refs/tags/v0.3.0.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-build/meson
        dev-build/ninja"
RDEPEND=""

src_configure() {
    # Configure Meson to use /usr instead of /usr/local
    meson setup builddir --prefix=/usr
}

src_compile() {
    # Compile the project using `ninja`
    meson compile -C builddir
}

src_install() {
    # Install the compiled binaries
    DESTDIR="${D}" meson install -C builddir
}
