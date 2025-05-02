# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 optfeature

DESCRIPTION="Generate and change color-schemes on the fly"
HOMEPAGE="https://github.com/dylanaraps/pywal"
SRC_URI="https://github.com/dylanaraps/pywal/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="binchecks strip !test? ( test )"

BDEPEND="${PYTHON_DEPS}"

RDEPEND="
	media-gfx/imagemagick
	${DISTUTILS_DEPS}
	${PYTHON_DEPS}
"

DOCS=(
	CHANGELOG.md
	README.md
)

PATCHES=( "${FILESDIR}/${P}-remove-setuptools-warnings.patch" )

distutils_enable_tests unittest

pkg_postinst() {
	optfeature_header "Install at least one of the following packages to support universal wallpaper setting:"

	optfeature "a fast, lightweight imageviewer using imlib2" media-gfx/feh

	optfeature "a collection of tools and libraries for many image formats" \
		media-gfx/imagemagick

	optfeature "allowing you to compose wallpapers ('root pixmaps') for X" \
		x11-misc/hsetroot

	optfeature "a background browser and setter for X" x11-misc/nitrogen
}
