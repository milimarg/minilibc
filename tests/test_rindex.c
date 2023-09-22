#include <string.h>
#include <criterion/criterion.h>
#include "../include/prototypes.h"

Test(my_rindex, empty_string) {
    char *original_res = rindex("", 'l');
    char *my_res = my_rindex("", 'l');

    cr_assert_eq(original_res, my_res);
}

Test(my_rindex, filled_string) {
    char *original_res = rindex("hello world!", 'l');
    char *my_res = my_rindex("hello world!", 'l');

    cr_assert_eq(original_res, my_res);
}

Test(my_rindex, filled_string_no_char_found) {
    char *original_res = rindex("the lazy dog jumps over the quick brown fox", '@');
    char *my_res = my_rindex("the lazy dog jumps over the quick brown fox", '@');

    cr_assert_eq(original_res, my_res);
}
