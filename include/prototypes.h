#ifndef PROTOTYPES_H_
    #define PROTOTYPES_H_
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <dlfcn.h>
    #include <criterion/criterion.h>
    #define LIBRARY_PATH "./libasm.so"

    void setup();
    void teardown();

    extern size_t (*my_strlen)(char *);
    extern char *(*my_strchr)(const char *, int);
    extern void *(*my_memset)(void *, int, size_t);
    extern void *(*my_memcpy)(void *, const void *, size_t);
    extern int (*my_strcmp)(const char *, const char *);
    extern int (*my_strncmp)(const char *, const char *, size_t);
    extern void *(*my_memmove)(void *, const void *, size_t);
    extern char *(*my_rindex)(const char *, int );
    extern char *(*my_strstr)(const char *, const char *);
    extern char *(*my_strpbrk)(const char *, const char *);
    extern size_t (*my_strcspn)(const char *, const char *);
    extern int (*my_strcasecmp)(const char *, const char *);
    extern int (*my_strfry)(char *);

#endif /*PROTOTYPES_H_*/
