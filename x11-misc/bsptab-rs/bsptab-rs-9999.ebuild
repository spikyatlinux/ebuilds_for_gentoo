# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#CRATES=""

inherit cargo git-r3

DESCRIPTION="Mostly just a rust rewrite of https://github.com/albertored11/bsptab"
HOMEPAGE="https://virtio-fs.gitlab.io/"
EGIT_REPO_URI="https://github.com/yrkv/bsptab-rs.git"
EGIT_BRANCH="main"
KEYWORDS="~amd64"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	x11-misc/tabbed
"
RDEPEND="${DEPEND}"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
# QA_FLAGS_IGNORED="usr/bin/${PN}"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
