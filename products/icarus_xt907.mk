# Inherit AOSP device configuration for XT907
$(call inherit-product, device/motorola/xt907/full_xt907.mk)

# Inherit SuperSu files
$(call inherit-product, vendor/icarus/configs/root.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/qcom-common/overlay-cm

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

PRODUCT_NAME := icarus_xt907
TARGET_VENDOR_PRODUCT_NAME := XT907_verizon
TARGET_VENDOR_DEVICE_NAME := scorpion_mini

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=motorola/XT907_verizon/scorpion_mini:4.4.2/KDA20.62-15.1/15:user/release-keys \
    PRIVATE_BUILD_DESC="smq_vzw-user 4.4.2 KDA20.62-15.1 15 release-keys"
