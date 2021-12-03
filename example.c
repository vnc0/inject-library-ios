#include <stdio.h>
#include <syslog.h>

void example_main (const char * data) {
  while (1) {
      syslog(LOG_WARNING, "Hello %s!", data);
  }
}
