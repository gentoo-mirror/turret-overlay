# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 python3_12 )
inherit distutils-r1

DESCRIPTION="Python library for parsing anime video filenames"
HOMEPAGE="https://github.com/igorcmoura/anitopy"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/igorcmoura/anitopy.git"
	inherit git-r3
else
	SRC_URI="https://github.com/igorcmoura/anitopy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

DEPEND="${PYTHON_DEPS}
		dev-python/pip"

RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
