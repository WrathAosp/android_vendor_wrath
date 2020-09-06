# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)
include vendor/wrath/config/wrath_version.mk

-include vendor/wrath/config/wrath_permissions.mk
-include vendor/wrath/config/wrath_packages.mk

# Rage
include vendor/Rage/config.mk

# Bootanimation
include vendor/wrath/bootanimation/bootanimation.mk

# Include Wrath Theme
include vendor/wrath/themes/themes.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

# IME
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/wrath/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/wrath/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/wrath/prebuilt/common/bin/50-wrath.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-wrath.sh

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/wrath/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/wrath/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/wrath/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# Enforce privapp-permissions whitelist
#PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/wrath/config/permissions/wrath-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/wrath-hiddenapi-package-whitelist.xml

# Include AOSP audio files
include vendor/wrath/config/aosp_audio.mk

# Include Lineage audio files
include vendor/wrath/config/wrath_audio.mk

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/wrath/config/twrp.mk
endif

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    procmem

# PixelSetupWizard overlay
PRODUCT_PACKAGES += \
    PixelSetupWizardOverlay \
    PixelSetupWizardAodOverlay

# Faceunlock
$(call inherit-product-if-exists, external/motorola/faceunlock/config.mk)

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/wrath/config/partner_gms.mk

# Face Unlock
ifeq ($(WRATH_BUILD_TYPE), OFFICIAL)
TARGET_FACE_UNLOCK_SUPPORTED := false
ifneq ($(TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=$(TARGET_FACE_UNLOCK_SUPPORTED)
endif
