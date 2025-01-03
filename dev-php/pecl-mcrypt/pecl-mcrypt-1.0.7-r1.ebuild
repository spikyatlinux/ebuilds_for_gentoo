# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PHP_EXT_NAME="mcrypt"
USE_PHP="php8-2 php8-3 php8-4"
MY_P="${PN/pecl-/}-${PV/_rc/RC}"
PHP_EXT_ECONF_ARGS=()
PHP_EXT_PECL_FILENAME="${MY_P}.tgz"
PHP_EXT_S="${WORKDIR}/${MY_P}"

inherit php-ext-pecl-r3

DESCRIPTION="Bindings for the libmcrypt library"
LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="dev-libs/libltdl
	dev-libs/libmcrypt"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
