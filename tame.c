#include "raylib.h"

int main(void) {
  // Initialization of the window
  InitWindow(800, 450, "tame");

  SetTargetFPS(60);

  // Main game loop
  while (!WindowShouldClose()) // Detect window close button or ESC key
  {
    BeginDrawing();

    ClearBackground(BLACK);

    DrawText("Hello, World!", 190, 200, 20, WHITE);

    EndDrawing();
  }

  CloseWindow(); // Close window and OpenGL context

  return 0;
}
