var
  S, P, t: real;
  k, m: integer;

const
  eps = 0.00001;

begin

  readln(t);
  S := 1;
  k := 1;
  P := 1;
  while abs(P) > eps do
  begin
    m := 2 * k;
    P := P * (-1 * (sqr(t)/(m * (m - 1))));
    S := S + P;
    k := k + 1;
  end;
  writeln(S);
  writeln(cos(t))
end.