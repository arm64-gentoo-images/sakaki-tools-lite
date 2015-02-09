# ebuild for genup-lite (a simple Gentoo update script)
# Copyright (c) 2015 sakaki <sakaki@deciban.com>
# License: GPL v2
# NO WARRANTY

EAPI=5

inherit eutils

DESCRIPTION="Update Portage tree, and all installed packages"
BASE_SERVER_URI="https://github.com/sakaki-"
HOMEPAGE="${BASE_SERVER_URI}/${PN}"
SRC_URI="${BASE_SERVER_URI}/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc"

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
	>=sys-libs/ncurses-5.9-r2
	>=app-portage/eix-0.29.3
	>=app-admin/perl-cleaner-2.7
	>=app-admin/python-updater-0.11
	>=app-portage/gentoolkit-0.3.0.8-r2
	>=app-shells/bash-4.2"

# ebuild function overrides
src_prepare() {
	epatch_user
}
src_install() {
	dosbin "${PN}"
	doman "${PN}.8"
	elog "Ensuring eix syncs overlays and updates the metadata cache, and that"
	elog "eix-update uses that cache, per:"
	elog "https://wiki.gentoo.org/wiki/Overlay#eix_integration"
	insinto "/etc"
	doins "${FILESDIR}/eix-sync.conf"
	insinto "/etc/eixrc"
	doins "${FILESDIR}/01-cache"
}
