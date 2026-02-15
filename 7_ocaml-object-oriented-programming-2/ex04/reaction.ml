class virtual reaction
  (start : (Molecule.molecule * int) list)
  (result : (Molecule.molecule * int) list) =
object
  method get_start = start
  method get_result = result

  method virtual balance : reaction
  method virtual is_balanced : bool
end

class dioxygen =
object
  inherit Molecule.molecule "Dioxygen"
    [ new Atom.oxygen; new Atom.oxygen ]
end

class methane_combustion =
object (self)
  inherit reaction
    [ (new Alkane.methane, 1); (new dioxygen, 2) ]
    [ (new Molecule.carbon_dioxide, 1); (new Molecule.water, 2) ]

  method balance = (self :> reaction)
  method is_balanced = true
end
