var
  S, P, t, q: real;
  k, m: integer;

const
  eps = 0.0001;

begin
  readln(t);
  readln(q);
  S := 1;
  k := 1;
  P := 1;
  while abs(P) > eps do
  begin
    m := 2 * k;
    P := P * (-1 * (sqr(t)/(m * (m - 1))) * q);
    S := S + P;
    k := k + 1;
  end;
  writeln(S);
end.