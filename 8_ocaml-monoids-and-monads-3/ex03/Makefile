NAME = try_monad

SRC = try_monad.ml main.ml

all:
	ocamlopt -o $(NAME) $(SRC)

clean:
	rm -f *.cmi *.cmx *.o try_monad

fclean: clean
	rm -f $(NAME)

re: fclean all
