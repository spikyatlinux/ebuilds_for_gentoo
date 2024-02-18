# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1

DESCRIPTION="Open files by MIME-type or file name using regular expressions."
HOMEPAGE="https://xyne.dev/projects/mimeo/"
SRC_URI="https://xyne.dev/projects/mimeo/src/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/pyxdg"
DEPEND="${RDEPEND}"
