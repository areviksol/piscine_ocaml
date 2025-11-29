NAME = watchtower

SRC = watchtower.ml main.ml

all:
	ocamlopt -o $(NAME) $(SRC)

clean:
	rm -f *.cmi *.cmx *.o

fclean: clean
	rm -f $(NAME)

re: fclean all
