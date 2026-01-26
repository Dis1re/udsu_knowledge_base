unit exam_task2;

interface

procedure task2();
  
implementation

uses crt;
procedure task2();
const n = 5;
begin
  var t : array[1..n, 1..n] of real;
  
  for var i := 1 to n do
    for var j := 1 to n do
      t[i, j] := random(1, 1000);
  
  var maxN := -10**10;
  for var i := 1 to n do
    for var j := 1 to n do
    if ((i >= j) and (n - i + 1 <= j)) or ((i <= j) and (n - i + 1>= j )) then 
      maxN := max(maxN, t[i, j]);
  
  for var i := 1 to n do
    for var j := 1 to n do
    begin
    GoToXY(3 + i*4, 16 + j );
    write(t[j, i]: 7)
    end;
    writeln();
    writeln();
    writeln('max = ', maxN);
  
  readkey;
end;

end.