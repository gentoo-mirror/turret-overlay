# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vim-plugin

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ledger/vim-ledger"
else
	SRC_URI="https://github.com/ledger/vim-ledger/archive/refs/tags/v$PV.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RESTRICT="mirror"
DESCRIPTION="vim plugin: app-office/ledger file format syntax"
HOMEPAGE="https://github.com/ledger/vim-ledger"
LICENSE="GPL-2"

VIM_PLUGIN_HELPFILES="ledger-syntax"
VIM_PLUGIN_MESSAGES="filetype"
