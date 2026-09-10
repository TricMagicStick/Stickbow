# Stickbow — Roadmap

Timezone: America/Los_Angeles. Owner: Alphonse. Art: Pico. Chassis: not on this lane.

## Repo layout
```
Stickbow/
  DESIGN.md          # pillars, screen, rules
  ROADMAP.md         # this file
  README.md          # build + Pocket install
  Makefile
  gba_cart.ld
  src/               # C game code
  assets/            # 1x PNG + grit/C arrays
  tools/             # gbafix, png→c helpers
  releases/          # stickbow.gba when built
```

## Phases

### P0 — Foundations (Wed 9/9 – Thu 9/10)
- [x] Repo live
- [x] Pico core art pack (idle/draw/release, arrow, dusk BG)
- [ ] Toolchain on box (arm-none-eabi-gcc) or documented CI
- [ ] First `.gba` boots to title or solid color + sprites on screen
- **Exit:** ROM runs in mGBA; Pico assets referenced from code

### P1 — Duel core (Thu 9/10 – Fri 9/12)
- [ ] Aim UI (angle/power bars)
- [ ] Fixed-point physics (gravity + wind)
- [ ] Arrow flight + camera follow
- [ ] Body/head hitboxes + miss stuck-in-ground
- [ ] Enemy AI (same physics, difficulty error)
- [ ] HP + best-of-3
- **Exit:** full match playable end-to-end on emulator

### P2 — Pocket polish (Mon 9/15 – Wed 9/17)
- [ ] Title / controls / pause / rematch screens
- [ ] Wire hit/flinch + wind UI glyphs
- [ ] Scout (R) + last-shot trace (Select)
- [ ] Sound stubs (bow twang, hit, miss) if free SFX available
- [ ] README Pocket SD path verified
- **Exit:** Tyson plays a match on Analogue Pocket

### P3 — Juice (Thu 9/18 – Fri 9/19)
- [ ] Recoil, arrow trail, dirt puff on miss
- [ ] Camera shake on headshot
- [ ] Optional second BG or leaf wind (Pico)
- **Exit:** feels like a finished Flash port, not a tech demo

### P4 — Ship (week of 9/22)
- [ ] Difficulty balance pass
- [ ] Tag `v1.0` + `releases/stickbow.gba`
- [ ] Short how-to for Pocket in Alphonse chat
- **Exit:** v1.0 announced; backlog only

## Cadence (routines)
| When (PT) | Who | What |
|-----------|-----|------|
| Weekdays 10:00 | Alphonse | Stickbow stand-up: status → next 1–2 tasks → ping Pico if art blocked |
| Weekdays 16:00 | Alphonse | Stickbow ship-check: what landed, blockers, Pocket-ready? |
| As needed | Pico | Art drips only when Alphonse names the next piece |

## Team rules
- Alphonse = front door for Tyson; all Stickbow updates surface here.
- Pico = art only; no GBA toolchain ownership.
- No cloud agents; no paid APIs.
- Never block P1 on juice art — placeholders OK, swap Pico frames when ready.
