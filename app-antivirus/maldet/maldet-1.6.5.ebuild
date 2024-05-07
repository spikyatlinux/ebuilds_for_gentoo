# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-antivirus/clamav/clamav-0.97.4.ebuild,v 1.1 2012/03/16 21:25:46 radhermit Exp $

EAPI=4

DESCRIPTION="Linux Malware Detect (LMD) is a malware scanner for Linux released under the GNU GPLv2 license"
HOMEPAGE="http://www.rfxn.com/projects/linux-malware-detect/"
SRC_URI="http://www.rfxn.com/downloads/maldetect-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+inotify"
RDEPEND="inotify? ( sys-fs/inotify-tools )"

src_unpack() {
    unpack ${A}
    S="${WORKDIR}/maldetect-${PV}"
}

src_prepare() {
    sed -i -e	"s#inspath='/usr/local/maldetect'#inspath=/usr/libexec/maldet#" \
	-e	's#tmp_inspath=/usr/local/lmd_update#tmp_inspath=/tmp/maldet_update#' \
	-e	's#$inspath/maldet#/usr/sbin/maldet#g' \
	-e	"s#lmdup() {#lmdup() {\necho 'Use portage to update this!'\nexit 1#" \
		'files/maldet' || die

    sed -i -e 	's#ignore_paths=$inspath/ignore_paths#ignore_paths=/etc/maldet/ignore_paths#' \
	-e  's#inspath=/usr/local/maldetect#inspath=/usr/libexec/maldet#' \
	-e	's#conf.maldet#maldet.conf#g' \
	-e	's#confpath="$inspath"#confpath=/etc/maldet/#' \
	-e	's#ignore_sigs="$inspath/ignore_sigs"#ignore_sigs=/etc/maldet/ignore_sigs#' \
	-e	's#ignore_inotify="$inspath/ignore_inotify"#ignore_inotify=/etc/maldet/ignore_inotify#' \
	-e	's#ignore_file_ext="$inspath/ignore_file_ext"#ignore_file_ext=/etc/maldet/ignore_file_ext#' \
	-e	's#tmpdir="$inspath/tmp"#tmpdir=$varlibpath/tmp#' \
	-e	's#hex_fifo_path="$varlibpath/internals/hexfifo"#hex_fifo_path=$varlibpath/hexfifo#' \
	-e	's#inotify_log="$inspath/logs/inotify_log"#inotify_log=$logdir/inotify_log#' \
	-e	's#logdir="$inspath/logs"#logdir=/var/log/maldet#' \
	-e	's#varlibpath="$inspath"#varlibpath=/var/maldet#' \
		'files/internals/internals.conf' || die
    sed -i -e	's#BASERUN="/usr/local/maldetect/tmp"#BASERUN=/var/maldet/tmp#' \
		'files/internals/tlog' || die
    sed -i -e	's#/usr/local/maldetect/#/var/maldet/#g' \
		'files/internals/hexfifo.pl' || die
    sed -i -e	's#/usr/local/maldetect/#/var/maldet/#g' \
		'files/internals/hexstring.pl' || die
    sed -i -e "s#inspath='/usr/local/maldetect'#exepath=/usr/sbin#" \
	-e	's#intcnf="$inspath/internals/internals.conf"#intcnf=/usr/libexec/maldet/internals/internals.conf#' \
	-e	's#inspath#exepath#' \
	-e	's#\&& success || failure##g' \
		'files/service/maldet.sh' || die

		echo '/var/maldet' > files/ignore_paths

    true;
}

src_install() {
    insinto /etc/maldet || die
    newins files/conf.maldet maldet.conf || die
    doins files/ignore_file_ext || die
    doins files/ignore_inotify || die
    doins files/ignore_paths || die
    doins files/ignore_sigs || die
    insinto /usr/libexec/maldet/internals || die
    doins files/internals/* || die
	exeinto /usr/libexec/maldet/internals || die
	doexe files/internals/tlog

	keepdir /var/log/maldet || die
    dodir /var/maldet || die
    dodir /var/maldet/clean || die
    keepdir /var/maldet/quarantine || die
    keepdir /var/maldet/sess || die
    dodir /var/maldet/sigs || die
    keepdir /var/maldet/inotify || die
    insinto /var/maldet/sigs || die
    doins files/sigs/* || die
    keepdir /var/maldet/tmp || die
    insinto /var/maldet/clean || die
    doins files/clean/* || die

    dosbin files/maldet || die
	doman files/maldet.1 || die
    dodoc README || die
    dodoc CHANGELOG || die
	newinitd files/service/maldet.sh maldet || die
}
