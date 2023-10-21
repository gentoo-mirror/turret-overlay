# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_11 python3_12 )
inherit distutils-r1

DESCRIPTION="A highly efficient, powerful and fast anime scraper."
HOMEPAGE="https://github.com/justfoolingaround/animdl"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/justfoolingaround/animdl.git"
	inherit git-r3
else
	SRC_URI="https://cdn.turret.cyou/c43bbc52525b8fc8edd86d38fd4ce54f4c3dc792/${P}.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

DEPEND="${PYTHON_DEPS}
		dev-python/pip
		dev-python/poetry-core
		dev-python/anchor-kr
		dev-python/anitopy
		dev-python/click
		dev-python/cssselect
		dev-python/httpx
		dev-python/tqdm
		dev-python/pycryptodomex
		dev-python/regex
		dev-python/yarl
		dev-python/pyyaml
		dev-python/packaging
		dev-python/pkginfo
		dev-python/rich"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_unpack() {
	default
	mv "${PN}" "${P}" || die
}
