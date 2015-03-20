# Inherit AOSP device configuration for XT926
$(call inherit-product, device/motorola/xt926/full_xt926.mk)

# Inherit SuperSu files
$(call inherit-product, vendor/icarus/configs/root.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/qcom-common/overlay-cm

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

PRODUCT_NAME := icarus_xt926
TARGET_VENDOR_PRODUCT_NAME := XT926_verizon
TARGET_VENDOR_DEVICE_NAME := vanquish

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=motorola/XT926_verizon/vanquish:4.4.2/KDA20.62-15.1/15:user/release-keys \
    PRIVATE_BUILD_DESC="vanquish_vzw-user 4.4.2 KDA20.62-15.1 15 release-keys"
