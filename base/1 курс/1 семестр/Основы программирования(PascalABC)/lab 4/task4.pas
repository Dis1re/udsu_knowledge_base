uses crt;
const m = 3; n = 5;
var a, b, c: array[1..m, 1..n] of real;
    i, j: integer;
begin
  for i := 1 to n do 
  begin
    GoToXY(4*i, i + 3);
    readln(a[i, j]);
  end;
  for i := 1 to m do
    begin
    for j := 1 to n do
    begin
      GoToXY(4 * j + 22, i + 3);
      readln(b[i, j])
    end; end;
    for i := 1 to m do
      begin
      for j := 1 to n do
      begin
        c[i, j] := a[i, j] + b[i, j];
        GoTOXY(4 * j, i - 10);
        writeln(c[i, j])
      end;
      end;
end.