# Copyright 2022 Gentoo Authors

EAPI=8

inherit ecm cmake multilib

MY_PN="SierraBreezeEnhanced"

DESCRIPTION="A fork of BreezeEnhanced to make it (arguably) more minimalistic and informative"
HOMEPAGE="https://github.com/kupiqu/SierraBreezeEnhanced"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/kupiqu/${MY_PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/kupiqu/${MY_PN}/archive/refs/tags/V${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

LICENSE="GPL-3"
IUSE="debug"
SLOT="0"

DEPEND="kde-frameworks/plasma
	kde-plasma/kdecoration
	kde-frameworks/kiconthemes
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtdeclarative
	dev-qt/qtx11extras
"

RDEPEND="${DEPEND}"

src_configure() {
	CMAKE_MAKEFILE_GENERATOR=emake
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_BUILD_TYPE=Release+
		-DKDE_INSTALL_LIBDIR=$(get_libdir)
		-DBUILD_TESTING=OFF
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	)
	if use debug; then
		mycmakeargs+=(
		  -DCMAKE_BUILD_TYPE=Debug
		)
	fi
	cmake_src_configure
}

src_install() {
	cmake_src_install
	einfo ""
	einfo "Please note that after installing, you need to restart KWin by executing either"
	einfo "kwin_x11 --replace or kwin_wayland --replace in krunner"
	einfo "(depending on whether your session runs upon X11 or Wayland). Alternatively, restarting"
	einfo "the KDE session is obviously also an option. Then, Sierra Breeze Enhanced will appear in"
	einfo "System Settings → Application Style → Window Decorations"
	einfo ""
}
