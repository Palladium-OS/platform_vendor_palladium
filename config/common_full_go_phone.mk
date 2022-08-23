# Set Palladium specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Palladium stuff
$(call inherit-product, vendor/palladium/config/common_full_phone.mk)
