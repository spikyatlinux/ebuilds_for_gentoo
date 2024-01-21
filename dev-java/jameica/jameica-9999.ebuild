# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

MY_PV="2.11.0"

DESCRIPTION="Official prebuilt nightly Jameica Online Banking Software, written in Java"
HOMEPAGE="http://www.jameica.org"
SRC_URI="x86? ( http://www.willuhn.de/products/${PN}/releases/nightly/${PN}-linux-${MY_PV}-nightly.zip
			-> ${P}.zip )
		 amd64? (
		 http://www.willuhn.de/products/${PN}/releases/nightly/${PN}-linux64-${MY_PV}-nightly.zip -> ${P}-linux64.zip )"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

S="${WORKDIR}"

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}
>=virtual/jre-1.6.0
=app-office/hibiscus-9999"

src_install() {
	mkdir ${D}/opt
	mkdir ${D}/usr
	mkdir ${D}/usr/bin
	if use x86; then
		unzip ${DISTDIR}/${P}.zip -d ${D}/opt/
		echo "#!/bin/bash" >> ${D}/usr/bin/jameica
		echo "/opt/jameica/jameica.sh" >> ${D}/usr/bin/jameica
	elif use amd64; then
		unzip ${DISTDIR}/${P}-linux64.zip -d ${D}/opt/
		echo "#!/bin/bash" >> ${D}/usr/bin/jameica
		echo "/opt/jameica/jameica.sh" >> ${D}/usr/bin/jameica
	fi
	chmod a+x ${D}/usr/bin/jameica
	mkdir -p ${D}/usr/share/applications/
	cp "${FILESDIR}/jameica.desktop" ${D}/usr/share/applications/ || die
}

pkg_postinst() {
	elog
	elog "You may want to install app-office/hibiscus"
	elog
}
