SDKPATH := $(shell xcrun --sdk iphoneos --show-sdk-path)
CLANG := $(shell xcrun --sdk iphoneos -f clang)
LIPO := $(shell xcrun --sdk iphoneos -f lipo)

all: arm64 arm64e merge

clean:
	$(RM) -r arm64/ arm64e/ example.dylib

arm64:
	@mkdir -p arm64
	$(CLANG) -isysroot $(SDKPATH) -mios-version-min=8.0 -arch arm64 -shared example.c -o arm64/example.dylib

arm64e:
	@mkdir -p arm64e
	$(CLANG) -isysroot $(SDKPATH) -mios-version-min=8.0 -arch arm64e -shared example.c -o arm64e/example.dylib

merge:
	$(LIPO) arm64/example.dylib arm64e/example.dylib -create -output example.dylib
