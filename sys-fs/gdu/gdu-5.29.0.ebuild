# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# git clone https://github.com/dundee/gdu.git
# cd gdu
# go mod vendor
# tar -czvf gdu-5.29.0-vendor.tar.gz vendor
# upload gdu-5.29.0-vendor.tar.gz to webserver
#
EAPI=8

inherit go-module

DESCRIPTION="Disk usage analyzer with console interface written in Go"
HOMEPAGE="https://github.com/dundee/gdu"
SRC_URI="https://github.com/dundee/gdu/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://github.com/spikyatlinux/gdu-vendor-files/raw/main/gdu-5.29.0-vendor.tar.gz"

LICENSE="Apache-2.0 BSD MIT"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
    default
    tar -xvf "${DISTDIR}/gdu-5.29.0-vendor.tar.gz" -C "$S"
}

src_compile() {
	# Updating to use the correct Go module path for version 5+
	ego build -ldflags "-s -w -X 'github.com/dundee/gdu/v5/build.Version=${PV}'" -v -x -work -o "$PN" "./cmd/${PN}"
}

src_install() {
	einstalldocs
	dodoc -r README.md gdu.1.md
	dobin gdu
	doman gdu.1
}

src_test() {
	ego test ./...
}
