// 3 - написать процедуру prodMatrix
// 6 - написать процедуру inputMatrix
// 7 - написать процедуру OutpuMatrix
// 10* - вычислять арифметическую прогрессию вида n = 1/(2k)!*A^(2k) = E - 1/2*A^2 + 1/24*A^4 ...

Uses crt;

Type Complex = record
  Re, Im: real;
end;

procedure Add(u, v:Complex; var w: Complex);
begin 
  w.Re := u.Re + v.Re;
  w.Im := u.Im + v.Im;
end;

procedure Mult(u, v: Complex; var w: Complex);
begin 
  w.Re := u.Re * v.Re - u.Im * v.Im;
  w.Im := u.Re * v.Im + u.Im * v. Re;
end;

procedure Prod(a:real; z: Complex; var w: Complex);
begin 
  w.Re := a *z.Re;
  w.Im := a *z.Im;
end;

procedure Input(var z: Complex);
begin
  writeln('Введите вещественную часть комлексного числа: ');
  readln(z.Re);
  writeln('Введите мнимую часть комлексного числа: ');
  readln(z.Im);
end;

procedure Zero(var z: Complex);
begin 
  z.Re := 0;
  z.Im := 0;
end;

procedure One(var z: Complex);
begin 
  z.Re := 1;
  z.Im := 0;
end;

const n = 2;
type Matrix = array[1..n, 1..n] of Complex;

procedure AddMatrix(a, b: Matrix; var c: Matrix);
var i, j: integer;
begin
  for i:= 1 to n do
    for j:= 1 to n do
      Add(a[i, j], b[i, j], c[i, j]);
end;

procedure MultMatrix(a, b: Matrix; var c: Matrix);
var S, p:Complex;
begin
  for var i := 1 to n do
    for var j := 1 to n do
    begin
      Zero(S);
      for var k := 1 to n do
        begin
          Mult(a[i, j], b[k, j], p);
          Add(S, p, S);
        end;
        c[i, j] := S;
      end;
end;

procedure prodMatrix(t:real; a: Matrix; var b: Matrix);
var i, j: integer;
begin
  for i:= 1 to n do
    for j:= 1 to n do
      Prod(t, a[i, j], b[i, j]);
end;

procedure OneDMatrix(var a: Matrix);
var i, j:integer;
begin
  for i := 1 to n do
    One(a[i, i]);
end;

procedure OneMatrix(var a: Matrix);
var i, j:integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      One(a[i, j]);
end;


procedure ZeroMatrix(var a: Matrix);
var i, j:integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      Zero(a[i, j]);
end;

procedure inputMatrix(var a: Matrix);
var i, j: integer;
begin
  for i:= 1 to n do
    for j := 1 to n do
    begin
      writeln('Введите элемент('+ i +', '+ j +')');
      Input(a[i, j]);
    end;
end;

procedure OutputMatrix(a: Matrix);
var i, j: integer;
begin
  for i:= 1 to n do
    for j := 1 to n do
    begin
      GoToXY(j*14 + 10, i*3 + 5);
      writeln(a[i, j]);
    end;
end;

procedure task_10();
const eps = 0.0001;
var A, A2, S, p: Matrix;
  t: real;
  k: integer;
begin
  inputMatrix(A);
  MultMatrix(A, A, A2);
  oneMatrix(S);
  oneDMatrix(p);
  k := 0;
  t := 1;
  ClrScr();
  while abs(t) > eps do
  begin
    t := t * (-1)/(k+1)/(k+2);
    MultMatrix(p, A2, p);
    ProdMatrix(t, p, p);
    AddMatrix(p, S, S);
    k := k + 2;
  end;
  OutputMatrix(S);
end;

begin
  task_10();
end.