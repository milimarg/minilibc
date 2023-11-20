#include "../include/prototypes.h"

Test(my_memcpy, empty_strings)
{
    const char *str = "";
    const char *original_res = strpbrk(str, str);
    char *my_res = my_strpbrk(str, str);

    cr_assert_eq(original_res, my_res);
}

Test(my_memcpy, no_match)
{
    const char *str1 = "abcdef";
    const char *str2 = "xyz";
    const char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    cr_assert_eq(original_res, my_res);
}

Test(my_memcpy, match_at_beginning)
{
    const char *str1 = "abcdef";
    const char *str2 = "axz";
    const char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    for (int i = 0; i < original_res[i] != '\0'; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}

Test(my_memcpy, match_at_end)
{
    const char *str1 = "abcdef";
    const char *str2 = "xyzf";
    const char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    for (int i = 0; i < original_res[i] != '\0'; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}

Test(my_memcpy, match_at_middle)
{
    const char *str1 = "abcdef";
    const char *str2 = "xyzc";
    const char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    for (int i = 0; i < original_res[i] != '\0'; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}

Test(my_memcpy, multiple_matches)
{
    const char *str1 = "abcdef";
    const char *str2 = "xcdfzb";
    const char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    for (int i = 0; i < original_res[i] != '\0'; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}

Test(my_memcpy, single_match_with_duplicates)
{
    const char *str1 = "aabbcc";
    const char *str2 = "abc";
    const char *original_res = strpbrk(str1, str2);
    char *my_res = my_strpbrk(str1, str2);

    for (int i = 0; i < original_res[i] != '\0'; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}
