# Inherit from jfltevzw device
$(call inherit-product, device/samsung/jfltevzw/full_jfltevzw.mk)

# Inherit SuperSu files
$(call inherit-product, vendor/icarus/configs/root.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := icarus_jfltevzw
PRODUCT_DEVICE := jfltevzw
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SCH-I545


PRODUCT_BUILD_PROP_OVERRIDES += \
  BUILD_FINGERPRINT="Verizon/jfltevzw/jfltevzw:4.4.2/KOT49H/I545VRUFNK1:user/release-keys" \
  PRIVATE_BUILD_DESC="jfltevzw-user 4.4.2 KOT49H I545VRUFNK1 release-keys"
  
PRODUCT_GMS_CLIENTID_BASE := android-verizon
