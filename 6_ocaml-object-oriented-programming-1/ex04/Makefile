NAME = timewar

OCAMLOPT = ocamlopt
SRC = people.ml doctor.ml dalek.ml army.ml galifrey.ml main.ml
OBJ = $(SRC:.ml=.cmx)

all: $(NAME)

$(NAME): $(OBJ)
	$(OCAMLOPT) -o $(NAME) $(OBJ)

%.cmx: %.ml
	$(OCAMLOPT) -c $<

clean:
	rm -f *.cmx *.cmi *.o timewar

fclean: clean
	rm -f $(NAME)

re: fclean all
