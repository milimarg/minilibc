#include "../include/prototypes.h"

Test(my_strchr, empty_string, .init = setup, .fini = teardown) {
    const char *str1 = "";
    const char str2 = 'l';
    char *original_res = strchr(str1, str2);
    char *my_res = my_strchr(str1, str2);

    cr_assert_eq(original_res, my_res);
}

Test(my_strchr, filled_string, .init = setup, .fini = teardown) {
    const char *str1 = "hello world!";
    const char str2 = 'l';
    char *original_res = strchr(str1, str2);
    char *my_res = my_strchr(str1, str2);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_strchr, filled_string_no_char_found, .init = setup, .fini = teardown) {
    const char *str1 = "the lazy dog jumps over the quick brown fox";
    const char str2 = '@';
    char *original_res = strchr(str1, str2);
    char *my_res = my_strchr(str1, str2);

    cr_assert_eq(original_res, my_res);
}
