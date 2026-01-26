//лекцция про работу с векторами и комлексными векторами
program lab_10;


//вводим тип данных - вектор
const
  nVect = 3;

type
  Vector = array[1..nVect] of real;


//(1) процедура для складывания векторов
procedure AddVect(a, b: Vector; var c: Vector);
begin
  var i: integer;
  for i := 1 to nVect do
    c[i] := a[i] + b[i];
end;

//(2) функция для скалярного умножения векторов
function ScalMult(a, b: Vector): real;
begin
  var i: integer; 
  var s: real;
  s := 0;
  for i := 1 to nVect do
    s := s + a[i] * b[i];
  ScalMult := s;
end;

//(3) процедура для векторного умножения векторов
procedure VectMult(a, b: Vector; var c: Vector);
begin
  c[1] := a[2] * b[3] - a[3] * b[2];
  c[2] := a[3] * b[1] - a[1] * b[3];
  c[3] := a[1] * b[2] - a[2] * b[1];
end;

//(4) функция для смешанного произведения векторов
function MixMult(a, b, c: Vector): real;
begin
  var d: Vector;
  VectMult(a, b, d);
  MixMult := ScalMult(d, c);
end;

//(5) процедура для вычитания векторов (д/з)
procedure SubVect(a, b: Vector; var c: Vector);
var
  i: integer;
begin
  for i := 1 to nVect do
    c[i] := a[i] - b[i];
end;

//(6) функция для нахождения модуля вектора
function ModulVect(a: Vector): real;
begin
  ModulVect := sqrt(ScalMult(a, a));
end;

//(7) процедура для умножения вектора на число
procedure ProdVect(t: real; a: Vector; var c: Vector);
var
  i: integer;
begin
  for i := 1 to nVect do
    c[i] := a[i] * t;
end;

//ввод типа 

//(8) процедура для сложения комплексных векторов


//начало программы
begin
end.