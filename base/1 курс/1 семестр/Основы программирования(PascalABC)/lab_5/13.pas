uses crt;

const
  n = 10;

var
  i, j, m: integer;
  a: array[1..n, 1..n] of integer;

begin
  {фон}
  for i := 1 to n do
    for j := 1 to n do a[i, j] := 0; 
  {фон}
  
  for i := 1 to n do 
  begin
    a[i, 1] := 1;
    a[1, i] := 1;
    a[n, i] := 1;
    a[i, n] := 1;
  end;
  
  {вывод}
  for i := 1 to n do
    for j := 1 to n do 
    begin
      GoToXY(4 * j + 2, i);
      writeln(a[i, j]);
    end;
   {вывод}
end.