# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..12} )
inherit python-single-r1 xdg

DESCRIPTION="An Openbox pipe menu application and file browser."
HOMEPAGE="
https://xyne.dev/projects/obfilebrowser"
SRC_URI="https://xyne.dev/projects/obfilebrowser/src/obfilebrowser-${PV}.tar.xz -> ${P}.tar.xz"
KEYWORDS="~amd64"
S="${WORKDIR}/${PN}-${PV}"

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
"
RDEPEND="
	x11-misc/mimeo
	${DEPEND}
"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	eapply_user
}

src_install() {
	python_optimize "${D}"
	dobin "${S}"/${PN}
	python_domodule ObFileBrowser.py ObFileBrowser.py
}

pkg_preinst() {
	xdg_pkg_preinst
}

pkg_postinst() {
	xdg_pkg_postinst
}

pkg_postrm() {
	xdg_pkg_postrm
}
