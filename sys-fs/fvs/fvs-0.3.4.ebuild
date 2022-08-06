# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="File Versioning System with hash comparison, deduplication and data storage to create unlinked states that can be deleted"
HOMEPAGE="https://github.com/mirkobrombin/FVS"

LICENSE="GPL-3+"
SLOT="0"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mirkobrombin/FVS.git"
else
	SRC_URI="https://github.com/mirkobrombin/FVS/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
	S="${WORKDIR}/${PN^^}-${PV}"
fi

RESTRICT="mirror"
IUSE=""
# pytest-xdist isn't really required but it helps speed up tests
BDEPEND="
	dev-python/orjson[${PYTHON_USEDEP}]
"

RDEPEND="
	${BDEPEND}
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_python_prepare_all

}

python_test() {
	epytest -n auto
}
