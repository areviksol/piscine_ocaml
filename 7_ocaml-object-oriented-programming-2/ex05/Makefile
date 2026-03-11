OCAMLOPT = ocamlopt
SRC = atom.ml molecule.ml alkane.ml reaction.ml alkane_combustion.ml main.ml
TARGET = incomplete_combustion

all:
	$(OCAMLOPT) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET) *.cm* *.o
