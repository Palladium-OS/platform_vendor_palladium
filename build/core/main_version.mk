# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# PalladiumOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.palladium.display.version=$(PALLADIUM_DISPLAY_VERSION) \
    ro.palladium.build.version=$(PALLADIUM_BUILD_VERSION) \
    ro.palladium.num.version=$(PALLADIUM_NUM_VER) \
    ro.palladium.build.date=$(BUILD_DATE) \
    ro.palladium.buildtype=$(PALLADIUM_BUILD_TYPE) \
    ro.palladium.build.status=$(PALLADIUM_BUILD_TYPE) \
    ro.palladium.fingerprint=$(ROM_FINGERPRINT) \
    ro.palladium.version=$(PALLADIUM_VERSION) \
    ro.modversion=$(PALLADIUM_VERSION)
