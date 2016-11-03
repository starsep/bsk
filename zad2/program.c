#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <stdio.h>

static struct pam_conv login_conv = {
  misc_conv,               /* przykładowa funkcja konwersacji z libpam_misc */
  NULL                        /* ewentualne dane aplikacji (,,domknięcie'') */
};

int main () {
  pam_handle_t* pamh = NULL;
  int retval;
  char *username = NULL;

  retval = pam_start("login", username, &login_conv, &pamh);
  if (pamh == NULL || retval != PAM_SUCCESS) {
    fprintf(stderr, "Error when starting: %d\n", retval);
    exit(1);
  }

  retval = pam_authenticate(pamh, 0);  /* próba autoryzacji */
  if (retval != PAM_SUCCESS) {
    fprintf(stderr, "Chyba się nie udało!\n");
    exit(2);
  }
  else
    fprintf(stderr, "Świetnie Ci poszło.\n");

  printf("OK\n");  /* rzekomy kod aplikacji */

  pam_end(pamh, PAM_SUCCESS);
  exit(0);
}
