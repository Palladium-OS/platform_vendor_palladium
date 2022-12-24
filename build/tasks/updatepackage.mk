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
# -----------------------------------------------------------------
# Palladium OTA update package

PALLADIUM_TARGET_UPDATEPACKAGE := $(PRODUCT_OUT)/$(PALLADIUM_VERSION)-img.zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

ifeq ($(IS_CIENV),true)
    include $(TOP_DIR)vendor/palladium/build/core/colors.mk
endif

.PHONY: updatepackage
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(PALLADIUM_TARGET_UPDATEPACKAGE)
	$(hide) $(SHA256) $(PALLADIUM_TARGET_UPDATEPACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(PALLADIUM_TARGET_UPDATEPACKAGE).sha256sum
	$(hide) ./vendor/palladium/tools/generate_json_build_info.sh $(PALLADIUM_TARGET_UPDATEPACKAGE)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya} Palladium fastboot package! ${txtrst}";
	@echo -e ""
	@echo -e ${CL_RED}"*******************************************"     
	@echo -e ${CL_GRN} "                                      // "
	@echo -e ${CL_GRN} "                                      // "
	@echo -e ${CL_GRN} "                                      // "
	@echo -e ${CL_GRN} "     //////////           //////////  // "
	@echo -e ${CL_GRN} "  ////        ////     ***. ****** ***** "
	@echo -e ${CL_GRN} " ///             //   ** ,,,      ,,,*** "
	@echo -e ${CL_GRN} ".//              /// ***,,         ,, ** "
	@echo -e ${CL_GRN} ".** ,,        ,, **   **              ** "
	@echo -e ${CL_GRN} " *** ,,,,  ,,,, ***   ***            **  "
	@echo -e ${CL_GRN} " **.****    *****       *****    ****    "
	@echo -e ${CL_GRN} " **      **                   **         "
	@echo -e ${CL_GRN} " **                                      "
	@echo -e ${CL_GRN} " **                                      "
	@echo -e ${CL_RED}"*******************************************"    
	@echo -e ${CL_YLW}"Zip: "${CL_YLW} $(PALLADIUM_TARGET_UPDATEPACKAGE)${CL_YLW}
	@echo -e ${CL_YLW}"SHA256: "${CL_YLW}" `cat $(PALLADIUM_TARGET_UPDATEPACKAGE).sha256sum | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_YLW}"Size:"${CL_YLW}" `du -sh $(PALLADIUM_TARGET_UPDATEPACKAGE) | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_YLW}"id:"${CL_YLW}"`sha256sum $(PALLADIUM_TARGET_UPDATEPACKAGE) | cut -d ' ' -f 1`"${CL_YLW}
	@echo -e ${CL_GRN}"============================================"${CL_GRN}
	@echo -e ""

palladium: updatepackage
