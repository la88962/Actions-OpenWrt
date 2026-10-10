#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.38.99/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 將 x86/x64 架構嘅預設內核版本強制改為 6.18
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=6.18/g' target/linux/x86/Makefile

# 同步修改測試版內核變數（以防萬一）
sed -i 's/KERNEL_TESTING_PATCHVER:=.*/KERNEL_TESTING_PATCHVER:=6.18/g' target/linux/x86/Makefile

# 徹底清除 mt76 無線驅動編譯設定，避免與 6.18 內核產生衝突
sed -i '/CONFIG_PACKAGE_kmod-mt76/d' .config
