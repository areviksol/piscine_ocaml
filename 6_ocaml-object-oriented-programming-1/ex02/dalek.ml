(* Allowed modules used: Pervasives (builtin), String, Random *)
class dalek () = object (self)
  val name : string =
    let len = 3 in
    let suffix = String.init len (fun _ ->
      let r = Random.int 26 in
      Char.chr (Char.code 'A' + r)
    ) in
    "Dalek" ^ suffix

  val mutable hp : int = 100
  val mutable shield : bool = true

  method to_string : string =
    Printf.sprintf "<dalek name=%s; hp=%d; shield=%b>" name hp shield

  method private say_rand (s : string) : unit =
    Printf.printf "%s\n" s

  method talk : unit =
    let phrases = [|
      "Explain! Explain!";
      "Exterminate! Exterminate!";
      "I obey!";
      "You are the Doctor! You are the enemy of the Daleks!"
    |] in
    let idx = Random.int (Array.length phrases) in
    self#say_rand phrases.(idx)

  method exterminate (p : people) : unit =
    (* toggle shield each use *)
    shield <- not shield;
    (* announce and kill the target *)
    Printf.printf "Exterminate!\n";
    p#die

  method die : unit =
    hp <- 0;
    Printf.printf "Emergency Temporal Shift!\n"

  method get_name : string = name
  method get_hp : int = hp
  method get_shield : bool = shield

  initializer
    Printf.printf "A Dalek named %s is created with HP = %d and shield = %b.\n"
      name hp shield
end
