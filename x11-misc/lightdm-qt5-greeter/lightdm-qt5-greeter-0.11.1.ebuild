# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="lightdm-qt5-greeter is a simple frontend for the lightdm displaymanager, written in c++ and qt5."
HOMEPAGE="https://github.com/rezso/lightdm-qt5-greeter"
SRC_URI="https://github.com/rezso/lightdm-qt5-greeter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="virtual/pkgconfig"

RDEPEND="
	>=dev-qt/qtcore-5.15.5
	>=x11-misc/lightdm-1.12
"
DEPEND="${RDEPEND}"

DOCS="README.md"

src_prepare() {
	eapply_user
	cmake_src_prepare
}

src_configure() {
	CMAKE_MAKEFILE_GENERATOR=emake
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DBUILD_TESTING=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	einfo ""
	einfo "Update or insert in(to) your /etc/lightdm/lightdm.conf, in the SeatDefaults section, this line:"
	einfo "greeter-session=lightdm-qt5-greeter"
	einfo ""
}
