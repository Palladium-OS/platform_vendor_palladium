# Inherit common Palladium stuff
$(call inherit-product, vendor/palladium/config/common_mobile.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
