# Package

version       = "0.1.0"
author        = "Carson Evans"
description   = "Generate weather info for waybar using wttr.in"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
namedBin      = {"main": "wttrbar"}.toTable()

# Dependencies

requires "nim >= 2.0.8"
