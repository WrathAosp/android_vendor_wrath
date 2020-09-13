#
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
#

# Branding stuffs
WRATH_VERSION_MAJOR := 2
WRATH_VERSION_MINOR := 0

BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)

WRATH_VERSION_CODE := Aurora

WRATH_BUILD_NUMBER := LPBN.Q0202.$(shell date -u +%d).$(shell date -u +%m)001

ifndef WRATH_BUILD_TYPE
  WRATH_BUILD_TYPE := Unofficial
endif

WRATH_VERSION := $(TARGET_PRODUCT)-$(WRATH_VERSION_MAJOR).$(WRATH_VERSION_MINOR)-$(BUILD_DATE)-$(BUILD_TIME)-$(WRATH_BUILD_TYPE)
WRATH_DISPLAY_VERSION := $(WRATH_VERSION_MAJOR).$(WRATH_VERSION_MINOR)
ROM_FINGERPRINT := Wrath/$(PLATFORM_VERSION)/$(WRATH_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)

# Declare it's a Wrath build
WRATH_BUILD := true
