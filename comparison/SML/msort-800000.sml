(* https://stackoverflow.com/questions/25839939/understanding-merge-sort-in-ml *)

fun split [] = ([], [])
  | split [a] = ([a], [])
  | split (a::b::cs) =
    let
	val (m,n) = split cs
    in
	(a::m, b::n)
    end;

fun merge ([], ys) = ys
  | merge (xs, []) = xs
  | merge (x::xs, y::ys) =
    if x<y then
	x::merge(xs, y::ys)
    else
	y::merge(x::xs, ys);

fun msort [] = []
  | msort [a] = [a]
  | msort [a,b] = if a<b then [a,b] else [b,a]
  | msort xs =
    let
	val (m,n) = split xs;
    in
	merge (msort m, msort n)
    end;




(* mkRandList *)
local 
    val nextInt = Random.randRange(1,10000);
    val r = Random.rand(1,1);
in
  fun mkRandList 0 = []
    | mkRandList n = (nextInt r)::(mkRandList (n-1))
end;


msort (mkRandList 800000);


