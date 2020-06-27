ARCHS = arm64 arm64e
TARGET = iphone:clang:12.2:10.0
INSTALL_TARGET_PROCESSES = TeamSpaceApp Preferences

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = teamsplus
teamsplus_FILES = $(wildcard *.xm *.m)
teamsplus_EXTRA_FRAMEWORKS = libhdev
teamsplus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += pref

include $(THEOS_MAKE_PATH)/aggregate.mk
