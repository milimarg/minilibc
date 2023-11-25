#ifndef MY_H_
    #define MY_H_
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <criterion/criterion.h>

    size_t my_strlen(char *);
    char *my_strchr(const char *, int);
    void *my_memset(void *, int, size_t);
    void *my_memcpy(void *, const void *, size_t);
    int my_strcmp(const char *, const char *);
    int my_strncmp(const char *, const char *, size_t);
    void *my_memmove(void *, const void *, size_t);
    char *my_rindex(const char *, int );
    char *my_strstr(const char *, const char *);
    char *my_strpbrk(const char *, const char *);
    size_t my_strcspn(const char *, const char *);
    int my_strcasecmp(const char *, const char *);
    int my_strfry(char *);

#endif /*MY_H_*/
