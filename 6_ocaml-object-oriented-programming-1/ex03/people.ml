class people (name_init : string) = object (self)
  val name : string = name_init
  val hp : int = 100

  method to_string : string =
    Printf.sprintf "<people name=%s; hp=%d>" name hp

  method talk : unit =
    Printf.printf "I'm %s! Do you know the Doctor?\n" name

  method take_damage (dmg : int) =
    let dmg_pos = if dmg < 0 then 0 else dmg in
    let new_hp = hp - dmg_pos in
    let clamped_hp = if new_hp < 0 then 0 else new_hp in
    {< hp = clamped_hp >}

  method die : unit =
    Printf.printf "Aaaarghh!\n"

  initializer
    Printf.printf
      "A new companion '%s' steps into the TARDIS — starting HP: %d. Allons-y!\n"
      name hp
end
