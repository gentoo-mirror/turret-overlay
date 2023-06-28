# Copyright 2022-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Render markdown on the CLI, with pizzazz!"
HOMEPAGE="https://github.com/charmbracelet/glow"
SRC_URI="
	https://github.com/charmbracelet/glow/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://cdn.turret.cyou/1120b9f49860e9a61ae35291b3c3e909c39b3583/glow-1.5.1-deps.tar.xz
"

LICENSE="Apache-2.0 BSD-2 BSD MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_install() {
	einstalldocs
	dobin glow
}
