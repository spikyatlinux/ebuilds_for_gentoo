# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit qmake-utils autotools desktop

DESCRIPTION="Ascii Design is an ascii-art program based on figlet engine."
HOMEPAGE="https://github.com/Faster3ck/Ascii-Design"
SRC_URI="https://github.com/Faster3ck/Ascii-Design/archive/v${PV}.tar.gz -> ascii-design-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

RDEPEND="
app-misc/figlet
dev-qt/qtcore:5
"

DEPEND="${RDEPEND}"

S="${WORKDIR}"


src_compile() {
    eqmake5 Ascii-Design-${PV}/ascii-design.pro
    emake || die
}

src_install() {
    dobin bin/ascii-design || die
    domenu "${FILESDIR}/ascii-design.desktop" || die
    newicon "${FILESDIR}/ascii-design.png" ascii-design.png || die
}

pkg_postinst() {
	einfo ""
	einfo "Set figlet font path in ${P} to \`/usr/share/figlet\`."
	einfo "The binary of figlet should be autodetect"
	einfo ""
}
