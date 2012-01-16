# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="kde-runtime"
KMMODULE="kioslave"
inherit kde4-meta

KEYWORDS=""
DESCRIPTION="kioslave: the kde VFS framework - kioslave plugins present a filesystem-like view of arbitrary data"
IUSE="+bzip2 exif debug lzma openexr samba +sftp"

# tests hang, last checked for 4.2.96
RESTRICT="test"

DEPEND="
	!aqua? ( x11-libs/libXcursor )
	bzip2? ( app-arch/bzip2 )
	exif? ( media-gfx/exiv2 )
	lzma? ( app-arch/xz-utils )
	openexr? ( media-libs/openexr )
	samba? ( net-fs/samba[smbclient] )
	sftp? ( >=net-libs/libssh-0.4.0[sftp] )
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep kdelibs 'bzip2?,lzma?')
	$(add_kdebase_dep kdialog)
	virtual/ssh
	!aqua? ( !kernel_SunOS? ( virtual/eject ) )
"

KMEXTRA="
	kioexec
	kdeeject
"

src_configure() {
	mycmakeargs=(
		-DWITH_SLP=OFF
		$(cmake-utils_use_with bzip2 BZip2)
		$(cmake-utils_use_with exif Exiv2)
		$(cmake-utils_use_with lzma LibLZMA)
		$(cmake-utils_use_with openexr OpenEXR)
		$(cmake-utils_use_with samba)
		$(cmake-utils_use_with sftp LibSSH)
	)
	kde4-meta_src_configure
}
