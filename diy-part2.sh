#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate


#  src-git small8 https://github.com/kenzok8/small-package

# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small-package https://github.com/kenzok8/small-package' feeds.conf.default

# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
# delete all others bcm53xx spec


# sed -i '$a src-git upx https://github.com/kuoruan/openwrt-upx.git' feeds.conf.default

#git clone https://github.com/kuoruan/openwrt-upx.git package/openwrt-upx

sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
