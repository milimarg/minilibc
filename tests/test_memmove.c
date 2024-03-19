#include "../include/prototypes.h"

Test(my_memmove, move_empty_string, .init = setup, .fini = teardown)
{
    int len = 1;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "", len);
    original_result = memmove(original_result, "", len);
    cr_assert_str_eq(original_result, my_result);
}

Test(my_memmove, move_filled_string, .init = setup, .fini = teardown)
{
    int len = 12;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "hello world!", len);
    original_result = memmove(original_result, "hello world!", len);
    cr_assert_str_eq(my_result, original_result);
}

Test(my_memmove, given_len_lower_than_src_len, .init = setup, .fini = teardown)
{
    int len = 5;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "hello world!", len);
    original_result = memmove(original_result, "hello world!", len);
    cr_assert_str_eq(original_result, my_result);
}

Test(my_memmove, given_len_greater_than_src_len, .init = setup, .fini = teardown)
{
    int len = 20;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "hello world!", len);
    original_result = memmove(original_result, "hello world!", len);
    cr_assert_str_eq(original_result, my_result);
}

Test(my_memmove, memory_overlapping, .init = setup, .fini = teardown)
{
    char source[] = "meow This is a source string.";
    char destination[50] = {0};

    char *original_res = memmove(destination, source, strlen(source) + 1);
    char *my_res = my_memmove(destination, source, strlen(source) + 1);
    cr_assert_str_eq(original_res, my_res);

    original_res = memmove(source + 5, source, strlen(source) + 1);
    my_res = my_memmove(source + 5, source, strlen(source) + 1);
    cr_assert_str_eq(original_res, my_res);
}
