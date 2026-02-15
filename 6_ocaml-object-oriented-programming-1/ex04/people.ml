class people (name : string) = object (self)
  val name : string = name
  val mutable hp : int = 100
  val mutable dead_printed : bool = false

  method to_string : string =
    Printf.sprintf "<people name=%s; hp=%d>" name hp

  method talk : unit =
    Printf.printf "I'm %s! Do you know the Doctor?\n" name

  method die : unit =
    if not dead_printed then (
      dead_printed <- true;
      Printf.printf "%s: Aaaarghh!\n" name
    )

  method is_alive : bool = hp > 0

  method take_damage (dmg : int) : unit =
    if self#is_alive then (
      hp <- hp - dmg;
      if hp <= 0 then (
        hp <- 0;
        self#die
      )
    )

  initializer
    Printf.printf
      "A new companion '%s' steps into the TARDIS — starting HP: %d. Allons-y!\n"
      name hp
end
