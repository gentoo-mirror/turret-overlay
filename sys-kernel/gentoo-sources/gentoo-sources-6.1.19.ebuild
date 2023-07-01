# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="23"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches/"
IUSE="experimental"

DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${ARCH_URI}
https://mirrors.edge.kernel.org/pub/linux/kernel/v6.x/linux-6.1.tar.xz
https://cdn.turret.cyou/939d01d7079d09be4f9f3a3b7a7fc9d1f33720dd/genpatches-6.1-23.base.tar.xz
https://cdn.turret.cyou/2626e8ab81d51427682d1160c6f21bc4de624033/genpatches-6.1-23.extras.tar.xz
https://cdn.turret.cyou/7d1645900832cf293b0c6c23a4473db78e436d00/genpatches-6.1-23.experimental.tar.xz"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
