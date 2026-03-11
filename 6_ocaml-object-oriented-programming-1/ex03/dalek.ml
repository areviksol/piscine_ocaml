class dalek = object (self)
  val name : string =
    "Dalek" ^ string_of_int (Random.int 1000)

  val hp : int = 100
  val shield : bool = true

  method to_string : string =
    Printf.sprintf "<dalek name=%s; hp=%d; shield=%b>" name hp shield

  method talk : unit =
    Printf.printf "EX-TER-MI-NATE!\n"

  method die : unit =
    Printf.printf "Emergency Temporal Shift!\n"

  method attack (p : People.people) : unit =
    p#die
end
