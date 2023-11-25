#include "../include/prototypes.h"
#include <unistd.h>

static void *handle;

size_t (*my_strlen)(char *);
char *(*my_strchr)(const char *, int);
void *(*my_memset)(void *, int, size_t);
void *(*my_memcpy)(void *, const void *, size_t);
int (*my_strcmp)(const char *, const char *);
int (*my_strncmp)(const char *, const char *, size_t);
void *(*my_memmove)(void *, const void *, size_t);
char *(*my_rindex)(const char *, int );
char *(*my_strstr)(const char *, const char *);
char *(*my_strpbrk)(const char *, const char *);
size_t (*my_strcspn)(const char *, const char *);
int (*my_strcasecmp)(const char *, const char *);
int (*my_strfry)(char *);

void setup()
{
    if (handle == NULL) {
        handle = dlopen(LIBRARY_PATH, RTLD_LAZY);
    }
    if (handle == NULL) {
        printf("Couldn't open library\n");
        return;
    }

    my_strlen = dlsym(handle, "strlen");
    my_strchr = dlsym(handle, "strchr");
    my_memset = dlsym(handle, "memset");
    my_memcpy = dlsym(handle, "memcpy");
    my_strcmp = dlsym(handle, "strcmp");
    my_strncmp = dlsym(handle, "strncmp");
    my_memmove = dlsym(handle, "memmove");
    my_rindex = dlsym(handle, "rindex");
    my_strstr = dlsym(handle, "strstr");
    my_strpbrk = dlsym(handle, "strpbrk");
    my_strcspn = dlsym(handle, "strcspn");
    my_strcasecmp = dlsym(handle, "strcasecmp");
    my_strfry = dlsym(handle, "strfry");
}

void teardown()
{
    if (handle == NULL) {
        printf("Couldn't close library\n");
        return;
    }
    dlclose(handle);
}
