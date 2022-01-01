# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
inherit eutils unpacker

DESCRIPTION="Android platform-tools same as android-tools, but without sdk from google"
HOMEPAGE="https://developer.android.com/studio/releases/platform-tools.html"
SRC_URI="https://dl.google.com/android/repository/platform-tools-latest-linux.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64"
S="${WORKDIR}"
DEPEND="app-arch/unzip
        dev-util/patchelf
        !dev-util/android-tools"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
QA_PREBUILT="/opt/${P}"

src_install() {
	einfo "Patching elf binary"
	cd "${S}/platform-tools" || die
	local x
	for x in `find . -name fastboot` ; do
		[[ -f ${x} && $(od -t x1 -N 4 "${x}") == *"7f 45 4c 46"* ]] || continue
		patchelf --set-rpath '$ORIGIN' "${x}" || \
			die "patchelf failed on ${x}"
	done
	
    mkdir ${D}/opt
    unzip ${DISTDIR}/${P}.zip -d ${D}/opt/
    
    newenvd "${FILESDIR}"/72platformtools-env.d 72platformtools
	
}

pkg_postinst() {
	elog
	elog "Enjoy this quick and dirty ebuild to use latest adb and fastboot"
	elog
	elog "adb and fastboot are latest versions from google to check run"
	elog
	elog "/opt/platform-tools/fastboot --version"
	elog "/opt/platform-tools/adb --version"
}
