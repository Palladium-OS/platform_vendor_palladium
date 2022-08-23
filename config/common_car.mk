# Inherit common Palladium stuff
$(call inherit-product, vendor/palladium/config/common.mk)

# Inherit Palladium car device tree
$(call inherit-product, device/palladium/car/palladium_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
