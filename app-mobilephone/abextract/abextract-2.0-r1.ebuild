# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Tool to extract and repack ADB backup"
HOMEPAGE="https://github.com/anoop142/abextract"
EGIT_REPO_URI="https://github.com/anoop142/abextract.git"
EGIT_COMMIT="286acf6c03dded1779a32b413fb790baf25cd46f"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
SLOT="0"

src_prepare() {
	default
}

src_compile() {
	emake
}

src_install() {
	dobin ${PN}
}
