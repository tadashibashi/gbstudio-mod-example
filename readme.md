# GB Studio MOD Music Example
A minimal example that compiles your .mod song file into a playable Game Boy ROM, using the same toolchain as GB Studio 3 (as far back as v2 beta5)

This incorporates [RichardULZ](https://github.com/RichardULZ)'s excellent modifications to GBT Player (gbt-rulz) found in this [GB Studio pull request](https://github.com/chrismaltby/gb-studio/pull/505). It adds pitch envelopes, enables wider noise timbres, adds subtle restructuring of pitch slides, and reduces pops.

## Requirements
- GCC compiler and Make
- GBDK2020 3.1

## Build
1. Clone this repository.

2. Download [GBDK2020 v3.1](https://github.com/gbdk-2020/gbdk-2020/releases/tag/v3.1) for your operating system.

3. Place the unzipped GBDK folder in the "lib" folder in the root directory of this repository. The folder should be titled "gbdk".

4. Call `make` in the root directory. This builds a Game Boy ROM that plays song.mod

To specify your own filepaths

| Argument | |
| -------- |-|
| TARGET   | Filepath of the target .gb rom to build |
| SONG     | Input .mod song filepath |

Example:

`make TARGET=/path/to/rom.gb SONG=/path/to/song.mod`

## Composer Workflow Suggestion

You might find it useful to use Emulicious' (Game Boy emulator) automatic ROM reload feature, so that your song gets reloaded everytime you rebuild the ROM. 

When playing the ROM, you can press start to stop the music.

## Final Remarks

The great original GBT Player by Antonio Niño Díaz can be found [here](https://github.com/AntonioND/gbt-player), although it is not fully compatible with GB Studio .mod files, due to RichardULZ's excellent additions.

For information on composing .mod files for this special version of GBT Player, please read the [GB Studio docs](https://www.gbstudio.dev/docs/assets/music/music-gbt), and watch this [tutorial](https://www.youtube.com/watch?v=Qz7z7yWn_5w) by AJ Booker.
Composer Scott Semanski makes amazing music with this driver, demonstrating its full feature set, which can be found on his [Twitter](https://twitter.com/ScottSemanski).
