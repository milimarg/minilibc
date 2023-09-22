#include "../include/prototypes.h"
#include <string.h>

int main(void)
{
    const char *haystack = "Hell";
    const char *needle = "Hello, world!";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    printf("my result = %s\n", my_result);
    printf("original result = %s\n", original_result);
    return (0);
}
