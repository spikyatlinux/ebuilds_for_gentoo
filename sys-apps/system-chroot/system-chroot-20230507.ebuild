# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7
KEYWORDS="amd64"
SLOT="0"

HOMEPAGE="https://github.com/bell07/bashscripts-system_chroot"
DESCRIPTION='Prepare a system root to be mounted in chroot. Do all submounts like sys or proc.'

COMMIT="9f4661c9c68e564c7af21328c8fbfdd9566c1aad"
SRC_URI="${HOMEPAGE}/archive/${COMMIT}.zip -> ${P}.zip"

RESTRICT="mirror"

S="${WORKDIR}/bashscripts-system_chroot-${COMMIT}"

src_install() {
	dobin "${S}"/chroot-mount.sh
	dobin "${S}"/chroot-umount.sh
	dodoc "${S}"/README.md
}
