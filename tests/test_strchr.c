#include <string.h>
#include <criterion/criterion.h>
#include "../include/prototypes.h"

Test(my_strchr, empty_string) {
    char *original_res = strchr("", 'l');
    char *my_res = my_strchr("", 'l');

    cr_assert_eq(original_res, my_res);
}

Test(my_strchr, filled_string) {
    char *original_res = strchr("hello world!", 'l');
    char *my_res = my_strchr("hello world!", 'l');

    cr_assert_eq(original_res, my_res);
}

Test(my_strchr, filled_string_no_char_found) {
    char *original_res = strchr("the lazy dog jumps over the quick brown fox", '@');
    char *my_res = my_strchr("the lazy dog jumps over the quick brown fox", '@');

    cr_assert_eq(original_res, my_res);
}
