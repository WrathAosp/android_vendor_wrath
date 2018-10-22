# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
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
# WrathOS OTA update package

ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/wrath/build/core/colors.mk
endif

WRATH_TARGET_PACKAGE := $(PRODUCT_OUT)/$(WRATH_VERSION).zip
WRATH_TARGET_PACKAGE_FOLDER := $(PRODUCT_OUT)
WRATH_BUILD_TIME := 

.PHONY: bacon wrath
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(WRATH_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(WRATH_TARGET_PACKAGE) > $(WRATH_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/wrath/tools/generate_json_build_info.sh $(WRATH_TARGET_PACKAGE)
	@echo -e ${CL_RED}""
	@echo -e ${CL_RED}"========================================================================="${CL_RST}
	@echo -e ${CL_RED}""
	@echo -e ${CL_RED}" ██╗    ██╗██████╗  █████╗ ████████╗██╗  ██╗"
	@echo -e ${CL_RED}" ██║    ██║██╔══██╗██╔══██╗╚══██╔══╝██║  ██║"
	@echo -e ${CL_RED}" ██║ █╗ ██║██████╔╝███████║   ██║   ███████║"
	@echo -e ${CL_RED}" ██║███╗██║██╔══██╗██╔══██║   ██║   ██╔══██║"
	@echo -e ${CL_RED}" ╚███╔███╔╝██║  ██║██║  ██║   ██║   ██║  ██║"
	@echo -e ${CL_RED}"  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝"
	@echo -e ${CL_RED}""
	@echo -e ${CL_RED}"     Build Is Ready! Fell The Wrath..       "${CL_RED}
	@echo -e ${CL_RED}"=============================-Package Details-============================"${CL_RST}
	@echo -e ${CL_RED}"Folder Location: "${CL_RED} $(WRATH_TARGET_PACKAGE_FOLDER)${CL_RST}
	@echo -e ${CL_RED}"ZipName        : "${CL_RED} $(WRATH_VERSION).zip${CL_RST}
	@echo -e ${CL_RED}"MD5            : "${CL_RED}" $(shell cat $(WRATH_TARGET_PACKAGE).md5sum | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_RED}"Size           : "${CL_RED}" $(shell du -hs $(WRATH_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_RED}"Size(in bytes) : "${CL_RED}" $(shell wc -c $(WRATH_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_RED}"DateTime       : "${CL_RED} $(WRATH_BUILD_DATETIME)${CL_RST}
	@echo -e ${CL_RED}"Build Type     : "${CL_RED} $(WRATH_BUILD_TYPE)${CL_RST}
	@echo -e ${CL_RED}"==========================================================================="${CL_RST}
	@echo -e ""

wrath: bacon
