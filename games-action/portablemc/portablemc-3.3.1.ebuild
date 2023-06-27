# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_11 )
inherit distutils-r1

DESCRIPTION="An easy-to-use and extensible Python CLI Minecraft launcher with compatability!"
HOMEPAGE="https://github.com/mindstorm38/portablemc"
if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/mindstorm38/portablemc.git"
	inherit git-r3
else
	SRC_URI="https://github.com/mindstorm38/portablemc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

DEPEND="${PYTHON_DEPS}
		dev-python/pip
		dev-python/poetry-core"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_unpack() {
	default
	mv "${WORKDIR}/${P}/src/core/"* "${S}" || die
}
