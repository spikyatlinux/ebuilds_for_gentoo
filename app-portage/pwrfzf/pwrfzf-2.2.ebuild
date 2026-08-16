# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop shell-completion

DESCRIPTION="Interactive Gentoo TUI package browser using fzf"
HOMEPAGE="https://github.com/spikyatlinux/pwrfzf"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/spikyatlinux/pwrfzf.git"
else
	SRC_URI="https://github.com/spikyatlinux/pwrfzf/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	app-portage/eix
	app-portage/portage-utils
	app-shells/bash
	app-shells/fzf
	sys-apps/portage
"

src_prepare() {
	default
}

src_install() {
	dobin bin/pwrfzf

	# Correct zsh and bash completions via shell-completion.eclass
	newzshcomp completion/_pwrfzf _pwrfzf
	newbashcomp completion/pwrfzf_completion.sh pwrfzf

	make_desktop_entry "pwrfzf" "PWRFZF" "system-software-install" \
		"System;Settings;PackageManager;TerminalEmulator;" \
		"Terminal=true"

	einstalldocs
}
