# Inherit AOSP device configuration for VS980
$(call inherit-product, device/lge/vs980/vs980.mk)

# Inherit SuperSu files
$(call inherit-product, vendor/icarus/configs/root.mk)

# Setup device specific product configuration
PRODUCT_DEVICE := vs980
PRODUCT_NAME := icarus_vs980
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-VS980
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=lge/g2_vzw/g2:4.4.2/KOT49I.VS98024A/VS98024A.1394607468:user/release-keys \
    PRIVATE_BUILD_DESC="g2_vzw-user 4.4.2 KOT49I.VS98024A VS98024A.1394607468 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon
