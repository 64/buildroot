################################################################################
#
# bcachefs-tools
#
################################################################################

BCACHEFS_TOOLS_VERSION = 1.6.4
BCACHEFS_TOOLS_SOURCE = bcachefs-tools-vendored-$(BCACHEFS_TOOLS_VERSION).tar.zst
BCACHEFS_TOOLS_SITE = https://evilpiepirate.org/bcachefs-tools
BCACHEFS_TOOLS_LICENSE = GPL-2.0
BCACHEFS_TOOLS_LICENSE_FILES = COPYING
BCACHEFS_TOOLS_INSTALL_STAGING = YES
HOST_BCACHEFS_TOOLS_DEPENDENCIES = host-patchelf

define HOST_BCACHEFS_TOOLS_INSTALL_CMDS
	$(MAKE) -C $(@D) install DESTDIR="$(HOST_DIR)" PREFIX=/usr
	$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib $(HOST_DIR)/usr/sbin/bcachefs
endef

$(eval $(host-generic-package))
