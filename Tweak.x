#include <sys/stat.h>
#include <string.h>

%hookf(int, stat, const char *pathname, struct stat *statbuf) {
    if (!strcmp(pathname, "/Library/MobileSubstrate/MobileSubstrate.dylib")
     || !strcmp(pathname, "/Applications/Cydia.app")
     || !strcmp(pathname, "/var/lib/cydia/")
     || !strcmp(pathname, "/var/cache/apt")
     || !strcmp(pathname, "/var/lib/apt")
     || !strcmp(pathname, "/etc/apt")
     || !strcmp(pathname, "/bin/bash")
     || !strcmp(pathname, "/bin/sh")
     || !strcmp(pathname, "/usr/libexec/ssh-keysign")
     || !strcmp(pathname, "/etc/ssh/sshd_config")) {
        return -1;
    }
    return %orig;
}

extern int raise(int signal);
extern void MSHookMemory(void *target, const void *data, size_t size);
static const uint8_t RET[] = {
    0xC0, 0x03, 0x5F, 0xD6
};

%ctor {
    %init;
    MSHookMemory((void *)raise, (void *)RET, 4);
}
