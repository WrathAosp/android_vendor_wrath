# Copyright (C) 2020 WrathOS
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

WRATH_MOD_VERSION = v1.2

ifndef WRATH_BUILD_TYPE
WRATH_BUILD_TYPE := UNOFFICIAL

endif

ifeq ($(WRATH_BUILD_TYPE), OFFICIAL)

PRODUCT_PACKAGES += \
    Updater

endif

TARGET_PRODUCT_SHORT := $(subst wrathos_,,$(WRATH_BUILD))

# Gapps
ifeq ($(BUILD_WITH_GAPPS),true)
IS_PHONE := true
include vendor/gapps/config.mk

WRATH_EDITION := GAPPS
WRATH_BUILD_DATETIME := $(shell date +%s)
WRATH_BUILD_DATE := $(shell date -d @$(WRATH_BUILD_DATETIME) +"%Y%m%d-%H%M%S")
WRATH_VERSION := WrathOS-$(WRATH_MOD_VERSION)-$(WRATH_EDITION)-$(WRATH_BUILD)-$(WRATH_BUILD_TYPE)-$(WRATH_BUILD_DATE)
WRATH_FINGERPRINT := WrathOS/$(WRATH_MOD_VERSION)/$(WRATH_EDITION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(WRATH_BUILD_DATE)
WRATH_DISPLAY_VERSION := $(WRATH_MOD_VERSION)|$(WRATH_EDITION)|$(WRATH_BUILD_TYPE)
else
WRATH_EDITION := NORMAL
WRATH_BUILD_DATETIME := $(shell date +%s)
WRATH_BUILD_DATE := $(shell date -d @$(WRATH_BUILD_DATETIME) +"%Y%m%d-%H%M%S")
WRATH_VERSION := WrathOS-$(WRATH_MOD_VERSION)-$(WRATH_BUILD)-$(WRATH_BUILD_TYPE)-$(WRATH_BUILD_DATE)
WRATH_FINGERPRINT := WrathOS/$(WRATH_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(WRATH_BUILD_DATE)
WRATH_DISPLAY_VERSION :=  $(WRATH_MOD_VERSION)|$(WRATH_EDITION)|$(WRATH_BUILD_TYPE)

endif

PRODUCT_GENERIC_PROPERTIES += \
  ro.wrath.version=$(WRATH_VERSION) \
  ro.wrath.releasetype=$(WRATH_BUILD_TYPE) \
  ro.modversion=$(WRATH_MOD_VERSION) \
  ro.wrath.build.date=$(WRATH_BUILD_DATETIME)\
  ro.wrath.display.version=$(WRATH_DISPLAY_VERSION) \
  ro.wrath.fingerprint=$(WRATH_FINGERPRINT)\
  ro.wrath.edition=$(WRATH_EDITION)\
  ro.wrath.maintainer=$(WRATH_MAINTAINER)
