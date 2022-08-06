# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Extract icons from Windows PE files (.exe/.dll) "
HOMEPAGE="https://github.com/jlu5/icoextract"

LICENSE="GPL-3+"
SLOT="0"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jlu5/icoextract.git"
else
	SRC_URI="https://github.com/jlu5/icoextract/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
	S="${WORKDIR}/${P}"
fi

RESTRICT="mirror"
IUSE=""
# pytest-xdist isn't really required but it helps speed up tests
BDEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/installer[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_python_prepare_all

}

python_test() {
	epytest -n auto
}
