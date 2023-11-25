#include "../include/prototypes.h"

Test(my_memcpy, copy_empty_string, .init = setup, .fini = teardown)
{
    int len = 1;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "", len);
    original_result = memcpy(original_result, "", len);
    cr_assert_str_eq(original_result, my_result);
}

Test(my_memcpy, copy_filled_string, .init = setup, .fini = teardown)
{
    int len = 12;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "hello world!", len);
    original_result = memcpy(original_result, "hello world!", len);
    cr_assert_str_eq(original_result, my_result);
}

Test(my_memcpy, given_len_lower_than_src_len, .init = setup, .fini = teardown)
{
    int len = 5;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "hello world!", len);
    original_result = memcpy(original_result, "hello world!", len);
    cr_assert_str_eq(original_result, my_result);
}

Test(my_memcpy, given_len_greater_than_src_len, .init = setup, .fini = teardown)
{
    int len = 20;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memcpy(my_result, "hello world!", len);
    original_result = memcpy(original_result, "hello world!", len);
    cr_assert_str_eq(original_result, my_result);
}
