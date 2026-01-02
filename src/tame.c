#include "raylib.h"
#include <game.h>

int main(void) {

  Game game = {0};
  game_init(&game);

  InitWindow(800, 450, "tame");

  SetTargetFPS(60);

  // Main game loop
  while (!WindowShouldClose()) // Detect window close button or ESC key
  {
    BeginDrawing();

    float dt = GetFrameTime();
    game_tick(&game, dt);

    EndDrawing();
  }

  CloseWindow();

  return 0;
}
