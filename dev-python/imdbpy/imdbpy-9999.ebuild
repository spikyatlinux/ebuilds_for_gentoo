# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..10} )

inherit git-r3 distutils-r1 eutils

DESCRIPTION="Python package to access the IMDb's database"
HOMEPAGE="http://imdbpy.sourceforge.net/ https://pypi.python.org/pypi/IMDbPY"
EGIT_REPO_URI="https://github.com/alberanid/imdbpy.git"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

DISTUTILS_USE_SETUPTOOLS=rdepend
DISTUTILS_GLOBAL_OPTIONS=("*-jython --without-cutils")
PYTHON_MODULES="imdb"

src_prepare() {
	distutils-r1_src_prepare
}
