NAME = app

SRC = app.ml main.ml

all:
	ocamlopt -o $(NAME) $(SRC)

clean:
	rm -f *.cmi *.cmx *.o app

fclean: clean
	rm -f $(NAME)

re: fclean all
