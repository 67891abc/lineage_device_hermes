#!/bin/bash
cd ~/work/aosp/system/core
git apply -v  ~/work/aosp/device/xiaomi/hermes/patches_decker/0001-Remove-CAP_SYS_NICE-from-surfaceflinger.patch
git apply -v  ~/work/aosp/device/xiaomi/hermes/patches_decker/0004-libnetutils-add-MTK-bits-ifc_ccmni_md_cfg.patch
git apply -v  ~/work/aosp/device/xiaomi/hermes/patches_decker/0012-PATCH-xen0n-some-MTK-services-e.g.-ril-daemon-mtk-re.patch
cd ../..
cd  ~/work/aosp/bionic
git apply -v  ~/work/aosp/device/xiaomi/hermes/patches_decker/0002-Apply-LIBC-version-to-__pthread_gettid.patch
cd  ~/work/aosp/frameworks/av
git apply -v ~/work/aosp/device/xiaomi/hermes/patches_decker/0006-fix-access-wvm-to-ReadOptions.patch
git apply -v ~/work/aosp/device/xiaomi/hermes/patches_decker/0007-Disable-usage-of-get_capture_position.patch
cd ../..
cd system/netd
git apply -v ~/work/aosp/device/xiaomi/hermes/patches_decker/0010-wifi-tethering-fix.patch
cd ../..
cd  ~/work/aosp/frameworks/base
cd ../..
