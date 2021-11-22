# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="View output of a parallel emerge from a separate terminal"
HOMEPAGE="${BASE_SERVER_URI}/${PN}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/TheGreatMcPain/${PN}.git"
	KEYWORDS=""
else
    BASE_SERVER_URI="https://github.com/TheGreatMcPain"
    SRC_URI="${BASE_SERVER_URI}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
	>=sys-libs/ncurses-5.9-r2
	>=app-shells/bash-4.2"

src_install() {
	dobin "${PN}"
	doman "${PN}.1"
}
