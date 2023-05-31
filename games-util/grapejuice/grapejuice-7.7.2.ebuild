# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg optfeature

DESCRIPTION="A Wine+Roblox management application"
HOMEPAGE="https://gitlab.com/brinkervii/grapejuice.git"
SRC_URI="https://gitlab.com/brinkervii/grapejuice/-/archive/v${PV}/grapejuice-v${PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="mirror"

DEPEND="sys-devel/gettext
		dev-vcs/git
		dev-python/pip
		x11-libs/cairo
		x11-libs/gtk+
		dev-libs/gobject-introspection
		dev-util/desktop-file-utils
		x11-misc/xdg-utils
		x11-misc/xdg-user-dirs
		dev-util/gtk-update-icon-cache
		x11-misc/shared-mime-info
		x11-apps/mesa-progs

		dev-python/psutil
		dev-python/pygobject
		dev-python/packaging
		dev-python/wheel
		dev-python/setuptools
		dev-python/requests
		dev-python/unidecode
		dev-python/click
		dev-python/pydantic"
RDEPEND="
		${DEPEND}
		virtual/wine"

src_unpack() {
	default
	mv "${WORKDIR}/grapejuice-v${PV}" "${S}" || die
}

src_compile() {
	cd "${S}"
	export PYTHONPATH="${S}/src"
	python3 -m grapejuice_packaging linux_package || die
}

src_install() {
	export PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
	tar -xf "${S}/dist/linux_package"/*.tar.gz -C "${D}" || die
	mv "${D}/usr/lib/python3/dist-packages" "${D}/usr/lib/python${PYTHON_VERSION}" || die
	rm -r "${D}/usr/lib/python3" || die
	default
}

pkg_postinst() {
	optfeature "Required for PRIME systems running XOrg, where XRandR based profiling is desired" x11-apps/xrandr
}
