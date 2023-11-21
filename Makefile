NASM	=	nasm -f macho64
CC	=	gcc
NAME	=	libasm.so

SRC	=	src/strlen.asm \
		src/strchr.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/memmove.asm \
		src/rindex.asm \
		src/strstr.asm \
		src/strpbrk.asm \
		src/strcspn.asm

OBJ	=	$(SRC:.asm=.o)

TESTS	=	tests/test_strlen.c \
			tests/test_strchr.c \
			tests/test_memset.c \
			tests/test_memcpy.c \
			tests/test_strcmp.c \
			tests/test_strncmp.c \
			tests/test_rindex.c \
			tests/test_strstr.c \
			tests/test_memmove.c \
			tests/test_strpbrk.c

TESTS_NAME	=	unit_tests
TESTS_OBJ	=	$(TESTS:.c=.o)
CFLAGS	=	-I/opt/homebrew/Cellar/criterion/2.4.1_3/include

all: $(patsubst %.asm, %.o, $(SRC))
	$(CC) -arch x86_64 -shared -o $(NAME) $(OBJ)

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
	$(CC) -arch x86_64 -o $(TESTS_NAME) $(TESTS_OBJ) -L/opt/homebrew/Cellar/criterion/2.4.1_3/lib -lcriterion -L. -lasm

# type that for unit tests : export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

.PHONY: all clean fclean re tests
