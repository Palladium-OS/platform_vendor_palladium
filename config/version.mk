# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2020 Fluid
# Copyright (C) 2021 Palladium-OS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
PALLADIUM_CODENAME := Halo
PALLADIUM_NUM_VER := 2.1

TARGET_PRODUCT_SHORT := $(subst palladium_,,$(PALLADIUM_BUILD_TYPE))

PALLADIUM_BUILD_TYPE ?= UNOFFICIAL


ifeq ($(PALLADIUM_BUILD_VARIANT), GAPPS)
    USE_GAPPS := true
endif

# Palladium Release
ifeq ($(PALLADIUM_BUILD_TYPE), OFFICIAL)

# Updater
  PRODUCT_PACKAGES += \
       Updater

  OFFICIAL_DEVICES = $(shell cat vendor/palladium/palladium.devices)
  FOUND_DEVICE =  $(filter $(PALLADIUM_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(PALLADIUM_BUILD))
      PALLADIUM_BUILD_TYPE := OFFICIAL
    else
      PALLADIUM_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(PALLADIUM_BUILD)")
    endif
endif

# Sign builds if building an official build
ifeq ($(filter-out OFFICIAL,$(PALLADIUM_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
PALLADIUM_BUILD_VERSION := $(PALLADIUM_NUM_VER)-$(PALLADIUM_CODENAME)
PALLADIUM_VERSION := PalladiumOS-$(PALLADIUM_BUILD_VERSION)-$(PALLADIUM_BUILD)-$(PALLADIUM_BUILD_TYPE)-VANILLA-$(BUILD_TIME)-$(BUILD_DATE)
ifeq ($(USE_GAPPS), true)
PALLADIUM_VERSION := PalladiumOS-$(PALLADIUM_BUILD_VERSION)-$(PALLADIUM_BUILD)-$(PALLADIUM_BUILD_TYPE)-GAPPS-$(BUILD_TIME)-$(BUILD_DATE)
endif
ROM_FINGERPRINT := Palladium/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
PALLADIUM_DISPLAY_VERSION := $(PALLADIUM_VERSION)
RELEASE_TYPE := $(PALLADIUM_BUILD_TYPE)
