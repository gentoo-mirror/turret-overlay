# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A cli to browse and watch anime."
HOMEPAGE="https://github.com/pystardust/ani-cli/"
#SRC_URI="https://github.com/pystardust/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
RESTRICT="mirror"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/pystardust/ani-cli.git"
	inherit git-r3
else
	SRC_URI="https://github.com/pystardust/ani-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-alternatives/sh
	sys-apps/grep
	sys-apps/sed
	net-misc/curl
	media-video/mpv
	net-misc/aria2
	media-video/ffmpeg
	app-shells/fzf"

RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ani-cli
	doman ani-cli.1
}
