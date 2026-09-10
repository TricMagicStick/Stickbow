# Stickbow status — 2026-09-09 evening (PT)

## P0 tonight — documented + partial push ✅
On **GitHub `main`**: `README.md`, `DESIGN.md`, `STATUS.md`, `ROADMAP.md`, `Makefile`, `gba_cart.ld`, `.gitignore`, `releases/`, `src/types.h`, `src/main.c`, `src/game.h`.

On **scaffold box** (`/workspace/stickbow/`) — complete local tree, not fully pushed yet:
- Full duel logic: `game.c`, `physics.*`, `fighter.*`, `ai.*`, `gfx.*`, `input.*`, `fixed.*`, `crt0.s`
- Pico art wired: `src/sprites.c` (~400KB RGB15) + `src/sprites.h` + blitters
- Master art: `assets/*.png` + `assets/*.b64` sidecars
- Tools: `tools/gbafix.py`, `tools/png_to_sprites.py`

## Implemented locally (ready to push P1)
- Mode 3 bare-metal C; aim angle → power meter → flight (gravity + wind)
- Hit zones head/body; 3 HP; best-of-3; enemy AI turn
- Pico poses idle/draw/release + dusk BG + arrows

## Blocked
- No DevKitARM / `gcc-arm-none-eabi` on box → **no `.gba` ROM tonight**
- MCP push of large `sprites.c` / remaining sources deferred (paced week)

## Note — design vs code HP
`DESIGN.md` targets 100 HP / 30–45 dmg. Local MVP uses **3 HP**, headshot KO, body −1 (simpler GBA feel). Align in P1 stand-up.

## P1 — tomorrow stand-up
1. Push remaining `src/*`, `tools/*`, `assets/*.b64` via GitHub MCP
2. Push `src/sprites.c` (or split BG into own TU if size-limited)
3. DevKitPro build → `releases/stickbow.gba`
4. mGBA smoke test; tune physics/hitboxes to 32×48 sprites
5. Decide HP model (DESIGN 100 vs MVP 3)
