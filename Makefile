NASM	=	nasm
CC	=	gcc
NAME	=	libasm.so

SRC	=	src/strlen.asm \
		src/strchr.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/rindex.asm \
		src/strstr.asm \
		src/strpbrk.asm \
		src/strcspn.asm \
		src/strcasecmp.asm \
		src/memmove.asm

OBJ	=	$(SRC:.asm=.o)

TESTS	=	tests/setup.c \
			tests/test_strlen.c \
			tests/test_memcpy.c \
			tests/test_strchr.c \
			tests/test_memset.c \
			tests/test_strcmp.c \
			tests/test_strncmp.c \
			tests/test_rindex.c \
			tests/test_strstr.c \
			tests/test_strpbrk.c \
			tests/test_strcasecmp.c \
			tests/test_strcspn.c \
			tests/test_memmove.c

TESTS_NAME	=	unit_tests
TESTS_OBJ	=	$(TESTS:.c=.o)

all: $(patsubst %.asm, %.o, $(SRC))
	$(CC) -shared -o $(NAME) $(OBJ)

%.o: %.asm
	$(NASM) -f elf64 -o $@ $<

clean:
	rm -f $(OBJ)
	rm -f $(TESTS_OBJ)

fclean: clean
	rm -f $(NAME)
	rm -f $(TESTS_NAME)

re: fclean all

tests: $(NAME)

$(NAME): $(TESTS_OBJ)
	$(CC) -o $(TESTS_NAME) $(TESTS_OBJ) -lcriterion

# type that for unit tests : export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

.PHONY: all clean fclean re tests
