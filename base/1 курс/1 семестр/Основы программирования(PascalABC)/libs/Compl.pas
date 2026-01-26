unit Compl;

//---------------------------------------------------------------
interface

Type complex = record re, im: real; end;

function equal(u: complex): complex;

function addC(u, v: complex): complex;

function subC(u, v: complex): complex;

function multC(u, v: complex): complex;

function invC(z: complex): complex;

function divC(u, v: complex): complex;

function oneC(): complex;

function zeroC(): complex;

function modulC(z: complex): real;

/// prod(t, z)
function prodC(a:real; z: complex): complex;

function inputC(): complex;

function randNumC(randMin: integer := 0; randMax: integer := 100): complex;

procedure outputC(var z: complex);

function sinC(z:complex): complex;

function cosC(z:complex): complex;

//-----------------------------------------------------
implementation

function equal(u: complex): complex;
begin
  Result.re := u.re;
  Result.im := u.im;
end;

//(1) - функция прибавления комплексных чисел
function addC(u, v: complex): complex;
begin 
  result.re := u.re + v.re;
  result.im := u.im + v.im;
end;

//(12) - функция вычитания комлексного числа
function subC(u, v: complex): complex;
var c: complex;
begin
  c.re := -v.re;
  c.im := -v.im;
  result := addC(u, c);
end;

//(2) - функция умножения комплексных чисел
function multC(u, v: complex): complex;
begin 
  result.re := u.re * v.re - u.im * v.im;
  result.im := u.re * v.im + u.im * v. re;
end;

//(8) - функция умножения комплексного числа на обычное число
function prodC(a:real; z: complex): complex;
begin 
  result.re := a * z.re;
  result.im := a * z.im;
end;


//(3) - функция инверсии комплексного чисел
function invC(z: Complex): Complex;
Var q: real;
begin
  if (z.re = 0) and (z.im = 0) then
  begin
    result.re := real.NaN;
    result.im := real.NaN;
  end
  else
  begin
    q := sqr(z.re) + sqr(z.im);
    result.re := z.re / q;
    result.im := - z.im / q;
  end; 
end;

//(4) - функция деления комплексных чисел
function divC(u, v: complex): complex;
var z: complex;
begin 
  z := invC(v);
  result := multC(u, z);
end;

//(5) - функция зануления комплексного числа
function zeroC(): complex;
begin 
  result.re := 0;
  result.im := 0;
end;

//(6) - функция задающая значение 1 комлексному числу
function oneC(): complex;
begin 
  result.re := 1;
  result.im := 0;
end;

//(7) - функция возвращающая модуль комплексного числа
function modulC(z: complex): real;
begin 
  result := sqrt(sqr(z.re) + sqr(z.im)); 
end;

//(9) - Процедура ввода комплексного числа
function inputC(): complex;
begin
  writeln();
  writeln('Введите вещественную часть числа: ');
  readln(result.re);
  writeln('Введите мнимая часть числа: ');
  readln(result.im);
  writeln('');
end;

//(11) - процедура вывода комплексного числа
procedure outputC(var z: complex);
begin
  write(z.re, ' + ', z.im, '*i');
end;

//(10) - функция задавания рандомного комлексного числа
function randNumC(randMin: integer; randMax: integer): complex;
begin
  result.re := random(randMin, randMax);
  result.im := random(randMin, randMax);
end;

function sinC(z:complex): complex;
const eps = 0.00001;
var 
  z2, s, p: complex;
  t: real;
  k: integer;
begin
  z2 := multC(z, z);
  s := z;
  p := z;
  k := 1;
  while modulC(p) > eps do
  begin
    t := (-1)/(2*k)/(2*k+1);
    p := prodC(t, p); 
    p := multC(p, z2);
    s := addC(s, p);
    k := k + 1;
  end;
  Result := s;
end;

function cosC(z:complex): complex;
begin
  var b: complex;
  b.re := z.re + Pi/2;
  b.im := z.im;
  Result := sinC(b);
end;

end.