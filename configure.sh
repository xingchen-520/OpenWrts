#!/bin/bash
# Modify default system settings

# 修改默认IP为192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate 

# Hello World
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# passwall
echo "src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main" >> feeds.conf.default
echo "src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main" >> feeds.conf.default

# iStore
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# 1. 强制在编译时集成树莓派5所需的全部无线网卡固件，防止开机“待激活”
echo "CONFIG_PACKAGE_brcmfmac-firmware-43455-sdio=y" >> .config
echo "CONFIG_PACKAGE_brcmfmac-firmware-43456-pcie=y" >> .config

# 2. 强行开启 iptables 核心兼容层和 NAT 增强模块，打通 nodogsplash 的依赖冲突
echo "CONFIG_PACKAGE_kmod-ipt-nat=y" >> .config
echo "CONFIG_PACKAGE_kmod-ipt-nat-extra=y" >> .config
echo "CONFIG_PACKAGE_kmod-nft-compat=y" >> .config
