class doctor (name : string) (age_init : int) (sidekick : people) = object (self)
  val name : string = name
  val mutable age : int = age_init
  val sidekick : people = sidekick
  val mutable hp : int = 100

  method to_string : string =
    Printf.sprintf "<doctor name=%s; age=%d; hp=%d; sidekick=%s>"
      name age hp (sidekick#to_string)

  method talk : unit =
    Printf.printf "Hi! I'm the Doctor!\n"

  method travel_in_time (start : int) (arrival : int) : unit =
    let delta = arrival - start in
    age <- age + delta;
    (* simple ascii TARDIS *)
    Printf.printf "  _____\n";
    Printf.printf " /_____\\\n";
    Printf.printf " | .-. |\n";
    Printf.printf " |( T )|\n";
    Printf.printf " | `-' |\n";
    Printf.printf " |_____|\n";
    Printf.printf "  | | |\n";
    Printf.printf "  |_|_|\n";
    Printf.printf "Traveled from %d to %d. Age now %d\n" start arrival age;
    if arrival < start then begin
      self#regenerate;
      Printf.printf "Backward travel triggered regeneration; HP restored to %d\n" hp
    end

  method use_sonic_screwdriver : unit =
    Printf.printf "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii\n"

  method take_damage (d : int) : unit =
    if d > 0 then hp <- (if hp - d < 0 then 0 else hp - d)

  method get_hp : int = hp
  method get_age : int = age

  method private regenerate : unit =
    hp <- 100

  initializer
    Printf.printf "The Doctor '%s' (age %d) appears with sidekick %s.\n"
      name age (sidekick#to_string)
end
