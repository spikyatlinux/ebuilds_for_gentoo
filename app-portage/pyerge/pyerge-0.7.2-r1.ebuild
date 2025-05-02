# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Wrapper tool for emerge - it can mount RAM disk and compile packages inside it."
HOMEPAGE="https://github.com/emcek/pyerge https://pypi.org/project/pyerge/"
SRC_URI="https://github.com/emcek/pyerge/releases/download/v${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">dev-python/beautifulsoup4-4.5.0[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)"

src_prepare() {
    default
    eapply "${FILESDIR}/distutils-legacy-fix.patch"
}

distutils_enable_tests pytest

python_test() {
	py.test -v tests || die "tests fail with ${EPYTHON}"
}
