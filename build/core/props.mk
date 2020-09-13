# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Branding Props
ADDITIONAL_BUILD_PROPERTIES += \
    ro.wrath.version=$(WRATH_DISPLAY_VERSION)-$(WRATH_BUILD_TYPE)-$(BUILD_DATE)-$(BUILD_TIME) \
    ro.wrath.version_code=$(WRATH_VERSION_CODE) \
    ro.wrath.device=$(TARGET_PRODUCT) \
    ro.wrath.display.version=$(WRATH_DISPLAY_VERSION) \
    ro.wrath.releasetype=$(WRATH_BUILDTYPE) \
    ro.wrath.build=$(WRATH_BUILD_NUMBER) \
    ro.wrath.fingerprint=$(ROM_FINGERPRINT)
