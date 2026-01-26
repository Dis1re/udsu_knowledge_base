var
  n, m: integer;
  S, P: real;

begin
  S := 0;
  P := 1;
  for n := 1 to 100 do
  begin
    m := 2 * n;
    P := P * (m - 1);
    S := S + m / P;
  end;
  writeln(S);
end.