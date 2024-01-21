# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit flag-o-matic toolchain-funcs

MY_PV="2.10"
MY_PN="syntax"

DESCRIPTION="Jameica plugin SynTAX ist eine freie Finanzbuchhaltung für Selbständige nach SKR03/04"
HOMEPAGE="https://www.willuhn.de/products/hibiscus/"
SRC_URI="https://www.willuhn.de/products/${MY_PN}/releases/${MY_PV}/${MY_PN}-${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
RESTRICT="strip"
S="${WORKDIR}"

RDEPEND=">=dev-java/jameica-2.10.0"

src_prepare() {
    default
}

src_install() {
    dodir /opt/jameica/plugins
	cp -ap "${S}"/* "${D}"/opt/jameica/plugins/syntax/
}
