import sys
import frida


def on_uninjected(id):
    print("on_uninjected id=%u" % id)

(target, library_path) = sys.argv[1:]

device = frida.get_usb_device()
device.on("uninjected", on_uninjected)
with open(library_path, "rb") as library_file:
    library_blob = library_file.read()
id = device.inject_library_blob(target, library_blob, "example_main", "World")
print("Injected, id=%u -- \nHit Ctrl+D to exit!" % id)
sys.stdin.read()