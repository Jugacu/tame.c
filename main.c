#include <stdio.h>
#include <stdlib.h>

char *concatenate(char *a, char *b) {
  int sizf = sizeof(a) + sizeof(b);
  char *both_ptr = malloc(sizf);

  snprintf(both_ptr, sizf, "%s %s", a, b);

  return both_ptr;
}

int main() {
  char hello[] = "Hello";
  char world[] = "world!\n";

  char *concatenated = concatenate(hello, world);

  printf("%s", concatenated);

  free(concatenated);

  return 0;
}
