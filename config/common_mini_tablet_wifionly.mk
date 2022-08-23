# Inherit mini common Palladium stuff
$(call inherit-product, vendor/palladium/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME
