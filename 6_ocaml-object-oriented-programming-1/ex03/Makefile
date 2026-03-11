NAME = ex03
SRC  = people.ml doctor.ml dalek.ml army.ml main.ml

all:
	ocamlopt -o $(NAME) $(SRC)

clean:
	rm -f $(TARGET) *.cmx *.cmi *.o

fclean: clean
	rm -f $(NAME)

re: fclean all
