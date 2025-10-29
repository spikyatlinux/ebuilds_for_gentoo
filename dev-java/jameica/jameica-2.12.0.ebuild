# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN%}"

inherit desktop systemd

DESCRIPTION="Official Jameica Online Banking Software, written in Java"
HOMEPAGE="https://jameica.org/"
SRC_URI="x86? ( https://jameica.org/products/${PN}/releases/current/${PN}/${PN}-${PV}.zip
			-> ${P}.zip )
		 amd64? (
		 https://jameica.org/products/${PN}/releases/current/${PN}/${PN}-linux64-${PV}.zip
			-> ${P}-linux64.zip )"

# Jameica: GPL-2
# lib/apache_xmlrpc, lib/jakarta_commons, lib/velocity: Apache-2.0
# lib/swt: CPL-1.0 LGPL-2 MPL-1.1
# lib/h2: EPL-1.0 MPL-2.0
# lib/paperclips: EPL-1.0
# lib/mckoi, lib/mysql: GPL-2
# lib/de_willuhn_ds, lib/de_willuhn_util, lib/swtcalendar: LGPL-2
# lib/bouncycastle: MIT
# lib/nanoxml: ZLIB
LICENSE="Apache-2.0 CPL-1.0 EPL-1.0 GPL-2 LGPL-2 MIT MPL-1.1 MPL-2.0 ZLIB"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="
	virtual/jre
	>=app-office/hibiscus-2.10
"
BDEPEND="
	app-arch/unzip
"

S="${WORKDIR}/jameica"

JAMEICA_INSFILES=( jameica-icon.png jameica{,-linux64}.jar lib plugin.xml )
JAMEICA_EXEFILES=( jameicaserver.sh jameica.sh rcjameica-systemd )

src_install() {
	dodoc README

	insinto /opt/${MY_PN}
	doins -r "${JAMEICA_INSFILES[@]}"
	exeinto /opt/${MY_PN}
	doexe "${JAMEICA_EXEFILES[@]}"

	systemd_dounit "${MY_PN}.service"

	# There is plenty of dirt, mainly in the bundled libs
	find "${ED}/opt/${MY_PN}" -type f \( \
			-name "LICENSE" \
			-o -name "license.txt" \
			-o -name "license.html" \
			-o -name "lgpl*.txt" \
			-o -name "mpl*.txt" \
			-o -name "webkit-bsd.txt" \
			-o -name "*README*" \
		\) -delete || die

	make_desktop_entry "/bin/sh /opt/${MY_PN}/jameica.sh" Jameica \
	"/opt/${MY_PN}/jameica-icon.png" "Office"
}
