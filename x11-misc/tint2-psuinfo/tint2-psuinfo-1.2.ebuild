# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..12} )
inherit python-single-r1 xdg

DESCRIPTION="A psutil-based command to display customizable system info, intended for Tint2 or other panels"
HOMEPAGE="
https://github.com/nwg-piotr/psuinfo
"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nwg-piotr/psuinfo.git"
else
	SRC_URI="https://github.com/nwg-piotr/psuinfo/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/psuinfo-${PV}"
fi

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	dev-python/psutil
"
RDEPEND="
	x11-misc/tint2
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
	dobin "${S}"/psuinfo

	insinto /usr/share/psuinfo/
	doins -r "${S}"/icons/

	insinto /usr/share/tint2/
	doins -r "${S}"/configs/*
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
