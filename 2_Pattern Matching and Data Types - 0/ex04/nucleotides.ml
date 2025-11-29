type phosphate = string
type deoxyribose = string

type nucleobase =
  | A
  | T
  | C
  | G
  | None

type nucleotide = {
  phosphate : phosphate;
  deoxyribose : deoxyribose;
  nucleobase : nucleobase
}

let generate_nucleotide c =
  let base =
    if c = 'A' then A
    else if c = 'T' then T
    else if c = 'C' then C
    else if c = 'G' then G
    else None
  in
  {
    phosphate = "phosphate";
    deoxyribose = "deoxyribose";
    nucleobase = base
  }

let () =
  let print_nuc n =
    let base =
      if n.nucleobase = A then "A"
      else if n.nucleobase = T then "T"
      else if n.nucleobase = C then "C"
      else if n.nucleobase = G then "G"
      else "None"
    in
    print_endline
      ("[" ^ n.phosphate ^ "; " ^ n.deoxyribose ^ "; " ^ base ^ "]")
  in
  print_nuc (generate_nucleotide 'A');
  print_nuc (generate_nucleotide 'T');
  print_nuc (generate_nucleotide 'C');
  print_nuc (generate_nucleotide 'G');
  print_nuc (generate_nucleotide 'X')  (* should produce None *)
