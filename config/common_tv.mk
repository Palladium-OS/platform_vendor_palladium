# Inherit common Palladium stuff
$(call inherit-product, vendor/palladium/config/common.mk)

# Inherit Palladium atv device tree
$(call inherit-product, device/palladium/atv/palladium_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Palladium packages
PRODUCT_PACKAGES += \
    LineageCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/palladium/overlay/tv
