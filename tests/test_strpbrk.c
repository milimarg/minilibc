#include "../include/prototypes.h"

Test(my_strpbrk, empty_strings, .init = setup, .fini = teardown)
{
    const char *str = "";
    char *original_res = strpbrk(str, str);
    char *my_res = my_strpbrk(str, str);

    cr_assert_eq(original_res, my_res);
}

Test(my_strpbrk, no_match, .init = setup, .fini = teardown)
{
    const char *str1 = "abcdef";
    const char *str2 = "xyz";
    char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    cr_assert_eq(original_res, my_res);
}

Test(my_strpbrk, match_at_beginning, .init = setup, .fini = teardown)
{
    const char *str1 = "abcdef";
    const char *str2 = "axz";
    char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_strpbrk, match_at_end, .init = setup, .fini = teardown)
{
    const char *str1 = "abcdef";
    const char *str2 = "xyzf";
    char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_strpbrk, match_at_middle, .init = setup, .fini = teardown)
{
    const char *str1 = "abcdef";
    const char *str2 = "xyzc";
    char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_strpbrk, multiple_matches, .init = setup, .fini = teardown)
{
    const char *str1 = "abcdef";
    const char *str2 = "xcdfzb";
    char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_strpbrk, single_match_with_duplicates, .init = setup, .fini = teardown)
{
    const char *str1 = "aabbcc";
    const char *str2 = "abc";
    char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    cr_assert_str_eq(original_res, my_res);
}
