uses Compl;

const eps = 0.0001;
var 
  z, z2, s, p: complex;
  t: real;
  k: integer;
begin
  z := inputC();
  z2 := multC(z, z);
  s := z;
  p := z;
  k := 1;
  while modulC(p) > eps do
  begin
    t := (-1)/(2*k)/(2*k+1);
    p := prodC(t, p); 
    p := multC(p, z2);
    s := addC(s, p);
    k := k + 1;
    writeln();
  end;
  outputC(s);
end.
