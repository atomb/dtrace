#!/usr/sbin/dtrace -s
haskell$target:::user-trace {
    printf("%s", copyinstr(arg0));
}
