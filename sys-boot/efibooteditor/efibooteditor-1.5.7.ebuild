# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Boot Editor for (U)EFI based systems"
HOMEPAGE="https://github.com/Neverous/efibooteditor"
SRC_URI="https://github.com/Neverous/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
		>=dev-qt/qtbase-6.11:6[gui,network,widgets]
		dev-qt/qtsvg:6
		>=sys-libs/efivar-39:=
		>=sys-libs/zlib-1.3:=
"
RDEPEND="${DEPEND}"
BDEPEND="
		virtual/pkgconfig
"

src_prepare() {
		# Replaces hardcoded 'DESTINATION lib' with the correct Gentoo path
		sed -i -e 's/DESTINATION lib/DESTINATION ${CMAKE_INSTALL_LIBDIR}/g' CMakeLists.txt || die

		# Removes the hardcoded 0.0.0- fallback and sets the ebuild version
		sed -i -e "s/\"0.0.0-[^\"]*\"/\"${PV}\"/" CMakeLists.txt || die

		cmake_src_prepare
}

src_configure() {
		local mycmakeargs=(
				-DQT_VERSION_MAJOR=6
				-DCMAKE_INSTALL_RPATH="${EPREFIX}/usr/$(get_libdir)"
				-DBUILD_SHARED_LIBS=OFF
		)

		cmake_src_configure
}

src_install() {
		cmake_src_install

		# Removes AppImage-specific files that are incorrectly installed into the FHS
		rm -f "${ED}/usr/AppRun" || die
}
