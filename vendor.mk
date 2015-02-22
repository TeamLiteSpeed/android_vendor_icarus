PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

#boot animation
PRODUCT_BOOTANIMATION := vendor/icarus/prebuilt/common/bootanimation/bootanimation.zip

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/icarus/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/icarus/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/icarus/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \
    vendor/icarus/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/icarus/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/icarus/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/icarus/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# vendor-specific init file
PRODUCT_COPY_FILES += \
    vendor/icarus/prebuilt/common/etc/init.local.rc:root/init.vendor.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/icarus/prebuilt/common/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/icarus/prebuilt/common/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Required packages
PRODUCT_PACKAGES += \
    Development \
    LatinIME \
    Launcher3 \
    BluetoothExt

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    SoundRecorder

# Telephony packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    CellBroadcastReceiver \
    VoiceDialer

# World APN list
PRODUCT_COPY_FILES += \
    vendor/icarus/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/icarus/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/icarus/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/icarus/overlay/common \
    vendor/icarus/overlay/dictionaries

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=LRX21M BUILD_ID=LRX22G BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

# Versioning System
PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = Beta-1.0

ROM_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)-$(ICARUS_BUILD)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.icarus.version=$(ROM_VERSION) \
  ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(shell date -u +%Y%m%d) \
  ro.modversion=$(ROM_VERSION)

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

$(call inherit-product-if-exists, vendor/extra/product.mk)
