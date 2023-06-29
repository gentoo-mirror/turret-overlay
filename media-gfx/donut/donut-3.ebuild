# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig toolchain-funcs

DESCRIPTION="spinning X11 donut"
HOMEPAGE="https://git.turret.cyou/donut.git/about/"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.turret.cyou/donut.git"
else
	SRC_URI="https://git.turret.cyou/donut.git/snapshot/${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RESTRICT="mirror"
DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -i \
		-e "s/ -Os//" \
		-e "/^\(LDFLAGS\|CFLAGS\|CPPFLAGS\)/{s| = | += |g;s|-s ||g}" \
		config.mk || die

	restore_config config.h
}

src_compile() {
	emake CC=$(tc-getCC) donut
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	save_config config.h
}
