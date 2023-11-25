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

int main(void)
{
    setup();

    //int original_res = strlen("hello world!");
    int my_res = my_strfry("hello world!");

    //printf("original = %d\n", original_res);
    printf("my = %d\n", my_res);
    teardown();
    return (0);
}
