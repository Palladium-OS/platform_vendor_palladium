# Versioning System
PALLADIUM_MAJOR_VERSION = 11
PALLADIUM_RELEASE_VERSION = v1.5
PALLADIUM_BUILD_TYPE ?= UNOFFICIAL
PALLADIUM_BUILD_VARIANT ?= VANILLA
PALLADIUM_BUILD_MAINTAINER ?= UNOFFICIAL
PALLADIUM_BUILD_DONATE_URL ?= https://www.paypal.me/zodycc
PALLADIUM_BUILD_SUPPORT_URL ?= https://t.me/palladiumos_chat

ifeq ($(PALLADIUM_BUILD_VARIANT), GAPPS)
PALLADIUM_BUILD_VARIANT := GAPPS

PRODUCT_PACKAGES += \
    PalladiumThemesStub
endif

# Palladium Release
ifeq ($(PALLADIUM_BUILD_TYPE), OFFICIAL)

# Updater
# PRODUCT_PACKAGES += \
#     Updater

  OFFICIAL_DEVICES = $(shell cat vendor/palladium/palladium.devices)
  FOUND_DEVICE =  $(filter $(PALLADIUM_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(PALLADIUM_BUILD))
      PALLADIUM_BUILD_TYPE := OFFICIAL
    else
      PALLADIUM_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(PALLADIUM_BUILD)")
    endif
endif

# System version
TARGET_PRODUCT_SHORT := $(subst palladium_,,$(PALLADIUM_BUILD_TYPE))

PALLADIUM_DATE_YEAR := $(shell date -u +%Y)
PALLADIUM_DATE_MONTH := $(shell date -u +%m)
PALLADIUM_DATE_DAY := $(shell date -u +%d)
PALLADIUM_DATE_HOUR := $(shell date -u +%H)
PALLADIUM_DATE_MINUTE := $(shell date -u +%M)

PALLADIUM_BUILD_DATE := $(PALLADIUM_DATE_YEAR)$(PALLADIUM_DATE_MONTH)$(PALLADIUM_DATE_DAY)
PALLADIUM_BUILD_VERSION := $(PALLADIUM_RELEASE_VERSION)
PALLADIUM_BUILD_FINGERPRINT := Palladium-OS/$(PALLADIUM_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(PALLADIUM_BUILD_DATE)
PALLADIUM_VERSION := Palladium-$(PALLADIUM_BUILD_VERSION)-$(PALLADIUM_BUILD)-$(PALLADIUM_BUILD_DATE)-$(PALLADIUM_BUILD_TYPE)-$(PALLADIUM_BUILD_VARIANT)

PRODUCT_GENERIC_PROPERTIES += \
  ro.palladium.device=$(PALLADIUM_BUILD) \
  ro.palladium.version=$(PALLADIUM_VERSION) \
  ro.palladium.build.version=$(PALLADIUM_BUILD_VERSION) \
  ro.palladium.build.variant=$(PALLADIUM_BUILD_VARIANT) \
  ro.palladium.build.type=$(PALLADIUM_BUILD_TYPE) \
  ro.palladium.build.status=$(PALLADIUM_BUILD_TYPE) \
  ro.palladium.buildtype=$(PALLADIUM_BUILD_TYPE) \
  ro.palladium.build.date=$(PALLADIUM_BUILD_DATE) \
  ro.palladium.build.fingerprint=$(PALLADIUM_BUILD_FINGERPRINT) \
  ro.palladium.build.maintainer=$(PALLADIUM_BUILD_MAINTAINER) \
  ro.palladium.build.donate_url=$(PALLADIUM_BUILD_DONATE_URL) \
  ro.palladium.build.support_url=$(PALLADIUM_BUILD_SUPPORT_URL)
