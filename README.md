# Stickbow

Bowman-style **GBA** archery duel for Analogue Pocket (and any GBA emulator).
Stick-figure archers, dusk backdrop, turn-based aim → power → flight with gravity + wind.
Best of 3 rounds. Headshot = KO; body hits chip HP.

Art by Pico (idle / draw / release poses, arrows, dusk BG). Engine is bare-metal C (Mode 3), fixed-point physics — no Butano.

## Controls

| Input | Action |
|-------|--------|
| **D-Pad U/D** | Aim angle |
| **A** | Confirm aim → hold meter / release to shoot |
| **B** | Cancel power meter (back to aim) |
| **Start** | Start match / skip round banner / title |

Enemy AI takes a turn after each player shot (or miss).

## Build (DevKitPro / arm-none-eabi)

```bash
# DevKitPro (recommended): https://devkitpro.org/wiki/Getting_Started
# After install, ensure DEVKITPRO + DEVKITARM are set, then:
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
export PATH=$DEVKITARM/bin:$PATH

make clean && make
# → stickbow.gba and releases/stickbow.gba
```

Any `arm-none-eabi-gcc` targeting ARM7TDMI works with the bundled `gba_cart.ld` + `src/crt0.s`.
If `gbafix` is missing, `tools/gbafix.py` patches the ROM header.

### Toolchain note (CI / this scaffold box)

The scaffold machine did **not** have DevKitARM or `gcc-arm-none-eabi` in apt.
Sources are complete and Makefile-ready; build the `.gba` on a machine with DevKitPro, then drop it into `releases/`.

## Analogue Pocket (SD)

1. Build or obtain `stickbow.gba`.
2. Copy to the Pocket SD card, e.g. `/Assets/gba/common/Stickbow.gba`
   (openFPGA GBA core paths vary by core pack — `Assets/gba/` is typical).
3. Launch via the Pocket’s GBA core / Memories menu.

Emulators for desktop testing: mGBA, VBA-M, NanoBoyAdvance.

## Repo layout

```
src/           C sources + embedded RGB15 sprite arrays (from assets/)
assets/        Master PNGs + *.b64 sidecars (safe for text-only pushes)
tools/gbafix.py
gba_cart.ld
Makefile
DESIGN.md
releases/      Built ROM (when toolchain available)
```

Regenerate sprite C arrays after art changes:

```bash
python3 tools/png_to_sprites.py   # see tools/; or re-run the convert script used in scaffold
```

## License

Code: MIT (see below intent). Art: project assets for Stickbow.
