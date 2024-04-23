#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#  src-git small8 https://github.com/kenzok8/small-package

# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small-package https://github.com/kenzok8/small-package' feeds.conf.default

# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# echo 'src-git small-package https://github.com/kenzok8/small-package' >> feeds.conf.default

# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default

# echo 'src-git kenzo https://github.com/kenzok8/small-package' >>feeds.conf.default

echo 'src-git kenzo https://github.com/kenzok8/small-package' >> feeds.conf.default

echo 'src-git small https://github.com/kenzok8/small' >> feeds.conf.default

# echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

# src-git node https://github.com/nxhack/openwrt-node-packages.git;openwrt-18.06

# echo 'src-git small https://github.com/nxhack/openwrt-node-packages.git;openwrt-18.06' >> feeds.conf.default

echo 'src-git upx https://github.com/kuoruan/openwrt-upx.git' >>feeds.conf.default

# src-git node https://github.com/nxhack/openwrt-node-packages.git;openwrt-18.06

#echo 'src-git node https://github.com/nxhack/openwrt-node-packages.git;openwrt-18.06' >> feeds.conf.default

echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default


echo 'src-git passwall https://github.com/fantastic-packages/packages.git' >>feeds.conf.default

# luci-theme-infinityfreedom
# echo 'src-git infinityfreedom https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git' >>feeds.conf.default


echo '添加lwz322的K3屏幕插件'
rm -rf package/lean/luci-app-k3screenctrl
git clone https://github.com/yangxu52/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
echo '=========Add k3screen plug OK!========='

echo '替换lwz322的K3屏幕驱动插件'
rm -rf package/lean/k3screenctrl
git clone https://github.com/yangxu52/k3screenctrl_build.git package/lean/k3screenctrl/
echo '=========Replace k3screen drive plug OK!========='

echo '移除bcm53xx中的其他机型'
# sed -i '421,453d' target/linux/bcm53xx/image/Makefile
# sed -i '140,412d' target/linux/bcm53xx/image/Makefile
# sed -i 's/$(USB3_PACKAGES) k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
# sed -n '140,146p' target/linux/bcm53xx/image/Makefile
echo '=========Remove other devices of bcm53xx OK!========='


# echo '修改upnp绑定文件位置'
sed -i 's/\/var\/upnp.leases/\/tmp\/upnp.leases/g' feeds/packages/net/miniupnpd/files/upnpd.config
cat feeds/packages/net/miniupnpd/files/upnpd.config |grep upnp_lease_file
echo '=========Alert upnp binding file directory!========='

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='Phicomm-K3'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Alert hostname OK!========='

# Add cpufreq
# rm -rf package/lean/luci-app-cpufreq
# svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
# ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq
