# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..12} )
inherit distutils-r1

DESCRIPTION="GUI for snapper, a tool for Linux filesystem snapshot management"
HOMEPAGE="https://github.com/ricardomv/snapper-gui"
if [[ "${PV}" = 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ricardomv/${PN}.git"
else
	SRC_URI="https://github.com/ricardomv/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND="${PYTHON_DEPEND}"
RDEPEND="
	${DEPEND}
	app-backup/snapper
	dev-python/dbus-python
	dev-python/pygobject
	x11-libs/gtksourceview:3.0
"

src_prepare() {
	sed -i 's/Utilities;/Utility;/' ${S}/snapper-gui.desktop
	default
}
