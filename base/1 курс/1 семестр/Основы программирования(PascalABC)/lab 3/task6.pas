var
  S, P, t: real;
  k, m: integer;

const
  eps = 0.000001;

begin
  readln(t);
  S := t;
  k := 0;
  P := t;
  while abs(P) > eps do
  begin
    k := 2 + k;
    P := P * ((-t) * t) / k /(k + 1);
    S := S + P;
  end;
  writeln(S);
  writeln(sin(t))
end.