# Stickbow build playbook (from Bowch writeup)

Source: https://www.spritefusion.com/blog/making-a-game-boy-advance-game-with-gpt-6-astra  
We steal the **engineering recipe**, not their name, art API, or exact characters.

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
| Sprite Fusion paid API art | Pico hand pixels, free tier only |
| Left/Right = power, A = shoot | **Hold A = charge power bar, release A = fire** |
| Up/Down = angle | Up/Down = angle (same) |
| Green hood / Iron Stag | **Our hunter vs soldier** (see ART.md) — not sticks for ship |
| Blood/leaves day-one | Juice later (pace through the week) |

## Phase mapping (paced)
| Day | Slice |
|-----|-------|
| Thu | Toolchain + boot ROM + charge bar stub (stick placeholders OK) |
| Fri | Arc physics + wind + camera follow |
| Mon | Hits + HP + best-of-3 |
| Tue | AI + difficulty |
| Wed | Menus + scout R + last-shot trace |
| later | **Hunter/soldier sprite swap** (Pico) then juice |

## Do not
- Call Sprite Fusion or any paid art API
- Port Bowch ROM binary / claim their assets
- Ship final build with stick figures
- Implement the entire juice list in one session
