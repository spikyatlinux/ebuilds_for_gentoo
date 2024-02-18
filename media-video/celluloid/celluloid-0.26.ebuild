# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils meson xdg

DESCRIPTION="A simple GTK+ frontend for mpv"
HOMEPAGE="https://celluloid-player.github.io/"

SRC_URI="https://github.com/celluloid-player/${PN}/releases/download/v${PV}/${P}.tar.xz"
S="${WORKDIR}/${P}"

KEYWORDS="~amd64"
LICENSE="GPL-3+"
SLOT="0"

DEPEND="
	>=dev-libs/glib-2.66
	>=gui-libs/gtk-4.6.2
	>=gui-libs/libadwaita-1.2.0
	media-libs/libepoxy
	>=media-video/mpv-0.32:=[libmpv]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/appstream-glib
	virtual/pkgconfig
"
src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
