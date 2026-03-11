# OCaml Piscine

This repository contains my exercises and materials for the `Piscine OCaml`.

## Structure

- `0_ocaml-basic-syntax-and-semantics-0` - basic syntax and semantics
- `1_ocaml-recursion-and-higher-order-functions-0` - recursion and higher-order functions
- `2_Pattern Matching and Data Types - 0` - pattern matching and data types
- `3_OCaml’s modules language - 1` - OCaml module system
- `4_Imperative features - 1` - imperative features
- `5_OCAML - Functor - 1` - functors
- `6_ocaml-object-oriented-programming-1` - object-oriented programming in OCaml (part 1)
- `7_ocaml-object-oriented-programming-2` - object-oriented programming in OCaml (part 2)
- `8_ocaml-monoids-and-monads-3` - monoids and monads

## How to run exercises

Most exercise directories include a `Makefile`. Typical flow:

```bash
cd "<exercise_folder>/<exXX>"
make
./<executable_name>
```

If there is no `Makefile`, you can compile manually:

```bash
ocamlc -o main *.ml
./main
```

## Notes

- Assignment statements are in `en.subject.pdf` (in the root and/or inside module folders).
- For a clean build, use `make clean` or `make fclean` when available.
