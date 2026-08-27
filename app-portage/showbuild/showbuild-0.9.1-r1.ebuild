# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Script to follow log of running portage builds"
HOMEPAGE="https://github.com/junghans/cj-overlay"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~x64-macos"

RDEPEND="
	app-shells/bash
	sys-apps/coreutils
	sys-apps/portage
"

S="${FILESDIR}"

src_install () {
	newbin "${P}" "${PN}"
}
