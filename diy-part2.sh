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

# 1. 修改后台管理IP为 192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 2. 修改固件主机名为 NbWrt-RAX3000M
sed -i 's/OpenWrt/NbWrt-RAX3000M/g' package/base-files/files/bin/config_generate

# 3. 安装 openlist2 必需依赖 libfuse-dev（同时兼容OpenClash）
sudo apt-get update
sudo apt-get install -y libfuse-dev

# 4. 更新Go语言（OpenClash/openlist2 共同必需，保留）
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
