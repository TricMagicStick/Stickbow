# Stickbow — Design

Bowman-style GBA archery duel for Analogue Pocket.

## Pillars
1. **One verb** — aim and release. Everything else supports that.
2. **Readable arc** — gravity + wind you can learn from the last shot.
3. **Stick DNA, pretty world** — thin stick archers; dusk landscape does the beauty.
4. **Pocket-native** — `.gba` on SD, 240×160, D-pad + A/B.

## Screen layout (240×160)

```
┌──────────────────────────────────────┐  y=0
│ HP■■■■  P1     WIND →→     P2  ■■HP │  HUD strip (~16px)
│ R:1/3              DIST 480          │
├──────────────────────────────────────┤
│                                      │
│         [parallax dusk BG]           │  Playfield
│   🧍───────────→→→───────────🧍     │  Ground ~y=120–140
│                                      │
├──────────────────────────────────────┤
│ ANGLE 42°   POWER ███░░░   [A] FIRE │  Aim strip (~24px)
└──────────────────────────────────────┘  y=160
```

- **Camera:** locked near shooter while aiming; follows arrow in flight; Hold R scouts enemy.
- **Safe zones:** HUD and aim strip never covered by blood/leaves juice later.
- **Ground:** flat strip from Pico BG; archers feet locked to it.

## Match flow
1. Title → Controls → Difficulty (Easy/Normal/Hard)
2. Round start: flash distance + wind, show both fighters briefly
3. Player aim → shoot → arrow flight → hit/miss resolve
4. Enemy aim (AI) → shoot → resolve
5. Repeat until one fighter HP ≤ 0 → round win
6. Best of 3 → Match result → Rematch / Title

## Combat rules (MVP)
| Hit | Damage |
|-----|--------|
| Body | 30 |
| Head | 45 |
| Start HP | 100 |
| Wind | constant per round; reroll between rounds |
| Distance | ~400–560 world px between archers |

## Controls
| Input | Action |
|-------|--------|
| Up/Down | Angle |
| Left/Right | Power |
| Hold B + dir | Coarse adjust |
| A | Shoot |
| Hold R | Scout enemy |
| Select | Toggle last-shot trace |
| Start | Pause |

## Art contract (Pico)
| Asset | Size | Notes |
|-------|------|-------|
| player/enemy idle, draw, release | 32×48 | black / maroon |
| player/enemy hit, flinch | 32×48 | optional juice |
| arrow L/R | 24×8 | rotate in code if needed |
| bg-dusk | 240×160 | flat ground strip |
| ui-wind-* | small | calm / L / R / strong |

## Non-goals (MVP)
- Online multiplayer, story campaign, inventory, paid art APIs, GBC (GBA only for now).
