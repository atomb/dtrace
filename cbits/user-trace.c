#include "trace.h"

void user_trace(char *arg) {
    if(HASKELL_USER_TRACE_ENABLED()) {
        HASKELL_USER_TRACE(arg);
    }
}
