#include "gba.h"
#include "gfx.h"
#include "game.h"

int main(void) {
    gfx_init();
    game_init();

    for (;;) {
        game_update();
        vsync();
        game_draw();
    }
    return 0;
}
