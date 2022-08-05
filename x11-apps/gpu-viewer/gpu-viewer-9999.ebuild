# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )
inherit python-single-r1 meson gnome2-utils xdg

DESCRIPTION="A frontend to glxinfo and vulkaninfo."
HOMEPAGE="
https://github.com/arunsivaramanneo/GPU-Viewer
"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/arunsivaramanneo/${PN}.git"
else
	SRC_URI="https://github.com/arunsivaramanneo/${PN^}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/GPU-Viewer-${PV}"
fi

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
IUSE="nvidia vdpau clinfo"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	clinfo? ( dev-util/clinfo )
	vulkan? ( dev-util/vulkan-tools )
	x11-apps/mesa-progs
	vdpau? ( x11-misc/vdpauinfo )
"
RDEPEND="
	dev-python/click
	${DEPEND}
"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	eapply_user
	if [[ "${PV}" == *9999* ]]; then
		local commit version
		commit=$(git rev-parse HEAD)
		version=$(cat "${S}/VERSION")
		echo "${version%%.*}.${commit:1:9}" > "${S}/VERSION"
	fi
	sed -i \
		"s:^\(conf.set('PYTHON',\).*$:\1 '/usr/bin/${EPYTHON}'):" \
		"${S}/meson.build" || die

	# Hard skip network dependant test
	sed -i \
		"s:\(if appstream\_util\.found()\):\1 and false:" \
		"${S}/data/meson.build" || die
}

src_install() {
	meson_src_install
	python_optimize "${D}/usr/share/gpu-viewer/"
}

pkg_preinst() {
	gnome2_schemas_savelist
	xdg_pkg_preinst
}

pkg_postinst() {
	gnome2_gconf_install
	gnome2_schemas_update
	xdg_pkg_postinst
}

pkg_postrm() {
	gnome2_gconf_uninstall
	gnome2_schemas_update
	xdg_pkg_postrm
}
