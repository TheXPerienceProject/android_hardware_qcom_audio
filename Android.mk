ifeq ($(call my-dir),$(call project-path-for,qcom-audio))

MY_LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_USES_LEGACY_ALSA_AUDIO),true)
include $(MY_LOCAL_PATH)/legacy/Android.mk
else
ifneq ($(filter mpq8092,$(TARGET_BOARD_PLATFORM)),)
include $(MY_LOCAL_PATH)/hal_mpq/Android.mk
endif
include $(MY_LOCAL_PATH)/hal/audio_extn/Android.mk

endif
