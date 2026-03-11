class dalek (id : string) = object (self)
  val id : string = id
  val mutable hp : int = 150
  val mutable shield : bool = true
  val mutable dead_printed : bool = false

  method to_string : string =
    Printf.sprintf "<dalek id=%s; hp=%d; shield=%b>" id hp shield

  method talk : unit =
    Printf.printf "Dalek %s: EXTERMINATE!\n" id

  method die : unit =
    if not dead_printed then (
      dead_printed <- true;
      Printf.printf "Dalek %s: SYSTEM FAILURE... *boom*\n" id
    )

  method is_alive : bool = hp > 0

  method take_damage (dmg : int) : unit =
    if self#is_alive then (
      if shield then (
        shield <- false;
        Printf.printf "Dalek %s: SHIELD ABSORBS THE HIT!\n" id
      ) else (
        hp <- hp - dmg;
        if hp <= 0 then (
          hp <- 0;
          self#die
        )
      )
    )

  method attack_damage : int = 25

  method attack :
    'a. (< take_damage : int -> unit; to_string : string; .. > as 'a) -> unit =
  fun target ->
    if self#is_alive then (
      Printf.printf "Dalek %s attacks %s for %d damage.\n"
        id target#to_string self#attack_damage;
      target#take_damage self#attack_damage
    )


  initializer
    Printf.printf "A Dalek %s rolls in — HP: %d (shield=%b)\n" id hp shield
end
