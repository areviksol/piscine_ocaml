class army_people (init : People.people list) = object (self)
  val mutable members : People.people list = init

  method members : People.people list = members

  method add (p : People.people) : unit =
    members <- p :: members

  method alive : People.people list =
    List.filter (fun p -> p#is_alive) members

  method has_alive : bool =
    match self#alive with
    | [] -> false
    | _ -> true
end

class army_doctor (init : Doctor.doctor list) = object (self)
  val mutable members : Doctor.doctor list = init

  method members : Doctor.doctor list = members

  method add (d : Doctor.doctor) : unit =
    members <- d :: members

  method alive : Doctor.doctor list =
    List.filter (fun d -> d#is_alive) members

  method has_alive : bool =
    match self#alive with
    | [] -> false
    | _ -> true
end
