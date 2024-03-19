/*
** EPITECH PROJECT, 2024
** B-ASM-400-STG-4-1-asmminilibc-florent.guittre
** File description:
** prototypes.h
*/


#ifndef PROTOTYPES_H_
    #define PROTOTYPES_H_
    #define LIBRARY_PATH "./libasm.so"
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <dlfcn.h>
    #include <criterion/criterion.h>

    void setup();
    void teardown();

    extern size_t (*my_strlen)(char *);
    extern char *(*my_strchr)(const char *, int);
    extern void *(*my_memset)(void *, int, size_t);
    extern void *(*my_memcpy)(void *, const void *, size_t);
    extern int (*my_strcmp)(const char *, const char *);
    extern int (*my_strncmp)(const char *, const char *, size_t);
    extern void *(*my_memmove)(void *, const void *, size_t);
    extern char *(*my_strrchr)(const char *, int );
    extern char *(*my_strstr)(const char *, const char *);
    extern char *(*my_strpbrk)(const char *, const char *);
    extern size_t (*my_strcspn)(const char *, const char *);
    extern int (*my_strcasecmp)(const char *, const char *);
    extern char *(*my_index)(const char *, int);
    extern void *(*my_memfrob)(void *, size_t);

#endif /*PROTOTYPES_H_*/
