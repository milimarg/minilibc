#include "../include/prototypes.h"

Test(my_strcasecmp, same_and_different_case, .init = setup, .fini = teardown)
{
    const char *str1 = "Hello";
    const char *str2 = "hello";
    int my_result = my_strcasecmp(str1, str2);
    int original_result = strcasecmp(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcasecmp, different_and_different_case, .init = setup, .fini = teardown)
{
    const char *str1 = "Bonjour";
    const char *str2 = "hello";
    int my_result = my_strcasecmp(str1, str2);
    int original_result = strcasecmp(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcasecmp, same_and_same_case, .init = setup, .fini = teardown)
{
    const char *str1 = "Hello";
    const char *str2 = "Hello";
    int my_result = my_strcasecmp(str1, str2);
    int original_result = strcasecmp(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcasecmp, empty, .init = setup, .fini = teardown)
{
    const char *str1 = "";
    const char *str2 = "";
    int my_result = my_strcasecmp(str1, str2);
    int original_result = strcasecmp(str1, str2);

    cr_assert_eq(my_result, original_result);
}

Test(my_strcasecmp, empty_half, .init = setup, .fini = teardown)
{
    const char *str1 = "Hello";
    const char *str2 = "";
    int original_result = strcasecmp(str1, str2);
    int my_result = my_strcasecmp(str1, str2);

    cr_assert_eq(my_result, original_result);
}
