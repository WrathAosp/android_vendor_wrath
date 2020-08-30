# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/wrath/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# Copy all Wrath-specific init rc files
$(foreach f,$(wildcard vendor/wrath/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/wrath/prebuilt/common/lib/content-types.properties:$(TARGET_COPY_OUT_SYSTEM)/lib/content-types.properties

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/wrath/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

PRODUCT_COPY_FILES += \
    vendor/wrath/config/permissions/privapp-permissions-wrath-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-wrath.xml \
    vendor/wrath/config/permissions/privapp-permissions-wrath-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-wrath-system.xml \
    vendor/wrath/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml \
    vendor/wrath/config/permissions/wrath-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/wrath-hiddenapi-package-whitelist.xml

# Live Display
PRODUCT_COPY_FILES += \
    vendor/wrath/config/permissions/privapp-permissions-livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-livedisplay.xml
