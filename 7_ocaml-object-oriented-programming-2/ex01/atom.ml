class virtual atom (name : string) (symbol : string) (atomic_number : int) =
object (self)
  method name = name
  method symbol = symbol
  method atomic_number = atomic_number

  method equals (other : atom) =
    self#name = other#name &&
    self#symbol = other#symbol &&
    self#atomic_number = other#atomic_number

  method to_string =
    name ^ " (" ^ symbol ^ "), atomic number " ^ string_of_int atomic_number
end

class hydrogen =
object
  inherit atom "Hydrogen" "H" 1
end

class carbon =
object
  inherit atom "Carbon" "C" 6
end

class oxygen =
object
  inherit atom "Oxygen" "O" 8
end

class nitrogen =
object
  inherit atom "Nitrogen" "N" 7
end

class sodium =
object
  inherit atom "Sodium" "Na" 11
end

class chlorine =
object
  inherit atom "Chlorine" "Cl" 17
end
