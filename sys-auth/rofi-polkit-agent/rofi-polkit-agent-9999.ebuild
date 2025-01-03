# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Polkit agent, using rofi for UI"
HOMEPAGE="https://github.com/czaplicki/rofi-polkit-agent"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-vcs/git
        sys-auth/polkit
        app-misc/jq
        x11-misc/rofi
        app-admin/cmd-polkit"
RDEPEND="${DEPEND}"

# Using git-r3 eclass to handle git sources
EGIT_REPO_URI="https://github.com/czaplicki/rofi-polkit-agent.git"

src_compile() {
  # The source code is directly from git, no need to compile
  # In this case, just install the files as-is
  # if there are any build steps, add them here
  :
}

src_install() {
  # Install the rofi-polkit-agent binary with executable permissions
  newbin "${PN}" "${PN}"
# Install the license
  insinto /usr/share/licenses/${PN}
  doins LICENSE
}

# Version is handled by the git-r3 eclass
