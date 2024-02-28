################################################################################
#
# mlibc
#
################################################################################

MLIBC_VERSION = 4.0.0
MLIBC_SOURCE = mlibc-$(MLIBC_VERSION).tar.gz
MLIBC_SITE = https://github.com/managarm/mlibc
MLIBC_LICENSE = MIT
MLIBC_LICENSE_FILES = COPYING
MLIBC_INSTALL_STAGING = YES

MLIBC_DEPENDENCIES = host-pkgconf host-gcc-initial linux-headers

MLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO

# ifeq ($(BR2_PACKAGE_BAZ),y)
# MLIBC_CONF_OPTS += -Dbaz=true
# MLIBC_DEPENDENCIES += baz
# else
# MLIBC_CONF_OPTS += -Dbaz=false
# endif

$(eval $(meson-package))
