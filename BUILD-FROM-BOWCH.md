# Stickbow build playbook (from Bowch writeup)

Source: https://www.spritefusion.com/blog/making-a-game-boy-advance-game-with-gpt-6-astra  
We steal the **engineering recipe**, not their name, art API, or medieval characters.

## Copy (do this)
- GBA 240×160, freestanding C + ARM asm, fixed-point physics, ~60 Hz
- Turn-based duel: player shot → resolve → AI shot → resolve
- Archers ~400–560 world px apart; enemy can start off-screen
- Gravity on arrows + horizontal wind; wind **constant per round**, reroll between rounds
- Camera: near player while aiming; follow arrow (incl. high arcs); Hold R scout
- HUD top (HP, wind, distance, round); aim UI bottom; UI stationary during shake
- Body 30 / head 45 / start HP 100; best of 3; 3 AI difficulties with aim error
- Miss: dirt + stuck arrow + short/long feedback
- Cosmetic RNG separate from gameplay RNG
- Title / controls / pause / rematch screens
- Juice ladder (later phases): recoil, arrow trail, hit flash, camera shake, previous-shot trace

## Change (Stickbow locks)
| Bowch | Stickbow |
|-------|----------|
| Sprite Fusion paid API art | Pico stick figures + dusk BG (free) |
| Left/Right = power, A = shoot | **Hold A = charge power bar, release A = fire** |
| Up/Down = angle | Up/Down = angle (same) |
| Medieval hooded / Iron Stag | Black stick / maroon stick |
| Blood/leaves day-one | P3 juice only (pace through the week) |

## Phase mapping (paced)
| Day | Slice | Bowch prompt chunk |
|-----|-------|--------------------|
| Thu | Toolchain + first boot ROM + charge bar stub | initial prompt skeleton |
| Fri | Arc physics + wind + camera follow | projectile physics |
| Mon | Hits + HP + best-of-3 | game loop HP rules |
| Tue | AI + difficulty | enemy aiming errors |
| Wed | Menus + scout R + last-shot trace | controls/camera |
| next week | Recoil/trail/shake/wind glyphs | “Improve game feel” juice |

## Do not
- Call Sprite Fusion or any paid art API
- Port Bowch ROM binary / claim their assets
- Implement the entire juice list in one session
