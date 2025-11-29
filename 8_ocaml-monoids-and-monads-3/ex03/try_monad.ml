module Try = struct
  type 'a t = 
    | Success of 'a
    | Failure of exn

  let return x = Success x

  let bind m f =
    match m with
    | Failure e -> Failure e
    | Success v ->
        (try f v with e -> Failure e)

  let recover m f =
    match m with
    | Success _ -> m
    | Failure e -> f e

  let filter m pred =
    match m with
    | Failure _ -> m
    | Success v ->
        if pred v then Success v
        else Failure (Failure "Filter predicate failed")

  let flatten mm =
    match mm with
    | Failure e -> Failure e
    | Success inner ->
        match inner with
        | Failure e -> Failure e
        | Success v -> Success v
end
