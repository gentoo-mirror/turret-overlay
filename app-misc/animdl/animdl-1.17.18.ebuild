# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_11 )
inherit distutils-r1

DESCRIPTION="A highly efficient, powerful and fast anime scraper."
HOMEPAGE="https://github.com/justfoolingaround/animdl"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/justfoolingaround/animdl.git"
	inherit git-r3
else
	SRC_URI="https://cdn.turret.cyou/3517d665858003645707f4fe0013e944a1b35501/animdl-1.7.18.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

DEPEND="${PYTHON_DEPS}
		dev-python/pip
		dev-python/poetry-core
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