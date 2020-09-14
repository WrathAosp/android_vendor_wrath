include vendor/wrath/build/core/vendor/*.mk

ifneq ($(TARGET_DOES_NOT_USE_GAPPS), true)
$(call inherit-product-if-exists, vendor/google/gapps/gapps-vendor.mk)
endif

ifeq ($(PRODUCT_USES_QCOM_HARDWARE), true)
include vendor/wrath/build/core/ProductConfigQcom.mk
endif

$(call inherit-product, vendor/qcom/opensource/power/power-vendor-board.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifeq ($(TARGET_USES_BLUR), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    ro.build.selinux=1

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/wrath/build/tools/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/wrath/build/tools/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/wrath/build/tools/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# copy privapp permissions
PRODUCT_COPY_FILES += \
    vendor/wrath/prebuilt/common/etc/permissions/privapp-permissions-wrath-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-wrath-product.xml \
    vendor/wrath/prebuilt/common/etc/permissions/privapp-permissions-wrath-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-wrath-system.xml

# system mount
PRODUCT_COPY_FILES += \
    vendor/wrath/build/tools/system-mount.sh:install/bin/system-mount.sh

# backuptool
PRODUCT_COPY_FILES += \
    vendor/wrath/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/wrath/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/wrath/build/tools/50-wrath.sh:system/addon.d/50-wrath.sh

# Wrath-specific init file
PRODUCT_COPY_FILES += \
    vendor/wrath/prebuilt/common/etc/init.wrath.rc:system/etc/init/init.wrath.rc

# Build ID
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID="$(BUILD_ID)-$(TARGET_BUILD_VARIANT)"

# Packages
include vendor/wrath/config/packages.mk

# Branding
include vendor/wrath/config/branding.mk

# Sounds
include vendor/wrath/config/pixel2-audio_prebuilt.mk

# Bootanimation
include vendor/wrath/config/bootanimation.mk

# Fonts
include vendor/wrath/config/fonts.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/wrath/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/wrath/overlay/common
