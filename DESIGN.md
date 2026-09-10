# Stickbow — Design

Bowman-style GBA archery duel for Analogue Pocket.

## Pillars
1. **One verb** — charge and release. Everything else supports that.
2. **Readable arc** — gravity (+ wind) so shots curve; you learn from the last flight.
3. **Stick DNA, pretty world** — thin stick archers; dusk landscape does the beauty.
4. **Pocket-native** — `.gba` on SD, 240×160, D-pad + A/B.

## Shooting (LOCKED 2026-09-09)
**Hold A to charge, release A to fire.**

- While A is held, a **power / energy bar** fills (0→max). Visual fill on the aim strip.
- Releasing A launches the arrow with power = how full the bar was.
- Tapping A = weak shot; holding longer = stronger / farther shot.
- Arrow **must fly in an arc** (gravity on vertical velocity). Not a straight laser.
- Up/Down nudges launch **angle** while charging; wind still bends the arc.

Do **not** use separate Left/Right-as-power + tap-A-to-shoot as the primary model.

## Screen layout (240×160)

```
┌──────────────────────────────────────┐  y=0
│ HP■■■■  P1     WIND →→     P2  ■■HP │  HUD strip (~16px)
│ R:1/3              DIST 480          │
├──────────────────────────────────────┤
│                                      │
│         [parallax dusk BG]           │  Playfield
│   stick ───────── arc ──────── stick │  Ground ~y=120–140
│                                      │
├──────────────────────────────────────┤
│ ANGLE 42°   POWER ####--  (hold A)   │  Aim strip — bar fills while A held
└──────────────────────────────────────┘  y=160
```

- **Camera:** locked near shooter while charging; follows arrow in flight; Hold R scouts enemy.
- **Ground:** flat strip from Pico BG; archers feet locked to it.

## Match flow
1. Title → Controls → Difficulty
2. Round start: flash distance + wind
3. Player charge → release → arc → hit/miss
4. Enemy AI same charge model
5. Best of 3 → Rematch / Title

## Combat rules (MVP)
| Hit | Damage |
|-----|--------|
| Body | 30 |
| Head | 45 |
| Start HP | 100 |

## Controls
| Input | Action |
|-------|--------|
| Hold A | Charge power bar |
| Release A | Fire at current charge |
| Up/Down | Adjust launch angle |
| Hold R | Scout enemy |
| Select | Toggle last-shot trace |
| Start | Pause |

## Art contract (Pico)
player/enemy idle, draw (while charging), release; hit/flinch banked; arrow L/R; bg-dusk 240×160; ui-wind-*.

## Non-goals (MVP)
Online multiplayer, story campaign, paid art APIs, GBC.
