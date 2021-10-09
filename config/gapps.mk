# Gapps
ifeq ($(USE_GAPPS),true)
$(call inherit-product, vendor/gms/gms_full.mk)

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/palladium/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/palladium/overlay-gapps

$(call inherit-product, vendor/palladium/config/rro_overlays.mk)
endif
