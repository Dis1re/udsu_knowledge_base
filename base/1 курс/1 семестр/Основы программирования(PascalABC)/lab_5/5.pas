uses crt;

const
  n = 10;

var
  i, j: integer;
  a: array[1..n, 1..n] of integer;

begin
  {фон}
  for i := 1 to n do
    for j := 1 to n do a[i, j] := 0;
  {фон}
  
  for i := 1 to n do a[i, n + 1 - i] := n + 1 - i;
  
  {вывод}
  for i := 1 to n do
    for j := 1 to n do 
    begin
      GoToXY(4 * j + 2, i);
      writeln(a[i, j]);
    end;
  {вывод}
end.