# Modifiable Arguments from Command Line
ifndef SONG
SONG := song.mod
endif

ifndef CC
CC := gcc
endif

ifndef LCC
LCC := lib/gbdk/bin/lcc
endif

ifndef TARGET
TARGET := bin/game.gb
endif

# =============================================================================
MOD2GBT := bin/mod2gbt

# Files
OBJ := obj/main.o obj/output.o obj/gbt_player.o obj/gbt_player_bank1.o
SRC := main.c lib/gbt_player/gbt_player_bank.s lib/gbt_player/gbt_player.s

# Rules =======================================================================
# Main target
$(TARGET): $(OBJ)
	$(LCC) -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -Wl-yt1 -Wl-yo4 -Wl-ya0 -o $@ $^

build: $(TARGET)

# Removes everything that was built
clean:
	rm -f $(wildcard obj/*.o)
	rm -f $(wildcard obj/*.lst)
	rm -f $(wildcard obj/*.sym)
	rm -f $(wildcard obj/*.c)
	rm -f $(wildcard bin/*.gb)
	rm -f $(wildcard bin/*.map)
	rm -f $(wildcard bin/*.sym)
	rm -f bin/mod2gbt

# Build mod2gbt
$(MOD2GBT): lib/mod2gbt/mod2gbt.c
	@mkdir -p bin
	$(CC) $^ -o $(MOD2GBT)

# Process the .mod with mod2gbt
obj/output.c: $(MOD2GBT) $(SONG)
	@mkdir -p obj
	$(MOD2GBT) $(SONG) song 2 -speed -o obj/output.c

# Build song output obj file
obj/output.o: obj/output.c
	$(LCC) -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o obj/output.o obj/output.c

# Build gbt_player obj files
obj/%.o: lib/gbt_player/%.s
	@mkdir -p obj
	$(LCC) -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o $@ $<

# Build src obj files
obj/%.o: %.c
	@mkdir -p obj
	$(LCC) -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -Ilib/gbt_player -c -o $@ $<
