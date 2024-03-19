#include "../include/prototypes.h"

Test(my_strstr, empty_needle, .init = setup, .fini = teardown)
{
    const char *haystack = "Hello, world!";
    const char *needle = "";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, needle_greater_than_haystack, .init = setup, .fini = teardown)
{
    const char *haystack = "Hello";
    const char *needle = "Hello, world!";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, needle_same_as_haystack, .init = setup, .fini = teardown)
{
    const char *haystack = "Hello";
    const char *needle = "Hello";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, haystack_begins_with_needle, .init = setup, .fini = teardown)
{
    const char *haystack = "Hello, world!";
    const char *needle = "Hello";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, haystack_ends_with_needle, .init = setup, .fini = teardown)
{
    const char *haystack = "Hello, world!";
    const char *needle = "world!";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, needle_in_middle_of_haystack, .init = setup, .fini = teardown)
{
    const char *haystack = "Hello, world!";
    const char *needle = "world";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, inexistant_needle, .init = setup, .fini = teardown)
{
    const char *haystack = "Hello, world!";
    const char *needle = "meow";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, empty_haystack_empty_needle, .init = setup, .fini = teardown)
{
    const char *haystack = "";
    const char *needle = "";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_str_eq(my_result, original_result);
}
