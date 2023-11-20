#include "../include/prototypes.h"

Test(my_memmove, move_empty_string)
{
    int len = 1;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "", len);
    original_result = memmove(original_result, "", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}

Test(my_memmove, move_filled_string)
{
    int len = 12;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "hello world!", len);
    original_result = memmove(original_result, "hello world!", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}

Test(my_memmove, given_len_lower_than_src_len)
{
    int len = 5;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "hello world!", len);
    original_result = memmove(original_result, "hello world!", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}

Test(my_memmove, given_len_greater_than_src_len)
{
    int len = 20;
    char *my_result = malloc(sizeof(char) * len);
    char *original_result = malloc(sizeof(char) * len);

    my_result = my_memmove(my_result, "hello world!", len);
    original_result = memmove(original_result, "hello world!", len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(original_result[i], my_result[i]);
}

/*
Test(my_memmove, move_on_overlapped_memory)
{
    char *my_data = strdup("hello world kjdfkjsdfkjsdfskjdfkjisdfkjsdfkjs!");
    char *data = strdup("hello world kjdfkjsdfkjsdfskjdfkjisdfkjsdfkjs!");
    int len = strlen(&my_data[6]);

    my_data = my_memmove(my_data, &my_data[6], len);
    data = memmove(data, &data[6], len);
    for (int i = 0; i < len; i++)
        cr_assert_eq(my_data[i], data[i]);
}
*/
