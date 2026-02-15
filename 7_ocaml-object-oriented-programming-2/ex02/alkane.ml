class virtual alkane (n : int) =
  let name =
    match n with
    | 1 -> "Methane"
    | 2 -> "Ethane"
    | 3 -> "Propane"
    | 4 -> "Butane"
    | 5 -> "Pentane"
    | 6 -> "Hexane"
    | 7 -> "Heptane"
    | 8 -> "Octane"
    | 9 -> "Nonane"
    | 10 -> "Decane"
    | 11 -> "Undecane"
    | 12 -> "Dodecane"
    | _ -> invalid_arg "Invalid alkane size"
  in
  let rec make_atoms atom count =
    if count <= 0 then []
    else atom :: make_atoms atom (count - 1)
  in
  let atoms =
    make_atoms (new Atom.carbon) n
    @ make_atoms (new Atom.hydrogen) (2 * n + 2)
  in
object
  inherit Molecule.molecule name atoms
end


class methane =
object
  inherit alkane 1
end

class ethane =
object
  inherit alkane 2
end

class octane =
object
  inherit alkane 8
end
