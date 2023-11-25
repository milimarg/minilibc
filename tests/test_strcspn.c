#include "../include/prototypes.h"

Test(my_strcspn, no_match, .init = setup, .fini = teardown)
{
    const char *str1 = "Hello, World!";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, match_at_start, .init = setup, .fini = teardown)
{
    const char *str1 = "123Hello, World!";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, match_at_end, .init = setup, .fini = teardown)
{
    const char *str1 = "Hello, World!123";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, match_at_middle, .init = setup, .fini = teardown)
{
    const char *str1 = "Hello, 123World!";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, empty_left, .init = setup, .fini = teardown)
{
    const char *str1 = "";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, empty_right, .init = setup, .fini = teardown)
{
    const char *str1 = "Hello";
    const char *str2 = "";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, both_empty, .init = setup, .fini = teardown)
{
    const char *str1 = "";
    const char *str2 = "";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}
