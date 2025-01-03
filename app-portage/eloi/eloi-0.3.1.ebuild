# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/mbaraa/${PN}.git"

inherit git-r3 go-module

DESCRIPTION="Gentoo's Eix with extra steps"
HOMEPAGE="https://wiki.gentoo.org/wiki/Eloi"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=dev-lang/go-1.22.6"

RDEPEND=">=app-portage/gentoolkit-0.6.7"

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	go build -ldflags "-s -w" || die "build failed"
}

src_install() {
	dobin eloi
	dodoc README.md
}
