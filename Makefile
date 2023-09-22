NASM	=	nasm -f elf64
CC	=	gcc
NAME	=	libasm.so
ASFLAGS	=	-Iinclude

SRC	=	src/strlen.asm \
		src/strchr.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/memmove.asm \
		src/rindex.asm \
		src/strstr.asm

OBJ	=	$(SRC:.asm=.o)

TESTS	=	tests/test_strlen.c \
			tests/test_strchr.c \
			tests/test_memset.c \
			tests/test_memcpy.c \
			tests/test_strcmp.c \
			tests/test_strncmp.c \
			tests/test_rindex.c \
			tests/test_strstr.c \
			tests/test_memmove.c

TESTS_NAME	=	unit_tests

TESTS_OBJ	=	$(TESTS:.c=.o)

all: $(patsubst %.asm, %.o, $(SRC))
	$(CC) -shared -o $(NAME) $(OBJ)

%.o: %.asm
	$(NASM) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJ)
	rm -f $(TESTS_OBJ)

fclean: clean
	rm -f $(NAME)
	rm -f $(TESTS_NAME)

re: fclean all

tests: $(NAME)

$(NAME): $(TESTS_OBJ)
	$(CC) -o $(TESTS_NAME) $(TESTS_OBJ) -lcriterion -L. -lasm

# type that for unit tests : export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

.PHONY: all clean fclean re tests
