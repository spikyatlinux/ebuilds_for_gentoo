# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils gnome2-utils

DESCRIPTION="An IPTV streaming application"
HOMEPAGE="https://github.com/linuxmint/hypnotix"
SRC_URI="https://github.com/linuxmint/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
		gnome-base/dconf
		x11-themes/hicolor-icon-theme
		dev-python/imdbpy
		dev-python/unidecode
		dev-python/pycairo
		dev-python/requests
		dev-python/setproctitle
		media-video/mpv[libmpv]
		x11-libs/xapp
"
RDEPEND="${DEPEND}"

src_install(){
	dobin "${S}"/usr/bin/hypnotix
	insinto /usr/
	doins -r "${S}"/usr/lib
	chmod 755 "${D}"/usr/lib/hypnotix/*
	doins -r "${S}"/usr/share/
}

pkg_postinst(){
	xdg_icon_cache_update
	gnome2_schemas_update
}
