#include <string.h>
#include <criterion/criterion.h>
#include "../include/prototypes.h"

Test(my_memcpy, copy_empty_string)
{
    int len = 1;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "", len);
    original_result = memcpy(original_result, "", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}

Test(my_memcpy, copy_filled_string)
{
    int len = 12;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "hello world!", len);
    original_result = memcpy(original_result, "hello world!", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}

Test(my_memcpy, given_len_lower_than_src_len)
{
    int len = 5;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "hello world!", len);
    original_result = memcpy(original_result, "hello world!", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}

Test(my_memcpy, given_len_greater_than_src_len)
{
    int len = 20;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "hello world!", len);
    original_result = memcpy(original_result, "hello world!", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}
