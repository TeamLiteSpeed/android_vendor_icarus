# Inherit AOSP device configuration for XT925
$(call inherit-product, device/motorola/xt925/full_xt925.mk)

# Inherit SuperSu files
$(call inherit-product, vendor/icarus/configs/root.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/qcom-common/overlay-cm

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

PRODUCT_NAME := icarus_xt925
TARGET_VENDOR_PRODUCT_NAME := XT925
TARGET_VENDOR_DEVICE_NAME := vanquish_u

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=motorola/XT925_rtfr/vanquish_u:4.4.2/KDA20.127/59:user/release-keys \
    PRIVATE_BUILD_DESC="XT925_rtfr-user 4.4.2 KDA20.127 59 release-keys"
