#ifndef MY_H_
    #define MY_H_
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <dlfcn.h>
    //#include <criterion/criterion.h>
    #define LIBRARY_PATH "./libasm.so"

size_t (*my_strlen)(char *str);
char *(*my_strchr)(const char *str, int c);
void *(*my_memset)(void *s, int c, size_t n);
void *(*my_memcpy)(void *dest, const void *src, size_t n);
int (*my_strcmp)(const char *s1, const char *s2);
int (*my_strncmp)(const char *s1, const char *s2, size_t n);
void *(*my_memmove)(void *dest, const void *src, size_t n);
char *(*my_rindex)(const char *s, int c);
char *(*my_strstr)(const char *haystack, const char *needle);
char *(*my_strpbrk)(const char *s, const char *charset);
size_t (*my_strcspn)(const char *s, const char *charset);

#endif /*MY_H_*/
