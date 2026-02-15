NAME = atoms

SRC = atom.ml main.ml
OBJ = $(SRC:.ml=.cmx)

OCAMLOPT = ocamlopt

all: $(NAME)

$(NAME): $(SRC)
	$(OCAMLOPT) -o $(NAME) $(SRC)

clean:
	rm -f *.cmx *.cmi *.o *.cmo atoms

fclean: clean
	rm -f $(NAME)

re: fclean all
