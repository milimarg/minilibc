#include "../include/prototypes.h"

/*
int main(void)
{
    int len = 12;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "hello world!", len);
    original_result = memmove(original_result, "hello world!", len);
    printf("my = '%s'\n", my_result);
    printf("original = '%s'\n", original_result);
    return (0);
}
*/

void *lib = NULL;

void setup()
{
    lib = dlopen(LIBRARY_PATH, RTLD_LAZY);
    if (lib == NULL) {
        printf("Cannot open lib: lib not found");
        return;
    }
    my_strlen = dlsym(lib, "strlen");
    my_strchr = dlsym(lib, "strchr");
    my_memset = dlsym(lib, "memset");
    my_memcpy = dlsym(lib, "memcpy");
    my_strcmp = dlsym(lib, "strcmp");
    my_strncmp = dlsym(lib, "strncmp");
    my_memmove = dlsym(lib, "memmove");
    my_rindex = dlsym(lib, "rindex");
    my_strstr = dlsym(lib, "strstr");
    my_strpbrk = dlsym(lib, "strpbrk");
    my_strcspn = dlsym(lib, "strcspn");
    my_strcasecmp = dlsym(lib, "strcasecmp");
}

void teardown()
{
    if (lib != NULL) {
        dlclose(lib);
    } else {
        printf("Cannot close lib: lib is NULL");
    }
}

int main(void)
{
    setup();

    int original_res = strlen("hello world!");
    int my_res = my_strlen("hello world!");

    printf("original = %d\n", original_res);
    printf("my = %d\n", my_res);
    teardown();
    return (0);
}
