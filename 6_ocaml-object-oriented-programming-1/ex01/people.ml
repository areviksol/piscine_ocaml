class people (name : string) = object
  val name : string = name
  val mutable hp : int = 100

  method to_string : string =
    Printf.sprintf "<people name=%s; hp=%d>" name hp

  method talk : unit =
    Printf.printf "I'm %s! Do you know the Doctor?\n" name

  method die : unit =
    Printf.printf "Aaaarghh!\n"

  method get_hp : int = hp

  method take_damage (d : int) : unit =
    if d <= 0 then () else hp <- (if hp - d < 0 then 0 else hp - d)

  initializer
    Printf.printf
      "A new companion '%s' has boarded the TARDIS — starting HP: %d. Allons-y!\n"
      name hp
end
