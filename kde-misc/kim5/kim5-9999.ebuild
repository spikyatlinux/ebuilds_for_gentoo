# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Kde Image Menu"
HOMEPAGE="https://github.com/caco3/kim5"
EGIT_REPO_URI="https://github.com/caco3/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="kde-apps/dolphin:5
	kde-apps/kdialog:5
	media-video/ffmpeg
	media-gfx/imagemagick
	x11-apps/xwd"
BDEPEND="sys-devel/gettext"

src_prepare() {
	default
	local file

	for file in kim/src/bin/kim_*; do
		sed -i "s:\`kf5-config --prefix\`:${EPREFIX}/usr:g" "${file}"
	done

	pushd kim/src/po/ > /dev/null || die
	for file in *.po; do
		msgfmt "${file}" -o "${file/po/mo}" || die
	done
	popd > /dev/null || die
}

src_install() {
	insinto /usr/share/kservices5/ServiceMenus
	doins kim/src/*.desktop
	dobin kim/src/bin/*

	insinto /usr/share/kim
	doins kim/src/kim_translation
	newins kim/COPYING kim_license.txt
	newins kim/ABOUT kim_about.txt

	insinto /usr/share/kim/slideshow
	doins kim/src/slideshow/*

	insinto /usr/share/kim/gallery
	doins kim/src/gallery/*

	pushd kim/src/po/ > /dev/null || die
	for file in *.mo; do
		insinto /usr/share/locale/"${file/.mo/}"/LC_MESSAGES
		newins "${file}" kim5.mo
	done
	popd > /dev/null || die
}
