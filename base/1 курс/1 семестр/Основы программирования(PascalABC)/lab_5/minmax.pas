uses crt;

const
  n = 4;

var
  i, j, m, max: integer;
  a: array[1..n, 1..n] of integer;
  min: array [1..n] of integer;

begin
  {фон}
  max := -1;
  for i := 1 to n do
    begin
    min[i]:= 100*100;
    for j := 1 to n do a[i, j] := random(1, 15); 
    end;
  {фон}
  
    
  for i := 1 to n do
  begin
    for j := 1 to n do
      begin
        if a[i, j] < min[i] then
          min[i] := a[i, j];
      end;
   end;
   for i := 1 to n do
     if min[i] > max then max := min[i];
  
  {вывод}
  for i := 1 to n do
    begin
    for j := 1 to n do 
    begin
      GoToXY(4 * j + 2, i);
      writeln(a[i, j]);
    end;
    GoToXY(4*i + 2, n + 2);
    writeln(min[i]);
    end;
    GoToXY(trunc(n/2), n+4);
    writeln(max);
   {вывод}
end.