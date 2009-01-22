# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit python

DESCRIPTION="A printer administration tool"
HOMEPAGE="http://cyberelk.net/tim/software/system-config-printer/"
SRC_URI="http://cyberelk.net/tim/data/system-config-printer/1.1/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

# TODO gnome deps...
RDEPEND="
	app-text/xmlto
	dev-lang/python
	dev-python/dbus-python
	dev-python/notify-python
	dev-python/pycups
	=dev-python/pygtk-2*
	dev-python/pyxml
	dev-python/rhpl
	net-print/cups
	net-print/foomatic-db
	net-print/foomatic-filters
	sys-apps/usermode
"
DEPEND="${RDEPEND}
	nls? (
		dev-util/intltool
		sys-devel/gettext
	)
"

APP_LINGUAS="ar bg bn bn_IN bs ca cs cy da de el en_GB es et fa fi fr gu he hi
hr hu hy id is it ja ka kn ko lo lv mk ml mr ms nb nl nn pa pl pt pt_BR ro ru
si sk sl sr sv ta te tr uk vi zh_CN"
for X in ${APP_LINGUAS}; do
	IUSE="${IUSE} linguas_${X}"
done

src_configure() {
	econf $(use_enable nls)
}

src_install() {
	dodoc AUTHORS ChangeLog README || die "dodoc failed"

	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_postrm() {
	python_mod_cleanup "/usr/share/${PN}"
}
