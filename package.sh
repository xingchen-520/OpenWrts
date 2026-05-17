#!/bin/bash
git clone --depth 1 https://github.com/destan19/OpenAppFilter package/otherapp/OpenAppFilter
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/otherapp/luci-app-pushbot

# Mentohust
git clone --depth 1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk.git package/otherapp/mentohust

# UnblockNeteaseMusic
git clone --depth 1 -b master  https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/unblockneteasemusic

# OpenClash
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# ====== 引入第三方源并精准提取认证插件（防止同名重复冲突导致编译失败） ======
# 1. 先把全家桶克隆到一个临时目录
git clone --depth 1 https://github.com/kenzok8/openwrt-packages.git package/temp-packages

# 2. 创建我们自己的专属提取目录
mkdir -p package/my-auth-plugins

# 3. 只把我们急需的 nodogsplash 和 wifidog 插件移动过来
mv package/temp-packages/*nodogsplash* package/my-auth-plugins/
mv package/temp-packages/*wifidog* package/my-auth-plugins/

# 4. 彻底删掉临时目录，防止与其他自带插件发生同名冲突
rm -rf package/temp-packages
