# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Chromium running inside your terminal"
HOMEPAGE="https://github.com/fathyb/carbonyl"

LICENSE="BSD"
SLOT="0"

KEYWORDS="~amd64"
RESTRICT="mirror"

MY_PN="carbonyl"
MY_P="${MY_PN}-${PV}"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""
SRC_URI="https://github.com/fathyb/${MY_PN}/releases/download/v${PV}/${MY_PN}.linux-amd64.zip -> ${MY_P}.zip"

QA_PREBUILT="/opt/${MY_P}/${MY_PN}"
QA_PRESTRIPPED="/opt/${MY_P}/libEGL.so
				/opt/${MY_P}/libvk_swiftshader.so
				/opt/${MY_P}/libvulkan.so.1
				/opt/${MY_P}/libGLESv2.so"

src_unpack() {
	mkdir -p "${S}"
	cd "${S}" || die
	unpack "${MY_P}.zip"
}

src_install() {
	mkdir --parents "${D}/opt/"
	cp -r "${WORKDIR}/${P}/${MY_P}/" "${D}/opt/"
	dobin "${FILESDIR}/${MY_PN}"
}
