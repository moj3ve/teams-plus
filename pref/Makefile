ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TSPPref
TSPPref_FILES = $(wildcard *.m)
TSPPref_INSTALL_PATH = /Library/PreferenceBundles
TSPPref_PRIVATE_FRAMEWORKS = Preferences
TSPPref_EXTRA_FRAMEWORKS = libhdev
TSPPref_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/TSPPref.plist$(ECHO_END)
