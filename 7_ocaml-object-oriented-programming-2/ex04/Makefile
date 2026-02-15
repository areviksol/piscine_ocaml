OCAMLOPT = ocamlopt
SRC = atom.ml molecule.ml alkane.ml reaction.ml alkane_combustion.ml main.ml
TARGET = alkane_combustion

all:
	$(OCAMLOPT) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET) *.cm* *.o *.cmo 

fclean: clean