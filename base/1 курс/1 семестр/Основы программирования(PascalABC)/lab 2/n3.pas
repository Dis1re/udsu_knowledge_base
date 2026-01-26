var
  S, P, t: real;
  k, m: integer;

begin
  readln(t);
  S := t;
  P := t;
  for k := 1 to 100 do
  begin
    m := 2 * k;
    P := P * (((-t) * t) / (m * (m + 1)));
    S := S + P;
  end;
  writeln(S);
  writeln(sin(t))
end.