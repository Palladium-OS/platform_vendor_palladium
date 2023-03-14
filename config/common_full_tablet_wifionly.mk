$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common Palladium stuff
$(call inherit-product, vendor/palladium/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Palladium LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/palladium/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/palladium/overlay/dictionaries
