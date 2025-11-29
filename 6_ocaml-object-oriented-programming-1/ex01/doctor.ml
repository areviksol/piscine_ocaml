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
    (* change age logically: new age = old age + (arrival - start) *)
    let delta = arrival - start in
    age <- age + delta;
    (* draw a simple TARDIS ascii art *)
    Printf.printf "  _____\n";
    Printf.printf " /_____\\\n";
    Printf.printf " | .-. |\n";
    Printf.printf " |( T )|\n";
    Printf.printf " | `-' |\n";
    Printf.printf " |_____|\n";
    Printf.printf "  | | |\n";
    Printf.printf "  |_|_|\n";
    Printf.printf "Traveled from %d to %d. Doctor's age is now %d\n" start arrival age;
    (* If traveling backward in time, call private regenerate as 'odd' side effect *)
    if arrival < start then begin
      self#regenerate;
      Printf.printf "Backward time travel forced regeneration: hp restored to %d\n" hp
    end

  method use_sonic_screwdriver : unit =
    Printf.printf "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii\n"

  (* helper methods for testing/debugging *)
  method take_damage (d : int) : unit =
    if d <= 0 then () else hp <- (if hp - d < 0 then 0 else hp - d)

  method get_hp : int = hp
  method get_age : int = age

  method private regenerate : unit =
    hp <- 100

  initializer
    Printf.printf
      "The Doctor '%s' (age %d) materializes with sidekick %s. TARDIS engaged!\n"
      name age (sidekick#to_string)
end
