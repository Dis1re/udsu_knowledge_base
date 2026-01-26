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
  
  m := n - 1;
  for i := 1 to m do a[i+1, i] := 1;
  
  {вывод}
  for i := 1 to n do
    for j := 1 to n do 
    begin
      GoToXY(4 * i + 2, j);
      writeln(a[i, j]);
    end;
  {вывод}
end.