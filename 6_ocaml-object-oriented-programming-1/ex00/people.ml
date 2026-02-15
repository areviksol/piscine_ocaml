class people (name : string) = object
  (* attributes *)
  val name : string = name
  val hp : int = 100

  method to_string : string =
    Printf.sprintf "<people name=%s; hp=%d>" name hp

  method talk : unit =
    Printf.printf "I'm %s! Do you know the Doctor?\n" name

  method die : unit =
    Printf.printf "Aaaarghh!\n"

  initializer
    Printf.printf
      "A new companion '%s' steps into the TARDIS — starting HP: %d. Allons-y!\n"
      name hp
end
