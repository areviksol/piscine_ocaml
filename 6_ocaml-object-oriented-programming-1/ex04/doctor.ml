class doctor (name : string) (age : int) = object (self)
  val name : string = name
  val age : int = age
  val mutable hp : int = 120
  val mutable dead_printed : bool = false

  method to_string : string =
    Printf.sprintf "<doctor name=%s; age=%d; hp=%d>" name age hp

  method talk : unit =
    Printf.printf "%s: Geronimo! (or… Allons-y!)\n" name

  method die : unit =
    if not dead_printed then (
      dead_printed <- true;
      Printf.printf "%s: I... regenerate...\n" name
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

  method attack_damage : int = 18

  initializer
    Printf.printf "The Doctor '%s' appears (age %d) — HP: %d.\n" name age hp
end
