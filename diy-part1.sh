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

# Add OpenClash 源
echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default

# 插件
git clone https://github.com/gdy666/luci-app-lucky package/lucky
git clone https://github.com/sbwml/luci-app-openlist2 package/openlist2
