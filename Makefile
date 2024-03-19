NASM	=	nasm
CC		=	gcc
NAME	=	libasm.so

SRC	=	src/strlen.asm \
		src/strchr.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/strrchr.asm \
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
			tests/test_strrchr.c \
			tests/test_strstr.c \
			tests/test_strpbrk.c \
			tests/test_strcasecmp.c \
			tests/test_strcspn.c \
			tests/test_memmove.c \
			src/dummy.c

TESTS_NAME	=	unit_tests
TESTS_OBJ	=	$(TESTS:.c=.o)

CFLAGS	=	-Wall -Wextra -lcriterion --coverage

all: $(patsubst %.asm, %.o, $(SRC))
	ld -shared -o $(NAME) $(OBJ)

%.o: %.asm
	$(NASM) -f elf64 -o $@ $<

clean:
	rm -f $(OBJ)
	rm -f $(TESTS_OBJ)
	find . -name "*.gcda" -delete
	find . -name "*.gcno" -delete

fclean: clean
	rm -f $(NAME)
	rm -f $(TESTS_NAME)

re: fclean all

tests_run: all
tests_run: $(TESTS_NAME)

$(TESTS_NAME): $(TESTS_OBJ)
	$(CC) -o $(TESTS_NAME) $(TESTS_OBJ) $(CFLAGS)
	./$(TESTS_NAME)

# type that for unit tests : export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

.PHONY: all clean fclean re tests
