# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..10} )

inherit distutils-r1

DESCRIPTION="Continue unsuccessfull merge of last ebuild from /var/log/emerge.log"
HOMEPAGE="https://gitlab.phys-el.ru/ustinov/remerge"
SRC_URI="https://gitlab.phys-el.ru/ustinov/${PN}/-/archive/${PV}/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"


RDEPEND="
"

src_prepare() {
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
}

python_install() {
	distutils-r1_python_install --skip-build
}

python_install_all() {
	distutils-r1_python_install_all
}
