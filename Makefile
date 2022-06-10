TARGET := iphone:clang:latest:11.0
DEBUG = 0
ARCHS = arm64
INSTALL_TARGET_PROCESSES = OKEx


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OKXBypassJailbreak

OKXBypassJailbreak_FILES = Tweak.x
OKXBypassJailbreak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
