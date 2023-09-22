#include <string.h>
#include <criterion/criterion.h>
#include "../include/prototypes.h"

Test(my_strstr, empty_needle)
{
    const char *haystack = "Hello, world!";
    const char *needle = "";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, needle_greater_than_haystack)
{
    const char *haystack = "Hello";
    const char *needle = "Hello, world!";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, needle_same_as_haystack)
{
    const char *haystack = "Hello";
    const char *needle = "Hello";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, haystack_begins_with_needle)
{
    const char *haystack = "Hello, world!";
    const char *needle = "Hello";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, haystack_ends_with_needle)
{
    const char *haystack = "Hello, world!";
    const char *needle = "world!";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, needle_in_middle_of_haystack)
{
    const char *haystack = "Hello, world!";
    const char *needle = "world";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}

Test(my_strstr, inexistant_needle)
{
    const char *haystack = "Hello, world!";
    const char *needle = "meow";
    char *my_result = my_strstr(haystack, needle);
    char *original_result = strstr(haystack, needle);

    cr_assert_eq(my_result, original_result);
}
