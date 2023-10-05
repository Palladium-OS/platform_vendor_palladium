# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2020 Fluid
# Copyright (C) 2023 Palladium-OS
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
PALLADIUM_NUM_VER := 4.0

TARGET_PRODUCT_SHORT := $(subst palladium_,,$(PALLADIUM_BUILD_TYPE))

PALLADIUM_BUILD_TYPE ?= UNOFFICIAL
PALLADIUM_BUILD_VARIANT ?= VANILLA

# Check if the build is actually OFFICIAL
ifeq ($(filter-out OFFICIAL,$(PALLADIUM_BUILD_TYPE)),)
  OFFICIAL_DEVICES = $(shell cat vendor/palladium/palladium.devices)
  FOUND_DEVICE =  $(filter $(PALLADIUM_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(PALLADIUM_BUILD))
      PALLADIUM_BUILD_TYPE := OFFICIAL
    else
      PALLADIUM_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(PALLADIUM_BUILD)")
    endif
endif

# Only include Updater for official  build
ifeq ($(filter-out OFFICIAL,$(PALLADIUM_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

# Sign builds if building an OFFICIAL build
ifeq ($(filter-out OFFICIAL,$(PALLADIUM_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set Gapps Flag
ifeq ($(USE_GAPPS), true)
    PALLADIUM_BUILD_VARIANT = GAPPS
endif

# Set all versions
PALLADIUM_DATETIME := $(shell date +%s)
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
PALLADIUM_BUILD_VERSION := $(PALLADIUM_NUM_VER)
PALLADIUM_VERSION := PalladiumOS-$(PALLADIUM_BUILD_VERSION)-$(PALLADIUM_BUILD)-$(PALLADIUM_BUILD_TYPE)-$(PALLADIUM_BUILD_VARIANT)-$(BUILD_TIME)-$(BUILD_DATE)
ROM_FINGERPRINT := Palladium/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
PALLADIUM_DISPLAY_VERSION := $(PALLADIUM_VERSION)
RELEASE_TYPE := $(PALLADIUM_BUILD_TYPE)
