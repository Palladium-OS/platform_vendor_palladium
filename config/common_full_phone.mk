# Inherit full common Palladium stuff
$(call inherit-product, vendor/palladium/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Palladium LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/palladium/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/palladium/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/palladium/config/telephony.mk)
