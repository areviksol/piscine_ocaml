NAME = alkanes

OCAMLOPT = ocamlopt
INCLUDES = -I ../ex00 -I ../ex01

SRC = \
  ../ex00/atom.ml \
  ../ex01/molecule.ml \
  alkane.ml \
  main.ml

all: $(NAME)

$(NAME):
	$(OCAMLOPT) $(INCLUDES) -o $(NAME) $(SRC)

clean:
	rm -f *.cmx *.cmi *.o alkanes ../ex00/*.cmx ../ex00/*.cmi ../ex00/*.o ../ex01/*.cmx ../ex01/*.cmi ../ex01/*.o

fclean: clean
	rm -f $(NAME)

re: fclean all
.PHONY: all clean fclean re