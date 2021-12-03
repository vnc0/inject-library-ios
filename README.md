# inject-library-ios
Example showing how to perform dynamic library injection on iOS with [frida-python](https://github.com/frida/frida-python).

> Based on https://github.com/frida/frida-python/blob/master/examples/inject_library/.

## Get started
1. Build the dynamic library: `make`
2. Open the Twitter app on the iOS device.
3. Observe the debugging logs of your device: `idevicesyslog -q`
4. Inject the dynamic library: `python inject_blob.py Twitter example.dylib`
