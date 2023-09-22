#include <string.h>
#include <criterion/criterion.h>
#include "../include/prototypes.h"

Test(my_memset, null_n) {
    int len = 0;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    cr_assert_eq(original_res, my_res);
}

Test(my_memset, positive_n) {
    int len = 5;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    for (int i = 0; i < len; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}

Test(my_memset, n_lower_than_ptr_len) {
    int len = 3;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    for (int i = 0; i < len; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}

Test(my_memset, n_greater_than_ptr_len) {
    int len = 7;
    char *test = strdup("hello");
    char *original_res = memset(test, 0, len);
    char *my_res = my_memset(test, 0, len);

    for (int i = 0; i < len; i++)
        cr_assert_eq(original_res[i], my_res[i]);
}
