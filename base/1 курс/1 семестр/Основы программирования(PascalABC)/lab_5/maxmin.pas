uses crt;

const
  n = 4;

var
  i, j, m, min: integer;
  a: array[1..n, 1..n] of integer;
  max: array [1..n] of integer;

begin
  {фон}
  min := 10*10;
  for i := 1 to n do
    begin
    max[i]:= -1;
    for j := 1 to n do a[i, j] := random(1, 15); 
    end;
  {фон}
  
    
  for i := 1 to n do
  begin
    for j := 1 to n do
      begin
        if a[i, j] > max[i] then
          max[i] := a[i, j];
      end;
   end;
   for i := 1 to n do
     if max[i] < min then min := max[i];
  
  {вывод}
  for i := 1 to n do
    begin
    for j := 1 to n do 
    begin
      GoToXY(4 * j + 2, i);
      writeln(a[i, j]);
    end;
    GoToXY(4*i + 2, n + 2);
    writeln(max[i]);
    end;
    GoToXY(trunc(n/2), n+4);
    writeln(min);
   {вывод}
end.