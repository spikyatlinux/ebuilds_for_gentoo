# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="A cross-platform desktop utility for computing message digests or checksums"
HOMEPAGE="https://gtkhash.org/"
SRC_URI="https://github.com/tristanheaven/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="nettle +openssl mbedtls caja nautilus nemo thunar"

DEPEND="dev-libs/libgcrypt
	app-crypt/libb2
	x11-libs/gtk+:3
	sys-libs/zlib
	nettle? ( dev-libs/nettle )
	openssl? ( dev-libs/openssl )
	mbedtls? ( net-libs/mbedtls )
	caja? ( mate-base/caja )
	nautilus? ( gnome-base/nautilus )
	nemo? ( gnome-extra/nemo )
	thunar? ( xfce-base/thunar )"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

PATCHES=(
	"${FILESDIR}/fix-msgfmt-keyword-use-space.patch"
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable nettle)
		$(use_enable openssl libcrypto)
		$(use_enable mbedtls)
		$(use_enable caja)
		$(use_enable nautilus)
		$(use_enable nemo)
		$(use_enable thunar)
		--enable-linux-crypto # Probably should NOT assume we're running on Linux...
		--enable-glib-checksums # Indirect dependency of GTK3 so why not
	)
	econf "${myeconfargs[@]}"
}
