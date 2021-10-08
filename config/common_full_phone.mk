# Inherit full common Lineage stuff
$(call inherit-product, vendor/palladium/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/palladium/overlay/dictionaries

$(call inherit-product, vendor/palladium/config/telephony.mk)
