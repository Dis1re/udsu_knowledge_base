uses crt;

const
  n = 5;

var
  a: array[1..n, 1..n]of integer;
  k: integer;

begin
  k := 1;
  
  for var i := 1 to trunc(n/2+1) do
  begin
    
    for var j := i to n - i + 1 do
    begin
      a[i, j] := k;
      k := k + 1;
    end;
    
    for var j := i + 1 to n - i + 1 do
    begin
      a[j, n - i + 1] := k;
      k := k + 1;
    end;
    
    for var j := n - i downto i do
    begin
      a[n - i + 1, j] := k;
      k := k + 1;
    end;
    
    for var j := n - i downto i + 1 do
    begin
      a[j, i] := k;
      k := k + 1;
    end;
    
  end;
  
  {вывод массива}
  for var i := 1 to n do
  begin
    for var j := 1 to n do
    begin
      GoToXY(j * 3 + 3, i * 2 + 1);
      write(a[i, j]);
    end;
    writeln
  end;
  {вывод массива}
  
end.