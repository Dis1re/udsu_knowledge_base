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
  
  m := trunc((n+1)/2);
  for i := m to n do
    for j := (n+1-i) to i do
      a[j, i] := 1;
  
  {вывод}
  for i := 1 to n do
    for j := 1 to n do 
    begin
      GoToXY(4 * j + 2, i);
      writeln(a[i, j]);
    end;
   {вывод}
end.