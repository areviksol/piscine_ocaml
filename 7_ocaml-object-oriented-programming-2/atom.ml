class virtual atom name symbol atomic_number = object (self)
  method name : string = name
  method symbol : string = symbol
  method atomic_number : int = atomic_number

  method to_string : string =
    Printf.sprintf "%s (%s): atomic number %d"
      self#name self#symbol self#atomic_number

  method equals (other : atom) : bool =
    self#name = other#name &&
    self#symbol = other#symbol &&
    self#atomic_number = other#atomic_number
end
