# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ecm kde.org qmake-utils

MY_PV="20.03.23"
MY_NAME="MystiQ"

DESCRIPTION="Qt5/C++ FFmpeg Media Converter"
HOMEPAGE="https://github.com/swl-x/MystiQ"
SRC_URI="https://github.com/swl-x/${MY_NAME}/archive/v${MY_PV}.tar.gz -> ${PN}-${PV}.tar.gz"
IUSE="sox"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
		dev-qt/qtcore
        dev-qt/qtgui
        dev-qt/qtnetwork
        dev-qt/qtopengl
        dev-qt/qtmultimedia
        dev-qt/qtwidgets
        dev-qt/qtquickcontrols2
        media-video/ffmpeg
        "
RDEPEND="${DEPEND}
sox? (
media-sound/sox
x11-libs/libnotify
)
"

S="${WORKDIR}/${MY_NAME}-${MY_PV}"

src_configure() {
        eqmake5
}

src_install() {
        emake INSTALL_ROOT="${ED}" install
}
