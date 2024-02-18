# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A multi-functional app to find duplicates, empty folders, similar images, etc."
HOMEPAGE="https://github.com/qarmin/czkawka"
SRC_URI="https://github.com/qarmin/czkawka/releases/download/${PV}/linux_czkawka_cli
	gtk? ( https://github.com/qarmin/czkawka/releases/download/${PV}/linux_czkawka_gui )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk"

S="${WORKDIR}"

src_install() {
	newbin ${DISTDIR}/linux_czkawka_cli ${PN}
	use gtk && newbin ${DISTDIR}/linux_czkawka_gui ${PN}-gui
}
