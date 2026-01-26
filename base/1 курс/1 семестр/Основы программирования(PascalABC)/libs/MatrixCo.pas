unit MatrixCo;

//---------------------------------------------------------------
interface

uses crt;
uses Compl;

type
  matrixC = array [,] of complex;

function initMatrixC(n: integer): matrixC;

function addMatrixC(a, b: matrixC): matrixC;

function subMatrixC(a, b: matrixC): matrixC;

function multMatrixC(a, b: matrixC): matrixC;

function prodMatrixC(t: real; a: matrixC): matrixC;

function normMatrixC(a: matrixC): real;

function oneMatrixC(n: integer): matrixC;

function fillMatrixC(n: integer; num: complex): matrixC;

function zeroMatrixC(n: integer): matrixC;

function inputMatrixC(n: integer): matrixC;

function RandNumMatrixC(n: integer): matrixC;

procedure outputMatrixC(a: matrixC);

//-----------------------------------------------------
implementation

uses crt;

function initMatrixC(n: integer): matrixC;
begin
  Result := new complex[n, n];
end;

function addMatrixC(a, b: matrixC): matrixC;
begin
  var n := a.GetLength(0);
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] := addC(a[i, j], b[i, j]);
end;

function subMatrixC(a, b: matrixC): matrixC;
begin
  var n := a.GetLength(0);
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] := subC(a[i, j], b[i, j]);
end;

function multMatrixC(a, b: matrixC): matrixC;
var
  S, p: complex;
begin
  var n := a.GetLength(0);
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
    begin
      S := zeroC();
      for var k := 0 to n-1 do
      begin
        p := multC(a[i, j], b[k, j]);
        S := addC(S, p);
      end;
      Result[i, j] := S;
    end;
end;

function prodMatrixC(t: real; a: matrixC): matrixC;
begin
  var n := a.GetLength(0);
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] := prodC(t, a[i, j]);
end;

function normMatrixC(a: matrixC): real;
var
  s: real;
begin
  var n := a.GetLength(0);
  var p: real := 0;
  for var i := 0 to n-1 do
  begin
    s := 0;
    for var j := 0 to n-1 do
      s := s + modulC(a[i, j]);
    if s > p then
      p := s;
  end;
  Result := p;
end;

function oneMatrixC(n: integer): matrixC;
begin
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    Result[i, i] := oneC();
end;

function fillMatrixC(n: integer; num: complex): matrixC;
begin
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] := num;
end;

function zeroMatrixC(n: integer): matrixC;
begin
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] :=  zeroC();
end;

function inputMatrixC(n: integer): matrixC;
begin
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
    begin
      writeln('Введите элемент(' + i + ', ' + j + ')');
      Result[i, j] := inputC();
    end;
end;

function RandNumMatrixC(n: integer): matrixC;
begin
  Result := initMatrixC(n);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
      Result[i, j] := randNumC();
end;

procedure outputMatrixC(a: matrixC);
begin
  ClrScr();
  var n := a.GetLength(0);
  for var i := 0 to n - 1 do
    for var j := 0 to n - 1 do
    begin
      GoToXY(j * 14 + 10, i * 3 + 5);
      writeln(a[i, j]);
    end;
end;

end.
