class ['a] army (members_init : 'a list) = object (self)
  val members : 'a list = members_init

  method members = members

  method add (x : 'a) =
    {< members = x :: members >}

  method delete =
    match members with
    | [] -> self
    | _ :: tl -> {< members = tl >}
end
