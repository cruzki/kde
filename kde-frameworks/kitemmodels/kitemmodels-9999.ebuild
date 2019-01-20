# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing data models to help with tasks such as sorting and filtering"
LICENSE="LGPL-2+"
KEYWORDS=""
IUSE=""

BDEPEND="test? ( $(add_qt_dep qtwidgets) )"
