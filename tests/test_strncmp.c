#include "../include/prototypes.h"

Test(my_strncmp, compare_same_string, .init = setup, .fini = teardown)
{
    const char *s1 = "hello";
    const char *s2 = "hello";
    int my_result = my_strncmp(s1, s2, 5);
    int original_result = strncmp(s1, s2, 5);

    cr_assert_eq(my_result, original_result);
}

Test(my_strncmp, compare_empty_string, .init = setup, .fini = teardown)
{
    const char *s1 = "a";
    const char *s2 = "a";
    int my_result = my_strncmp(s1, s2, 0);
    int original_result = strncmp(s1, s2, 0);

    cr_assert_eq(my_result, original_result);
}

Test(my_strncmp, size_lower_than_str_len, .init = setup, .fini = teardown)
{
    const char *s1 = "hello";
    const char *s2 = "hello";
    int my_result = my_strncmp(s1, s2, 2);
    int original_result = strncmp(s1, s2, 2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strncmp, size_greater_than_str_len, .init = setup, .fini = teardown)
{
    const char *s1 = "hello";
    const char *s2 = "hello";
    int my_result = my_strncmp(s1, s2, 20);
    int original_result = strncmp(s1, s2, 20);

    cr_assert_eq(my_result, original_result);
}
