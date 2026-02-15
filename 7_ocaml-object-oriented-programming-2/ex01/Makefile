NAME = molecules

SRC = atom.ml molecule.ml main.ml

OCAMLOPT = ocamlopt

all: $(NAME)

$(NAME):
	$(OCAMLOPT) -o $(NAME) $(SRC)

clean:
	rm -f *.cmx *.cmi *.o molecules 

fclean: clean
	rm -f $(NAME)

re: fclean all
.PHONY: all clean fclean re