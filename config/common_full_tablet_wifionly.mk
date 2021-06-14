# Inherit full common Palladium stuff
$(call inherit-product, vendor/palladium/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
