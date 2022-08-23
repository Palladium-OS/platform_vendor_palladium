# Set Palladium specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Palladium stuff
$(call inherit-product, vendor/palladium/config/common_mini_phone.mk)
