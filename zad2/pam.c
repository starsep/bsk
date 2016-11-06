#include "pam.h"
#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <stdio.h>

bool authorize(void) {
  struct pam_conv login_conv = { misc_conv, NULL };
  bool result = false;
  pam_handle_t *pamh = NULL;
  char *username = NULL;

  int retval = pam_start("login", username, &login_conv, &pamh);

  if (pamh == NULL || retval != PAM_SUCCESS) {
    fprintf(stderr, "Error with PAM. Exiting.\n");
    exit(1);
  }

  retval = pam_authenticate(pamh, 0);
  result = retval == PAM_SUCCESS;
  pam_end(pamh, retval);
  return result;
}
