#include "../include/prototypes.h"

Test(my_strrchr, empty_string, .init = setup, .fini = teardown) {
    char *original_res = strrchr("", 'l');
    char *my_res = my_strrchr("", 'l');

    cr_assert_eq(my_res, original_res);
}

Test(my_strrchr, filled_string, .init = setup, .fini = teardown) {
    char *original_res = strrchr("hello world!", 'l');
    char *my_res = my_strrchr("hello world!", 'l');

    cr_assert_str_eq(my_res, original_res);
}
