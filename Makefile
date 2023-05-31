##
## EPITECH PROJECT, 2023
## minilibc
## File description:
## Makefile
##

SRC	=	src/strlen.asm \
		src/strchr.asm \
		src/memset.asm

OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

NASM	=	nasm -f elf64

TESTS	=	tests/test_strlen.c \
			tests/test_strchr.c \
			tests/test_memset.c

TESTS_NAME	=	unit_tests

TESTS_OBJ	=	$(TESTS:.c=.o)

all: $(patsubst %.asm, %.o, $(SRC))
	gcc -shared -o $(NAME) $(OBJ)

%.o: %.asm
	$(NASM) -o $@ $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

tests: $(NAME)

$(NAME): $(TESTS_OBJ)
	gcc -o $(TESTS_NAME) $(TESTS_OBJ) -lcriterion -L. -lasm

# mettre ça pour les unit tests : export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

.PHONY: all clean fclean re tests
