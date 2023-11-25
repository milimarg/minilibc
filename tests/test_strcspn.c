#include "../include/prototypes.h"

Test(my_strcspn, no_match)
{
    const char *str1 = "Hello, World!";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, match_at_start)
{
    const char *str1 = "123Hello, World!";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, match_at_end)
{
    const char *str1 = "Hello, World!123";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, match_at_middle)
{
    const char *str1 = "Hello, 123World!";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, empty_left)
{
    const char *str1 = "";
    const char *str2 = "123";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, empty_right)
{
    const char *str1 = "Hello";
    const char *str2 = "";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcspn, both_empty)
{
    const char *str1 = "";
    const char *str2 = "";
    size_t my_result = my_strcspn(str1, str2);
    size_t original_result = strcspn(str1, str2);

    cr_assert_eq(my_result, original_result);
}
