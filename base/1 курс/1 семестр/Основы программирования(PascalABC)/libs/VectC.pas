unit VectC;

//---------------------------------------------------------------
interface

uses Compl;

type vectorC = array of complex;

function initVectC(n: integer): vectorC;

function addVectC(a, b: vectorC): vectorC;

function subVectC(a, b: vectorC): vectorC;

function vectMultC(a, b: vectorC): vectorC;

function prodVectC(t: real; a: vectorC): vectorC;

function scalMultVectC(a, b: vectorC): complex;

function mixMultVectC(a, b, c: vectorC): complex;

function modulVectC(a: vectorC): real;

function oneVectC(n: integer): vectorC;

function zeroVectC(n: integer): vectorC;

function inputVectC(n: integer): vectorC;

function RandNumVectC(n: integer; randMin: integer := 0;
                        randMax: integer := 100): vectorC;

function fillVectC(n: integer; numC: complex): vectorC;

procedure outputVectC(a: vectorC);

//----------------------------------------------------------
implementation

function initVectC(n: integer): vectorC;
begin
  Result := new complex[n];
end;

function addVectC(a, b: vectorC): vectorC;
begin
  var n := a.Length;
  Result := initVectC(n);
  for var i := 0 to n-1 do
    Result[i] := addC(a[i], b[i]);
end;

function subVectC(a, b: vectorC): vectorC;
begin
  var n := a.Length;
  Result := initVectC(n);
  for var i:= 0 to n-1 do
    Result[i] := subC(a[i], b[i]);
end;

function vectMultC(a, b: vectorC): vectorC;
begin
  var n := a.Length;
  Result := initVectC(n);
  Result[0] := subC(multC(a[1], b[2]), multC(a[2], b[1]));
  Result[1] := subC(multC(a[2], b[0]), multC(a[0], b[2]));
  Result[2] := subC(multC(a[0],  b[1]), multC(a[1], b[0]));
end;

function scalMultVectC(a, b: vectorC): complex;
begin
  var n := a.Length;
  var s: complex := zeroC();
  for var i := 0 to n-1 do
    s := addC(s, multC(a[i],b[i]));
  Result := s;
end;

function mixMultVectC(a, b, c: vectorC): complex;
begin
  var n: integer := a.Length;
  var d: vectorC := initVectC(n);
  d := vectMultC(a, b);
  Result := ScalMultVectC(d, c);
end;

function modulVectC(a: vectorC): real;
begin
  Result := modulC(ScalMultVectC(a, a));
end;

function prodVectC(t: real; a: vectorC): vectorC;
begin
  var n := a.Length;
  Result := initVectC(n);
  for var i := 0 to n-1 do
    Result[i] := prodC(t, a[i]);
end;


function OneVectC(n: integer): vectorC;
begin
  Result := initVectC(n);
  Result[0] := oneC();
  for var i := 1 to n-1 do
    Result[i] := zeroC();
end;

function ZeroVectC(n: integer): vectorC;
begin
  Result := initVectC(n);
  for var i := 0 to n-1 do
    Result[i] :=  zeroC();
end;

function inputVectC(n: integer): vectorC;
begin
  Result := initVectC(n);
  for var i:= 0 to n-1 do
    begin
      writeln('Введите элемент №'+ i);
      Result[i] := inputC();
    end;
end;

function FillVectC(n: integer; numC: complex): vectorC;
begin
  Result := initVectC(n);
  for var i:= 0 to n-1 do
    Result[i] := numC;
end;

function RandNumVectC(n: integer; randMin: integer; randMax: integer): vectorC;
begin
  Result := initVectC(n);
  for var i := 0 to n-1 do
    Result[i] := randNumC(randMin, randMax);
end;

procedure OutputVectC(a: vectorC);
begin
  var n := a.Length;
  write('( ');
  for var i:= 0 to n-2 do
    begin
      outputC(a[i]);
      write(', ');
    end;
  outputC(a[n-1]);
  write(' )');
  writeln();
end;

end.