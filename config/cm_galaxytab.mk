# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit AOSP device configuration for galaxytab
$(call inherit-product, device/samsung/galaxytab/full_galaxytab.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := GT-P1000
PRODUCT_DEVICE := galaxytab
PRODUCT_MODEL := GT-P1000
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES := \
BUILD_ID=ITL41D \
BUILD_DISPLAY_ID=ITL41D \
PRODUCT_NAME=${PRODUCT_MODEL} \
TARGET_DEVICE=APOLLO \
BUILD_FINGERPRINT=SAMSUNG/GALAXYTAB/GT-P1000/GT-P1000:4.0.1/GT-P1000/${UTC_DATE}:user/release-keys \
PRODUCT_BRAND=SAMSUNG \
PRIVATE_BUILD_DESC="galaxytab-user 4.0.1 GT-P1000 ${UTC_DATE} release-keys" \
BUILD_NUMBER=${DATE} \
BUILD_VERSION_TAGS=release-keys \
TARGET_BUILD_TYPE=user \
USER=diz

# Add the FM app
#PRODUCT_PACKAGES += FM

# Custom CM packages
PRODUCT_PACKAGES += \
    Trebuchet \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# init.d support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cm/prebuilt/common/bin/sysinit:system/bin/sysinit


# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-9-$(shell date +%m%d%Y)-NIGHTLY-GT-P1000
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-9.0.0-GT-P1000
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-9.0.0-GT-P1000-diz
    endif
endif

#
# Move dalvik cache to data partition where there is more room to solve startup problems
#
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dexopt-data-only=1

PRODUCT_COPY_FILES +=  \
    vendor/cm/prebuilt/common/bootanimation.zip:system/media/bootanimation.zip \
    vendor/samsung/galaxytab/proprietary/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    vendor/samsung/galaxytab/proprietary/egl/libEGL_POWERVR_SGX540_120.so :system/lib/egl/libEGL_POWERVR_SGX540_120.so \
    vendor/samsung/galaxytab/proprietary/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    vendor/samsung/galaxytab/proprietary/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    vendor/samsung/galaxytab/proprietary/egl/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \
    vendor/samsung/galaxytab/proprietary/other/libakm.so:system/lib/libakm.so \
    vendor/samsung/galaxytab/proprietary/egl/libpvr2d.so:system/lib/libpvr2d.so \
    vendor/samsung/galaxytab/proprietary/egl/libIMGegl.so:system/lib/libIMGegl.so \
    vendor/samsung/galaxytab/proprietary/egl/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
    vendor/samsung/galaxytab/proprietary/egl/libsrv_init.so:system/lib/libsrv_init.so \
    vendor/samsung/galaxytab/proprietary/egl/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \
    vendor/samsung/galaxytab/proprietary/egl/libsrv_init.so:system/lib/libsrv_init.so \
