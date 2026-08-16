# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="mdi/font Dist for Material Design Icons. "
HOMEPAGE="https://pictogrammers.com/library/mdi/?welcome"

SRC_URI="https://github.com/Templarian/MaterialDesign-Webfont/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ppc64 x86"

FONT_S=${S}/fonts
FONT_SUFFIX="ttf"

S=${WORKDIR}/MaterialDesign-Webfont-${PV}
