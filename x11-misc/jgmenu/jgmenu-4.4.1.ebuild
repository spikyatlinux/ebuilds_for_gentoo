# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

DESCRIPTION="Simple, independent and contemporary-looking X11 menu, designed for scripting, ricing and tweaking."
HOMEPAGE="https://github.com/jgmenu"
SRC_URI="https://github.com/jgmenu/jgmenu/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/cairo
	x11-libs/pango
	gnome-base/librsvg
	dev-libs/glib
	dev-libs/libxml2
"

src_install() {
	default
}
