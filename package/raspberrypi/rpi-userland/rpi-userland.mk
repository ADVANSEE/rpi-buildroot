#############################################################
#
# rpi-userland
#
#############################################################

RPI_USERLAND_VERSION = 6f530690af1b6bfc0eab463a804be7bf24fb8d4a
RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
RPI_USERLAND_LICENSE = BSD-3c
RPI_USERLAND_LICENSE_FILES = LICENCE
RPI_USERLAND_INSTALL_STAGING = YES
RPI_USERLAND_INSTALL_TARGET = YES
RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr

RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg

define RPI_USERLAND_POST_TARGET_CLEANUP
    rm -f $(TARGET_DIR)/usr/share/install/vcfiled
    rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/install
    rm -Rf $(TARGET_DIR)/usr/src
    rm -f  $(TARGET_DIR)/etc/init.d/vcfiled
    $(INSTALL) -m 0755 -D package/raspberrypi/rpi-userland/S97vcfiled \
		$(TARGET_DIR)/etc/init.d/S97vcfiled
endef
RPI_USERLAND_POST_INSTALL_TARGET_HOOKS  += RPI_USERLAND_POST_TARGET_CLEANUP

$(eval $(cmake-package))
