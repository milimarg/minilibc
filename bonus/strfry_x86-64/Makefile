NASM	=	nasm -f macho64
CC	=	gcc
NAME	=	libasm.so

SRC	=	src/strfry.asm

OBJ	=	$(SRC:.asm=.o)

TESTS	=	tests/test_strfry.c

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
