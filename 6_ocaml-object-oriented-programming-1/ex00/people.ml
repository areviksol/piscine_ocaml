class people (name : string) = object
  (* attributes *)
  val name : string = name
  val hp : int = 100

  (* string representation *)
  method to_string : string =
    Printf.sprintf "<people name=%s; hp=%d>" name hp

  (* talk: Doctor Who reference included *)
  method talk : unit =
    Printf.printf "I'm %s! Do you know the Doctor?\n" name

  (* die: battle cry / last gasp *)
  method die : unit =
    Printf.printf "Aaaarghh!\n"

  (* initializer message printed when object is created *)
  initializer
    Printf.printf
      "A new companion '%s' steps into the TARDIS — starting HP: %d. Allons-y!\n"
      name hp
end
