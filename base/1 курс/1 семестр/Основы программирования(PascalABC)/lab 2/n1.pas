var n, m: integer;
  S: real;
begin
  S := 0;
  for n := 1 to 33 do
  begin
    m := 3*n;
    S := S + 1/((m-2)*(m+1));
  end;
  writeln(S);
end.