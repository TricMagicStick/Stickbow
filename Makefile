# Stickbow — GBA archery duel
# Requires: arm-none-eabi-gcc (DevKitARM or any bare-metal ARM GCC)
# Optional: DEVKITARM / DEVKITPRO for gbafix from gba-tools

TARGET   := stickbow
BUILD    := build
SRC      := src
SOURCES  := main.c gfx.c input.c fixed.c physics.c fighter.c ai.c game.c sprites.c
ASM      := crt0.s

# Prefer DevKitARM if present
ifneq ($(strip $(DEVKITARM)),)
  export PATH := $(DEVKITARM)/bin:$(PATH)
endif
ifneq ($(strip $(DEVKITPRO)),)
  ifeq ($(strip $(DEVKITARM)),)
    export DEVKITARM := $(DEVKITPRO)/devkitARM
    export PATH := $(DEVKITARM)/bin:$(PATH)
  endif
  GBAFIX ?= $(DEVKITPRO)/tools/bin/gbafix
endif

PREFIX   ?= arm-none-eabi-
CC       := $(PREFIX)gcc
AS       := $(PREFIX)as
OBJCOPY  := $(PREFIX)objcopy
SIZE     := $(PREFIX)size

ARCH     := -mthumb -mthumb-interwork -mcpu=arm7tdmi
CFLAGS   := $(ARCH) -O2 -Wall -Wextra -fno-strict-aliasing -fomit-frame-pointer
CFLAGS   += -ffast-math -fno-builtin -nostdlib -I$(SRC)
ASFLAGS  := $(ARCH)
LDFLAGS  := $(ARCH) -nostdlib -T gba_cart.ld -Wl,-Map,$(BUILD)/$(TARGET).map

OBJS     := $(addprefix $(BUILD)/,$(SOURCES:.c=.o) $(ASM:.s=.o))

.PHONY: all clean check-toolchain

all: check-toolchain $(TARGET).gba

check-toolchain:
	@which $(CC) >/dev/null 2>&1 || { \
	  echo "ERROR: $(CC) not found."; \
	  echo "Install DevKitPro: https://devkitpro.org/wiki/Getting_Started"; \
	  echo "Or any arm-none-eabi-gcc targeting ARM7TDMI, then re-run make."; \
	  exit 1; \
	}

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/%.o: $(SRC)/%.c | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o: $(SRC)/%.s | $(BUILD)
	$(CC) $(ASFLAGS) -c $< -o $@

$(BUILD)/$(TARGET).elf: $(OBJS) gba_cart.ld
	$(CC) $(LDFLAGS) -o $@ $(OBJS) -lgcc
	$(SIZE) $@

$(TARGET).gba: $(BUILD)/$(TARGET).elf
	$(OBJCOPY) -O binary $< $@
	@if [ -n "$(GBAFIX)" ] && [ -x "$(GBAFIX)" ]; then \
	  $(GBAFIX) $@ -tSTICKBOW -cSB01 -mTS -r0; \
	elif command -v python3 >/dev/null 2>&1; then \
	  python3 tools/gbafix.py $@ -t STICKBOW -c SB01 -m TS; \
	else \
	  echo "NOTE: gbafix skipped — ROM header unpatched (most emulators still boot)."; \
	fi
	@mkdir -p releases
	@cp -f $@ releases/$(TARGET).gba
	@echo "Built $@ and releases/$(TARGET).gba"

clean:
	rm -rf $(BUILD) $(TARGET).gba
