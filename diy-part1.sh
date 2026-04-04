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

# 插件：lucky（保留你原有的，无修改）
git clone https://github.com/gdy666/luci-app-lucky package/lucky

# 插件：openlist2（修正路径+完整仓库，解决编译失败）
# 原错误：git clone https://github.com/sbwml/luci-app-openlist2 package/openlist2
# 修正后：克隆完整仓库，自动生成正确目录结构
git clone https://github.com/sbwml/luci-app-openlist2.git package/luci-app-openlist2
# 自动修正目录结构，确保 openlist2 主程序被编译系统识别
mv package/luci-app-openlist2/openlist2 package/openlist2
rm -rf package/luci-app-openlist2/.git
