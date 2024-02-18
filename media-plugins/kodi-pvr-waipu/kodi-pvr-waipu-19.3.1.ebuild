# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake kodi-addon

DESCRIPTION="Waipu.tv PVR addon for Kodi"
HOMEPAGE="https://github.com/flubshi/pvr.waipu"
SRC_URI=""

case ${PV} in
9999)
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/flubshi/pvr.waipu.git"
	inherit git-r3
	DEPEND="~media-tv/kodi-9999"
	;;
*)
	KEYWORDS="~amd64"
	CODENAME="Matrix"
	SRC_URI="https://github.com/flubshi/pvr.waipu/archive/${PV}-${CODENAME}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/pvr.waipu-${PV}-${CODENAME}"
	DEPEND="=media-tv/kodi-19*"
	;;
esac

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND+="
	dev-libs/rapidjson
	dev-libs/tinyxml2
	virtual/opengl
	"

RDEPEND="
	${DEPEND}
	"
