# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2017-2018 AOSiP
# Copyright (C) 2019 AOSDP
# Copyright (C) 2020-2021 Fluid
# Copyright (C) 2021 Palladium
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

# -----------------------------------------------------------------
# Palladium OTA update package

PALLADIUM_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PALLADIUM_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum


CL_RED="\033[31m"
CL_GRN="\033[32m"
CL_YLW="\033[33m"
CL_BLU="\033[34m"
CL_MAG="\033[35m"
CL_CYN="\033[36m"
CL_RST="\033[0m"

.PHONY: palladium otapackage bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
palladium: otapackage
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(PALLADIUM_TARGET_PACKAGE)
	$(hide) $(SHA256) $(PALLADIUM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(PALLADIUM_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/palladium/tools/generate_json_build_info.sh $(PALLADIUM_TARGET_PACKAGE)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}Palladium ! ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}"=========================Package Complete========================="${CL_GRN}
	@echo -e ${CL_CYN}"                                                                  "${CL_CYN}
	@echo -e ${CL_YLW}"            Build Completed Successfully // #StarkCelerity        "${CL_YLW}
	@echo -e ${CL_CYN}"                                                                  "${CL_CYN}
	@echo -e ${CL_RED}"******************************************************************"${CL_RED}
	@echo -e ${CL_CYN}"                                                                  "${CL_CYN}
	@echo -e ${CL_CYN}"     ____        ____          ___                    ____ _____  "${CL_CYN}
	@echo -e ${CL_CYN}"    / __ \______/ / __________/ (___  __________     / __ / ___/  "${CL_CYN}
	@echo -e ${CL_CYN}"   / /_/ / __  / / / __  / __  / / / / / __  __ \   / / / \__ \   "${CL_CYN}
	@echo -e ${CL_CYN}"  / ____/ /_/ / / / /_/ / /_/ / / /_/ / / / / / /  / /_/ ___/ /   "${CL_CYN}
	@echo -e ${CL_CYN}" / _/   \____/_/_/\____/\____/_/\____/_/ /_/ /_/   \____/____/    "${CL_CYN}
	@echo -e ${CL_CYN}"                                                                  "${CL_CYN}
	@echo -e ${CL_YLW}"                     By:Team Palladium                     	     "${CL_YLW}
	@echo -e ${CL_CYN}"                                                                  "${CL_CYN}
	@echo -e ${CL_RED}"******************************************************************"                                                           
	@echo -e ${CL_YLW}"Zip: "${CL_YLW} $(PALLADIUM_TARGET_PACKAGE)${CL_YLW}
	@echo -e ${CL_YLW}"SHA256: "${CL_YLW}" `cat $(PALLADIUM_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_YLW}"Size:"${CL_YLW}" `du -sh $(PALLADIUM_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_YLW}"id:"${CL_YLW}"`sha256sum $(PALLADIUM_TARGET_PACKAGE) | cut -d ' ' -f 1`"${CL_YLW}
	@echo -e ${CL_GRN}"==================================================================="${CL_GRN}

bacon: palladium
