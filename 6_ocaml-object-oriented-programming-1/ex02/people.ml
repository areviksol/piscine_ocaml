class people (name : string) = object
  val name : string = name
  val mutable hp : int = 100

  method to_string : string =
    Printf.sprintf "<people name=%s; hp=%d>" name hp

  method talk : unit =
    Printf.printf "I'm %s! Do you know the Doctor?\n" name

  method die : unit =
    hp <- 0;
    Printf.printf "Aaaarghh!\n"

  method get_hp : int = hp

  method set_hp (v : int) : unit =
    hp <- v

  initializer
    Printf.printf "A companion '%s' has entered the scene with HP = %d.\n" name hp
end
