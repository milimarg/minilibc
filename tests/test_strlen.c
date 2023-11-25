#include "../include/prototypes.h"

Test(my_strlen, empty_string, .init = setup, .fini = teardown) {
    int original_res = strlen("");
    int my_res = my_strlen("");

    cr_assert_eq(original_res, my_res);
}

Test(my_strlen, filled_string, .init = setup, .fini = teardown) {
    int original_res = strlen("hello world!");
    int my_res = my_strlen("hello world!");

    cr_assert_eq(original_res, my_res);
}
