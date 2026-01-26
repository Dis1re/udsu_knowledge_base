unit Vect;

//---------------------------------------------------------------
interface

type vector = array of real;

function initVect(n: integer): vector;

function addVect(a, b: vector): vector;

function subVect(a, b: vector): vector;

function vectMult(a, b: vector): vector;

function prodVect(t: real; a: vector): vector;

function scalMultVect(a, b: vector): real;

function mixMultVect(a, b, c: vector): real;

function modulVect(a: vector): real;

function oneVect(n: integer): vector;

function zeroVect(n: integer): vector;

function inputVect(n: integer): vector;

function RandNumVect(n: integer; randMin: integer := 0;
                        randMax: integer := 100): vector;

function fillVect(n: integer; num: real): vector;

procedure outputVect(a: vector);

//----------------------------------------------------------
implementation

function initVect(n: integer): vector;
begin
  Result := new real[n];
end;

function addVect(a, b: vector): vector;
begin
  var n := a.Length;
  Result := initVect(n);
  for var i := 0 to n-1 do
    Result[i] := a[i] + b[i];
end;

function subVect(a, b: vector): vector;
begin
  var n := a.Length;
  Result := initVect(n);
  for var i:= 0 to n-1 do
    Result[i] := a[i] - b[i];
end;

function vectMult(a, b: vector): vector;
begin
  var n := a.Length;
  Result := initVect(n);
  Result[0] := a[1]*b[2] - a[2]*b[1];
  Result[1] := a[2]*b[0] - a[0]*b[2];
  Result[2] := a[0]*b[1] - a[1]*b[0];
end;

function scalMultVect(a, b: vector): real;
begin
  var n := a.Length;
  var s: real := 0;
  for var i := 0 to n-1 do
    s := s + a[i] * b[i];
  Result := s;
end;

function mixMultVect(a, b, c: vector): real;
begin
  var n: integer := a.Length;
  var d: vector := initVect(n);
  d := vectMult(a, b);
  Result := ScalMultVect(d, c);
end;

function modulVect(a: vector): real;
begin
  Result := sqrt(ScalMultVect(a, a));
end;

function prodVect(t: real; a: vector): vector;
begin
  var n := a.Length;
  Result := initVect(n);
  for var i := 0 to n-1 do
    Result[i] := a[i] * t;
end;


function OneVect(n: integer): vector;
begin
  Result := initVect(n);
  Result[0] := 1;
  for var i := 1 to n-1 do
    Result[i] := 0;
end;

function ZeroVect(n: integer): vector;
begin
  Result := initVect(n);
  for var i := 0 to n-1 do
    Result[i] :=  0;
end;

function inputVect(n: integer): vector;
begin
  Result := initVect(n);
  for var i:= 0 to n-1 do
    begin
      writeln('Введите элемент №'+ i);
      readln(Result[i]);
    end;
end;

function FillVect(n: integer; num: real): vector;
begin
  Result := initVect(n);
  for var i:= 0 to n-1 do
    Result[i] := num;
end;

function RandNumVect(n: integer; randMin: integer; randMax: integer): vector;
begin
  Result := initVect(n);
  for var i := 0 to n-1 do
    Result[i] := random(randMin, randMax);
end;

procedure OutputVect(a: vector);
begin
  var n := a.Length;
  write('( ');
  for var i:= 0 to n-2 do
      write(a[i], ', ');
  write(a[n-1]);
  write(' )');
  writeln();
end;

end.