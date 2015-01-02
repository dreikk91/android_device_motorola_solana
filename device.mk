# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This is the product configuration for a full solana
#

DEVICE_FOLDER := device/motorola/solana
TARGET_USES_CUSTOM_KEXECFILES := true

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

$(call inherit-product, device/motorola/omap4-common/common.mk)

# Hardware HALs
PRODUCT_PACKAGES += \
    power.solana \
    lights.solana \
    hwcomposer.solana \
    sensors.solana \

# Modem
PRODUCT_PACKAGES += \
    Stk \
    libreference-cdma-sms

# Rootfs
PRODUCT_PACKAGES += fstab.mapphone_umts

# Solana Rootfs files (overriding omap4-common)
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/init.mapphone_cdma.rc:/root/init.mapphone_cdma.rc \
    $(DEVICE_FOLDER)/init.mapphone_umts.rc:/root/init.mapphone_umts.rc \
    $(DEVICE_FOLDER)/init.target.rc:root/init.target.rc \

# Kexec files (overriding omap4-common)
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/kexec/devtree:system/etc/kexec/devtree \
    $(DEVICE_FOLDER)/kexec/arm_kexec.ko:system/etc/kexec/arm_kexec.ko \
    $(DEVICE_FOLDER)/kexec/kexec.ko:system/etc/kexec/kexec.ko \
    $(DEVICE_FOLDER)/kexec/uart.ko:system/etc/kexec/uart.ko \
    $(OUT)/ramdisk.img:system/etc/kexec/ramdisk.img \
    $(OUT)/kernel:system/etc/kexec/kernel

# HASH: Removed for now, causes a crash
#    $(DEVICE_FOLDER)/prebuilt/etc/firmware/ducati-m3.bin:system/etc/firmware/ducati-m3.bin \

# Prebuilts
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/cpcap-key.idc:system/usr/idc/cpcap-key.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/light-prox.idc:system/usr/idc/light-prox.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/mapphone-switch.idc:system/usr/idc/mapphone-switch.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/omap4-keypad.idc:system/usr/idc/omap4-keypad.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/keychars/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \
    $(DEVICE_FOLDER)/prebuilt/usr/keychars/light-prox.kcm:system/usr/keychars/light-prox.kcm \
    $(DEVICE_FOLDER)/prebuilt/usr/keychars/mapphone-switch.kcm:system/usr/keychars/mapphone-switch.kcm \
    $(DEVICE_FOLDER)/prebuilt/usr/keychars/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(DEVICE_FOLDER)/prebuilt/usr/keychars/qtouch-touchscreen.kcm:system/usr/keychars/qtouch-touchscreen.kcm \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/light-prox.kl:system/usr/keylayout/light-prox.kl \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/mapphone-switch.kl:system/usr/keylayout/mapphone-switch.kl \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/qtouch-touchscreen.kl:system/usr/keylayout/qtouch-touchscreen.kl
    $(DEVICE_FOLDER)/prebuilt/lib/hw/sensors.solana.so:system/lib/hw/sensors.solana.so

# Device files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/apns-conf.xml:system/etc/apns-conf.xml


$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/motorola/solana/solana-vendor.mk)
$(call inherit-product, vendor/motorola/omap4-common/omap4-common-imgtec-vendor-blobs.mk)
