NASM	=	as
CC	=	gcc
NAME	=	libasm.so

SRC	=	src/strlen.s \
		src/memcpy.s \
		src/memset.s

OBJ	=	$(SRC:.s=.o)

TESTS	=	../../tests/test_strlen.c \
		../../tests/test_memcpy.c \
		../../tests/test_memset.c

TESTS_NAME	=	unit_tests

TESTS_OBJ	=	$(TESTS:.c=.o)

all: $(patsubst %.s, %.o, $(SRC))
	$(CC) -shared -o $(NAME) $(OBJ)

%.o: %.s
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
