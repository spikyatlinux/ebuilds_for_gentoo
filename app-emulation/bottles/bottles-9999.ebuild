# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit python-single-r1 meson gnome2-utils xdg

DESCRIPTION="Easily manage WINE prefixes in a new way"
HOMEPAGE="
	https://usebottles.com/
	https://github.com/bottlesdevs/Bottles
"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bottlesdevs/${PN^}.git"
else
	SRC_URI="https://github.com/bottlesdevs/${PN^}/archive/${PV}-treviso-4.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN^}-${PV}-treviso-4"
fi

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	>=x11-libs/gtk+-3.24.10[introspection]
	dev-libs/appstream-glib[introspection]
	dev-python/markdown
	$(python_gen_cond_dep '
		dev-python/pygobject:3[${PYTHON_USEDEP},cairo]
	')
"
RDEPEND="
	${DEPEND}
	app-arch/patool
	gui-libs/libhandy:1[introspection]
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
		echo "${version%%.*}.${commit:0:7}" > "${S}/VERSION"
	fi
	sed -i \
		"s:^\(conf.set('PYTHON',\).*$:\1 '/usr/bin/${EPYTHON}'):" \
		"${S}/src/meson.build" || die

	# Hard skip network dependant test
	sed -i \
		"s:\(if appstream\_util\.found()\):\1 and false:" \
		"${S}/data/meson.build" || die
}

src_install() {
	meson_src_install
	python_optimize "${D}/usr/share/bottles/"
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
