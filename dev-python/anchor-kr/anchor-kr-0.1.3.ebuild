# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 )
inherit distutils-r1

DESCRIPTION="Me, you and anchor make your scraper complete."
HOMEPAGE="https://github.com/justfoolingaround/anchor"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/justfoolingaround/anchor.git"
	inherit git-r3
else
	SRC_URI="https://cdn.turret.cyou/0f429b456bca42d4c74cb70e412abe03356b401e/anchor-0.1.3.tar.xz"
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
	mv "anchor-${PV}" "${P}" || die
}
