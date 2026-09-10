# Stickbow status — 2026-09-09 (PT)

## P0 (tonight) — DONE / pushed or pushing
- Bare-metal GBA C project: Mode 3, fixed-point physics, aim/power/flight, AI turn, HP, best-of-3
- Pico art converted to RGB15 C arrays (`src/sprites.c`) + master PNGs as `assets/*.b64`
- Makefile + `gba_cart.ld` + `crt0.s` + `tools/gbafix.py` + `tools/png_to_sprites.py`
- README build + Analogue Pocket SD notes; DESIGN.md

## Blocked
- No DevKitARM / `gcc-arm-none-eabi` on scaffold box (not in Debian apt). **No `.gba` built tonight.**
- `src/sprites.c` is ~400KB embedded pixel data — push separately if MCP size-limits bite.

## P1 (tomorrow stand-up)
1. Confirm repo tree on GitHub; finish pushing `src/sprites.c` + remaining 3x preview `.b64` if missing
2. Build on a DevKitPro machine → `releases/stickbow.gba`
3. mGBA smoke: title → aim → shoot → hit/miss → AI → round
4. Tune gravity/power/wind; verify hitboxes vs 32×48 Pico sprites
5. Optional: try pushing raw PNGs (keep `.b64` as source of truth if binary corrupts)
