# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A command-line tool to extract metadata from torrent files"
HOMEPAGE="https://github.com/TheGoblinHero/dumptorrent"
SRC_URI="https://github.com/TheGoblinHero/dumptorrent/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-build/cmake
        sys-libs/zlib"
RDEPEND="${DEPEND}"

src_configure() {
    local mycmakeargs=(
	-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
    )
    cmake_src_configure
}

src_compile() {
    cmake_src_compile
}

src_install() {
    cmake --install "${BUILD_DIR}" --prefix="${D}/usr" || die "cmake install failed"
    # Ensure the binary is installed
    if [[ ! -f "${D}/usr/bin/dumptorrent" ]]; then
        einfo "Manually installing dumptorrent binary"
        dobin "${BUILD_DIR}/dumptorrent"
    fi
    dodoc README.md
}
