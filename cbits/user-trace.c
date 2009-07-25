#include "trace.h"

void user_trace(char *arg) {
    HASKELL_USER_TRACE(arg);
}

int user_trace_enabled() {
    if (HASKELL_USER_TRACE_ENABLED()) {
        return 1;
    } else {
        return 0;
    }
}
