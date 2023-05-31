/*
** EPITECH PROJECT, 2023
** minilibc
** File description:
** my.h
*/

#ifndef MY_H_
    #define MY_H_
    #include <stdio.h>

size_t my_strlen(char *str);
char *my_strchr(const char *str, int c);
void *my_memset(void *s, int c, size_t n);
void *my_memcpy(void *dest, const void *src, size_t n);

#endif /*MY_H_*/
