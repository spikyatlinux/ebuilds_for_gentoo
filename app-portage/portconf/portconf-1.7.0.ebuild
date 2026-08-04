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

# Ein Bash-Skript muss nicht kompiliert werden, DEPEND bleibt also leer.
# Alles kommt in die RDEPEND (Runtime Dependencies).
RDEPEND="
    app-portage/eix
    app-portage/portage-utils
    app-shells/bash
    sys-apps/gawk
    sys-apps/gentoo-functions
    sys-apps/portage
    || ( app-text/agrep dev-libs/tre )
"

src_install() {
    default

    dobin portconf
    insinto /etc
    newins portconf.conf portconf.conf
}
