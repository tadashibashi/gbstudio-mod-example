# GB Studio GBT-Player MOD Example
Compiles your .mod song file into a playable Game Boy ROM, using the same toolchain as GB Studio 3.

This incorporates [RichardULZ](https://github.com/RichardULZ)'s excellent modifications to GBT-Player, found in this [GB Studio pull request](https://github.com/chrismaltby/gb-studio/pull/505). It adds pitch envelopes, enables wider noise timbres, adds subtle restructuring of pitch slides, and reduces pops.

For information on composing .mod files for this special version of GBT-Player, please read the [GB Studio docs](https://www.gbstudio.dev/docs/assets/music/music-gbt). The main repository can be found [here](https://github.com/chrismaltby/gb-studio).

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

## Workflow Suggestion

You might find it useful to use Emulicious' (Game Boy emulator) automatic ROM reload feature, so that your song gets reloaded everytime you rebuild the ROM. 

In the game ROM you can press start to stop the music.

## Final Remarks

The great original GBT-Player by Antonio Niño Díaz can be found [here](https://github.com/AntonioND/gbt-player), although it is not fully compatible with GB Studio .mod files, due to RichardULZ's excellent additions.
