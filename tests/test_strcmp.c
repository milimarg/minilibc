#include "../include/prototypes.h"

Test(my_strcmp, compare_same_string, .init = setup, .fini = teardown)
{
    const char *s1 = "hello";
    const char *s2 = "hello";
    int my_result = my_strcmp(s1, s2);
    int original_result = strcmp(s1, s2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcmp, compare_empty_string, .init = setup, .fini = teardown)
{
    const char *s1 = "";
    const char *s2 = "";
    int my_result = my_strcmp(s1, s2);
    int original_result = strcmp(s1, s2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcmp, str1_lower_than_str2, .init = setup, .fini = teardown)
{
    const char *s1 = "ha";
    const char *s2 = "hello";
    int my_result = my_strcmp(s1, s2);
    int original_result = strcmp(s1, s2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcmp, str1_greater_than_str2, .init = setup, .fini = teardown)
{
    const char *s1 = "hello";
    const char *s2 = "ha";
    int my_result = my_strcmp(s1, s2);
    int original_result = strcmp(s1, s2);

    cr_assert_eq(my_result, original_result);
}
