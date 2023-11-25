#include "../include/prototypes.h"

Test(my_memset, null_n, .init = setup, .fini = teardown) {
    int len = 0;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_memset, positive_n, .init = setup, .fini = teardown) {
    int len = 5;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_memset, n_lower_than_ptr_len, .init = setup, .fini = teardown) {
    int len = 3;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    cr_assert_str_eq(original_res, my_res);
}

Test(my_memset, n_greater_than_ptr_len, .init = setup, .fini = teardown) {
    int len = 7;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    cr_assert_str_eq(original_res, my_res);
}
