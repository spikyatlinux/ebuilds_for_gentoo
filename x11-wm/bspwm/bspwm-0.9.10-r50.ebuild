# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs git-r3

DESCRIPTION="Tiling window manager based on binary space partitioning"
HOMEPAGE="https://github.com/baskerville/bspwm/"
#SRC_URI="https://github.com/baskerville/bspwm/archive/${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/baskerville/bspwm.git"
EGIT_COMMIT="af3bd8b4351f4478fe0fe3cfd6c09e44cb108b4b"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 ~riscv ~x86"
IUSE="examples"

DEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util
	x11-libs/xcb-util-wm
"
RDEPEND="${DEPEND}
	x11-misc/sxhkd
"

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" DOCPREFIX="${EPREFIX}/usr/share/doc/${PF}" install

	exeinto /etc/X11/Sessions
	newexe "${FILESDIR}"/${PN}-session ${PN}

	insinto /usr/share/xsessions
	doins contrib/freedesktop/bspwm.desktop

	insinto /etc/xdg/sxhkd
	doins examples/sxhkdrc

	if use examples ; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
