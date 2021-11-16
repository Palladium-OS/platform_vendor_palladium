# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

ifeq ($(USE_GAPPS),true)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.palladium.ziptype=GAPPS
else
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.palladium.ziptype=VANILLA
endif

# PalladiumOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.palladium.display.version=$(PALLADIUM_DISPLAY_VERSION) \
    ro.palladium.build.version=$(PALLADIUM_BUILD_VERSION) \
    ro.palladium.build.datetime=$(PALLADIUM_DATETIME) \
    ro.palladium.build.date=$(BUILD_DATE) \
    ro.palladium.buildtype=$(PALLADIUM_BUILD_TYPE) \
    ro.palladium.fingerprint=$(ROM_FINGERPRINT) \
    ro.palladium.version=$(PALLADIUM_VERSION) \
    ro.palladium.base.version=$(PALLADIUM_NUM_VER) \
    ro.modversion=$(PALLADIUM_VERSION)
