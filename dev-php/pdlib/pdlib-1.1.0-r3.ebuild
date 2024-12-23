# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PHP_EXT_NAME="pdlib"
USE_PHP="php8-2 php8-3 php8-4"

inherit php-ext-source-r3 autotools

DESCRIPTION="PHP bindings for dlib"
HOMEPAGE="https://github.com/goodspb/${PN}"
SRC_URI="https://github.com/goodspb/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
sci-libs/dlib[X]
media-libs/giflib
"

DEPEND="${RDEPEND}
        dev-build/automake:1.16
        dev-build/autoconf:2.1
        dev-build/libtool:2"

RESTRICT="test"

PHP_EXT_ECONF_ARGS=()

src_prepare() {
    # Apply the patch to enable gif support
    # eapply "${FILESDIR}/enable-gif-support.patch"
    eapply "${FILESDIR}/update_extension_to_1.1.0.patch"

    php-ext-source-r3_src_prepare

    # Initialize PHP slot environments (if needed)
    local slot
    for slot in $(php_get_slots); do
        php_init_slot_env "${slot}"
    done
}

src_configure() {
    local PHP_EXT_ECONF_ARGS=(
        --with-pdlib LDFLAGS="-lgif" LIBS="-lgif -ldl"
    )
    php-ext-source-r3_src_configure
}

src_compile() {
    local slot
    for slot in $(php_get_slots); do
        php_init_slot_env "${slot}"
        emake || die "emake failed for slot ${slot}"
    done
}

src_install() {
    local slot
    for slot in $(php_get_slots); do
        php_init_slot_env "${slot}"
        insinto "${EXT_DIR}"
        doins ".libs/${PHP_EXT_NAME}.so" || die "Failed to install extension for slot ${slot}"

        # Set executable bit on installed shared library
        fperms +x "${EXT_DIR}/${PHP_EXT_NAME}.so" || die "Failed to set executable bit for slot ${slot}"
    done
    php-ext-source-r3_createinifiles
}

src_test() {
    for slot in $(php_get_slots); do
        php_init_slot_env "${slot}"
        phpunit || die "Tests failed for slot ${slot}"
    done
}
