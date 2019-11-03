# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
inherit kde5 python-any-r1

DESCRIPTION="Official GTK+ port of Plasma's Breeze widget style"
HOMEPAGE="https://cgit.kde.org/breeze-gtk.git"
LICENSE="LGPL-2.1+"
KEYWORDS=""
IUSE=""

BDEPEND="${PYTHON_DEPS}
	$(add_plasma_dep breeze)
	$(python_gen_any_dep 'dev-python/pycairo[${PYTHON_USEDEP}]')
	dev-lang/sassc
"

python_check_deps() {
	has_version "dev-python/pycairo[${PYTHON_USEDEP}]"
}

pkg_setup() {
	python-any-r1_pkg_setup
	kde5_pkg_setup
}

src_prepare() {
	kde5_src_prepare
	if has_version "<dev-util/cmake-3.16_rc1"; then
		eapply "${FILESDIR}"/${PN}-5.16.5-cmake-pre-3.16.patch
	fi
}

src_configure() {
	local mycmakeargs=(
		-DPython3_EXECUTABLE="${PYTHON}"
	)
	if has_version "<dev-util/cmake-3.16_rc1"; then
		mycmakeargs=( -DPYTHON_EXECUTABLE="${PYTHON}" )
	fi
	kde5_src_configure
}