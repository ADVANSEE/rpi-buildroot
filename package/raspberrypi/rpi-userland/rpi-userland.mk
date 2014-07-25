#############################################################
#
# rpi-userland
#
#############################################################

RPI_USERLAND_VERSION = 5fd0157
RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
RPI_USERLAND_LICENSE = BSD-3c
RPI_USERLAND_LICENSE_FILES = LICENCE
RPI_USERLAND_INSTALL_STAGING = YES
RPI_USERLAND_INSTALL_TARGET = YES

RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg

define RPI_USERLAND_POST_TARGET_CLEANUP
    rm -Rf $(TARGET_DIR)/opt/vc/include
    rm -Rf $(TARGET_DIR)/opt/vc/share
    rm -Rf $(TARGET_DIR)/opt/vc/src
    rm -f  $(TARGET_DIR)/opt/vc/lib/*.a
    rm -f  $(TARGET_DIR)/etc/init.d/vcfiled
    rmdir -p $(TARGET_DIR_DIR)/etc/init.d || true
    grep -q "/opt/vc/lib" $(TARGET_DIR)/etc/ld.so.conf || \
        echo "/opt/vc/lib" >> $(TARGET_DIR)/etc/ld.so.conf
endef
RPI_USERLAND_POST_INSTALL_TARGET_HOOKS  += RPI_USERLAND_POST_TARGET_CLEANUP

$(eval $(cmake-package))
