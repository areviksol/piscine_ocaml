class doctor (name_init : string) (age_init : int) (sidekick_init : People.people) =
object (self)
  (* attributes *)
  val name : string = name_init
  val age : int = age_init
  val hp : int = 100
  val sidekick : People.people = sidekick_init

  method to_string : string =
    Printf.sprintf "<doctor name=%s; age=%d; hp=%d>" name age hp

  method talk : unit =
    Printf.printf "I'm the Doctor. Actually, I'm %s!\n" name

  method use_sonic_screwdriver : unit =
    Printf.printf "Whiii-whiii-whiii! (sonic screwdriver)\n"

  (* Functional damage: returns a NEW doctor with updated hp *)
  method take_damage (dmg : int) =
    let dmg_pos = if dmg < 0 then 0 else dmg in
    let new_hp = hp - dmg_pos in
    let clamped_hp = if new_hp < 0 then 0 else new_hp in
    {< hp = clamped_hp >}

  (* Private regeneration: returns a NEW doctor (hp reset, age + 1) *)
  method private regenerate =
    Printf.printf "Regeneration energy! New face... same Doctor.\n";
    {< hp = 100; age = age + 1 >}

  (* Travel in time: backward triggers regeneration; forward just prints *)
  method travel_in_time (start_year : int) (arrival_year : int) =
    if arrival_year < start_year then self#regenerate
    else (
      Printf.printf "Vworp vworp! Travelling from %d to %d.\n" start_year arrival_year;
      self
    )

  method get_sidekick : People.people = sidekick

  initializer
    Printf.printf "Doctor '%s' enters the TARDIS (age=%d, hp=%d).\n" name age hp
end
