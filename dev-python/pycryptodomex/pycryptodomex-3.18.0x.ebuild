# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_11 )
inherit distutils-r1

DESCRIPTION="Python package of low-level cryptographic primitives"
HOMEPAGE="https://github.com/Legrandin/pycryptodome"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/Legrandin/pycryptodome.git"
	EGIT_BRANCH="pycryptodomex"
	inherit git-r3
else
	SRC_URI="https://github.com/Legrandin/pycryptodome/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

DEPEND="${PYTHON_DEPS}
		dev-python/pip"

RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_unpack() {
	default
	mv "pycryptodome-${PV}" "${P}" || die
}
