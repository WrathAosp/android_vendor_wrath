# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Wrath Packages
PRODUCT_PACKAGES += \
    CustomDoze \
    StitchImage \
    ThemePicker

# Local Updater
ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PACKAGES += \
    LocalUpdater
endif

PRODUCT_PACKAGES += \
     WrathOverlayStub

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images

-include vendor/wrath/config/overlay.mk
