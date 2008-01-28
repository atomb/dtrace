#!/usr/sbin/dtrace -s
haskell$1:::user-trace {
    printf("%s", copyinstr(arg0));
}
