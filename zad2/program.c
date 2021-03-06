#include <stdio.h>
#include "parser.h"
#include "pam.h"

int main(void) {
  if (authorize()) {
    parse();
    return 0;
  }
  fprintf(stderr, "Authorization failed. Exiting.\n");
  return 1;
}
