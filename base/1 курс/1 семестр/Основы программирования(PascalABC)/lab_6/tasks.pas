//uses crt;

procedure task_1();
const n = 12;
var m, i, o: integer;
g: real;
a: array[1..n] of integer;
begin
  for i := 1 to n do
    a[i] := i;
  writeln(a);
  
  m := trunc(n / 3);
  for i := 1 to m do
  begin
    o := a[i*3 - 2];
    a[i*3-2] := a[i*3 - 1];
    a[i*3-1] := a[i*3];
    a[i*3] := o;
  end;
  writeln(a);  
end;

procedure task_2();
const n = 12;
var m, i, o: integer;
g: real;
a: array[1..n] of integer;
begin
  for i := 1 to n do
    a[i] := i;
  writeln(a);
  
  m := trunc(n / 3);
  for i := 1 to m do
  begin
    o := a[i*3];
    a[i*3] := a[i*3-1];
    a[i*3-1] := a[i*3-2];
    a[i*3-2] := o;
    
  end;
  writeln(a);  
end;

procedure task_3();
const n = 12;
var m, i, o, j: integer;
g: real;
a: array[1..n] of integer;
begin
  for i := 1 to n do
    a[i] := random(0, 50);
  writeln(a);
  
  for i := 1 to n-1 do
    for j := 1 to n-i do 
      if a[j] > a[j+1] then
      begin
      o := a[j];
      a[j] := a[j+1];
      a[j+1] := o;
      end;
  writeln(a);
end;


begin
  task_1();
  writeln;  
  task_2();
  writeln;
  task_3();
end.



