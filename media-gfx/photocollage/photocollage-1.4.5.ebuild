# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=no

inherit eutils distutils-r1

DESCRIPTION="Graphical tool to make photo collage posters"
HOMEPAGE="https://github.com/adrienverge/PhotoCollage"
SRC_URI="https://github.com/adrienverge/PhotoCollage/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}/PhotoCollage-${PV}"

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_install() {
	distutils-r1_python_install
}

python_install_all() {
	distutils-r1_python_install_all
}
