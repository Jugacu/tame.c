#include <screens/screen.h>

typedef struct Game {
  GameScreen screen;
} Game;

void game_init(Game *g);
void game_tick(Game *g, float dt);
