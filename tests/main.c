#include "../include/prototypes.h"
#include <string.h>
#include <stdlib.h>

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

int main(void)
{
    char *original_res = strpbrk("hello world", "dlo");
    char *my_res = my_strpbrk("hello world", "dlo");

    printf("original = %s\n", original_res);
    printf("my = %s\n", my_res);
    return (0);
}
