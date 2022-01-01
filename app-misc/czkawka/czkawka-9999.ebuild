# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES=""

inherit cargo git-r3 optfeature

DESCRIPTION="Czkawka is a simple, fast and easy to use alternative to FSlint, written in Rust"
HOMEPAGE="https://github.com/qarmin/czkawka"

EGIT_REPO_URI="https://github.com/qarmin/${PN}.git"
KEYWORDS=""

LICENSE="MIT"
SLOT="0"
IUSE="+gtk"

DEPEND="
	gtk? ( x11-libs/gtk+:3 )
"

RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure $(usex gtk '--bin czkawka_gui' '--bin czkawka_cli')
}

src_compile() {
	cargo_src_compile
}

src_install() {
	if use gtk ; then
		cargo_src_install --path ./czkawka_gui
		insinto /usr/share/applications
		doins data/com.github.qarmin.${PN}.desktop
	else
		cargo_src_install --path ./czkawka_cli
	fi
}
