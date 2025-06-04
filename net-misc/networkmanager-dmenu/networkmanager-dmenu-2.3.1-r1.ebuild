# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..14} )
inherit desktop python-r1

DESCRIPTION="Control networkmanager using DMENU"
HOMEPAGE="https://github.com/firecat53/networkmanager-dmenu"
SRC_URI="https://github.com/firecat53/networkmanager-dmenu/archive/v${PV}.tar.gz -> networkmanager-dmenu-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+dmenu rofi"
REQUIRED_USE="^^ ( dmenu rofi ) ${PYTHON_REQUIRED_USE}"
DEPEND="
	net-misc/networkmanager
	dmenu? ( x11-misc/dmenu )
	rofi? ( x11-misc/rofi )
	dev-python/pygobject
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}/${PN}-${PV}"

src_install() {
	exeinto /usr/bin/
	doexe networkmanager_dmenu
	#domenu networkmanager_dmenu.desktop
	make_desktop_entry networkmanager_dmenu ${PN} network-wireless-symbolic "Settings;Network;"
	dodoc LICENSE.txt
	dodoc README.md
	dodoc config.ini.example
	elog "Now you need to configure the package."
	elog "Configuration guide: https://github.com/firecat53/networkmanager-dmenu#installation"
}
