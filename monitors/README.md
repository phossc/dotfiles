# Monitor resolution options on macOS

## Setup
More resolution variants can be created by adding a directory identified by
vendor id and a file identified by product id. The file contents describe the
resolutions.

Copy the directory and file for the monitor whose resolution options you want
to augment to `/Library/Displays/Contents/Resources/Overrides/`.

## Format description
To add a new resolution option, add a new entry in the `scale-resolutions`
array. The entry is a sequence of bytes that is base64 encoded. The bytes
describe the dimensions of the resolution and whether it is a HiDPI option.

An example entry in the array
```
AAAVgAAACQAAAAAB
```

Transforming it with `base64 --decode | xxd` gives
```
0000 1580 0000 0900 0000 0001
```

This reveals the resolution in hexadecimal as `1580x900` which in decimal
becomes `5504x2304`. The ending `0000 0001` makes it a HiDPI resolution option
and so the resulting "physical" size is `2752x1152` but rendered at twice the
size and downscaled to the monitor's resolution.

The flag that can be appended to the resolution is one of the following:
```
0000 0001
0000 0001 0020 0000
0000 0009 00A0 0000
```

I only got the first option to work on my M1 mac and am not sure about the
details of all the flags.

