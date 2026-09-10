# Stickbow status — 2026-09-10 morning stand-up (PT)

## Phase
**P0 closing → P1 duel core.** Thu slice done: toolchain + first `.gba` on box.

## Today's slice (done)
1. Installed `gcc-arm-none-eabi` + `binutils-arm-none-eabi` + `make` on the box
2. Fixed `gba_cart.ld` (MEMORY region spacing for binutils 2.44)
3. Linked `-lgcc` for `__aeabi_*` helpers; fixed `ai_seed` hex typo in `game.c`
4. **Built** `releases/stickbow.gba` (~101 KB, title STICKBOW / SB01 via `tools/gbafix.py`)
   - ELF: text 103836 / data 4 / bss 152

## Still local-only (not all on GitHub yet)
Full duel sources + Pico `sprites.c` (~400KB) + `assets/` + `tools/` live under `/workspace/stickbow/`. GitHub `main` still has stubs (`main.c`, `types.h`, `game.h`) plus docs/Makefile/ld.

## Deferred (pace)
- **Fri:** push remaining `src/*` / `tools/*` / assets (split `sprites.c` if needed); mGBA smoke (no mGBA on box yet); aim+charge bar polish per Fri phase map
- HP model (DESIGN 100 vs MVP 3)
- Hunter/soldier redraw — **locked closed** until ROM boots for Tyson and a day slice says so
- Pico: no art ask today

## Locks (unchanged)
- Controls: hold A charge bar → release fires; gravity arc; Up/Down angle
- Art: sticks are placeholders; final cast hunter vs soldier
