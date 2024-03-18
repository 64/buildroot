################################################################################
#
# Build the bcachefs root filesystem image
#
################################################################################

ROOTFS_BCACHEFS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_BCACHEFS_SIZE))
ifeq ($(BR2_TARGET_ROOTFS_BCACHEFS)-$(ROOTFS_BCACHEFS_SIZE),y-)
$(error BR2_TARGET_ROOTFS_BCACHEFS_SIZE cannot be empty)
endif

ROOTFS_BCACHEFS_SIZE_NODE = $(call qstrip,$(BR2_TARGET_ROOTFS_BCACHEFS_SIZE_NODE))
ROOTFS_BCACHEFS_SIZE_BLOCK = $(call qstrip,$(BR2_TARGET_ROOTFS_BCACHEFS_SIZE_BLOCK))
ROOTFS_BCACHEFS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_BCACHEFS_FEATURES))
# qstrip results in stripping consecutive spaces into a single one. So the
# variable is not qstrip-ed to preserve the integrity of the string value.
ROOTFS_BCACHEFS_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_BCACHEFS_LABEL))
#" Syntax highlighting... :-/ )

ROOTFS_BCACHEFS_OPTS = \
	-f \
	-r '$(TARGET_DIR)' \
	-L '$(ROOTFS_BCACHEFS_LABEL)' \
	--fs_size '$(ROOTFS_BCACHEFS_SIZE)' \
	$(if $(ROOTFS_BCACHEFS_SIZE_NODE),--btree_node_size '$(ROOTFS_BCACHEFS_SIZE_NODE)') \
	$(if $(ROOTFS_BCACHEFS_SIZE_BLOCK),--block_size '$(ROOTFS_BCACHEFS_SIZE_BLOCK)')

ROOTFS_BCACHEFS_DEPENDENCIES = host-bcachefs-tools

define ROOTFS_BCACHEFS_CMD
	$(RM) -f $@
	$(HOST_DIR)/usr/sbin/mkfs.bcachefs $(ROOTFS_BCACHEFS_OPTS) $@
endef

$(eval $(rootfs))
