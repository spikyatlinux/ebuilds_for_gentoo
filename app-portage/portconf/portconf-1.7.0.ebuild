# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="/etc/portage cleaner"
HOMEPAGE="https://github.com/spikyatlinux/portconf"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/spikyatlinux/portconf.git"
	# Optional: If you ever need to pin the live ebuild to a specific commit, uncomment the following line:
	# EGIT_COMMIT="8e9e96330833d973316236ed6a6439162ae5cfa9"
	#
	# Note for users: You can override the commit without editing this ebuild by setting
	# EGIT_OVERRIDE_COMMIT_PORTCONF="<commit-hash>" in your make.conf or environment/shell.
else
	SRC_URI="https://github.com/spikyatlinux/portconf/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	app-portage/eix
	app-portage/portage-utils
	app-shells/bash
	sys-apps/gawk
	sys-apps/gentoo-functions
	sys-apps/portage
	|| ( app-text/agrep dev-libs/tre )
"

src_prepare() {
	default

	# Nur ausführen, wenn es sich um das Live-Ebuild (9999) handelt
	if [[ ${PV} == *9999 ]]; then
		# Ersetzt PORTCONF_COMMIT="" durch PORTCONF_COMMIT="<aktueller_hash>"
		sed -i "s/^PORTCONF_COMMIT=\"\"/PORTCONF_COMMIT=\"${EGIT_VERSION}\"/" portconf || die
	fi
}

src_install() {
	dobin portconf
	insinto /etc
	newins portconf.conf portconf.conf
}
