# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils cmake-utils git

DESCRIPTION="A library providing Qt implementation of DBusMenu specification"
HOMEPAGE="http://people.canonical.com/~agateau/dbusmenu/"
EGIT_REPO_URI="git://gitorious.org/dbusmenu/dbusmenu-qt.git"

LICENSE="LGPL-2"
KEYWORDS=""
SLOT="0"
IUSE="debug"

DEPEND="
	x11-libs/qt-core:4
	x11-libs/qt-gui:4[dbus]
	x11-libs/qt-test:4
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.3.2-qtincludedir.patch
	git_src_prepare
}
