#include "raylib.h"

#include <game.h>
#include <utils.h>

void game_init(Game *g) { g->screen = SPLASH; }

void game_tick(Game *g, float dt) {
  UNUSED(g);
  UNUSED(dt);

  DrawText("Hello, World!", 190, 200, 20, WHITE);
}
