class virtual molecule (name : string) (atoms : Atom.atom list) =
object (self)

  method name = name
  method atoms = atoms

  method private count_atoms =
    let rec add_atom atom lst =
      match lst with
      | [] -> [(atom#symbol, 1)]
      | (s, n) :: tl ->
          if s = atom#symbol then (s, n + 1) :: tl
          else (s, n) :: add_atom atom tl
    in
    let rec count acc lst =
      match lst with
      | [] -> acc
      | h :: t -> count (add_atom h acc) t
    in
    count [] atoms

  method private sort_hill lst =
    let rec extract symbol lst =
      match lst with
      | [] -> (None, [])
      | (s, n) :: t ->
          if s = symbol then (Some (s, n), t)
          else
            let (found, rest) = extract symbol t in
            (found, (s, n) :: rest)
    in
    let (carbon, rest1) = extract "C" lst in
    let (hydrogen, rest2) = extract "H" rest1 in
    let rest_sorted = List.sort compare rest2 in
    let with_c =
      match carbon with
      | None -> rest_sorted
      | Some c -> c :: rest_sorted
    in
    match hydrogen with
    | None -> with_c
    | Some h ->
        match carbon with
        | None -> h :: with_c
        | Some _ -> (List.hd with_c) :: h :: List.tl with_c

  method formula =
    let counted = self#count_atoms in
    let sorted = self#sort_hill counted in
    let rec build lst =
      match lst with
      | [] -> ""
      | (s, n) :: t ->
          s ^ string_of_int n ^ build t
    in
    build sorted

  method to_string =
    name ^ " : " ^ self#formula

  method equals (other : molecule) =
    self#formula = other#formula

end


class water =
object
  inherit molecule "Water"
    [ new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen ]
end

class carbon_dioxide =
object
  inherit molecule "Carbon dioxide"
    [ new Atom.carbon; new Atom.oxygen; new Atom.oxygen ]
end

class methane =
object
  inherit molecule "Methane"
    [ new Atom.carbon;
      new Atom.hydrogen; new Atom.hydrogen;
      new Atom.hydrogen; new Atom.hydrogen ]
end

class ammonia =
object
  inherit molecule "Ammonia"
    [ new Atom.nitrogen;
      new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen ]
end

class glucose =
object
  inherit molecule "Glucose"
    [ new Atom.carbon; new Atom.carbon; new Atom.carbon;
      new Atom.carbon; new Atom.carbon; new Atom.carbon;
      new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen;
      new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen;
      new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen;
      new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen;
      new Atom.oxygen; new Atom.oxygen; new Atom.oxygen;
      new Atom.oxygen; new Atom.oxygen; new Atom.oxygen ]
end
