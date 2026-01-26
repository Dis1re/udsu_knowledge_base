//1 лекция по основам программированию

//(1) задача. Запрограммировать функцию y = f(x),где 1)y = -1, при x <= -1 2)y = x, при 
// -1 < x < 1 3) y = 1, при x >= 1
procedure task_1();

Begin
  Var x, y: real;
  readln(x);
  if x <= -1 then y := -1
  else if x >= 1 then y := 1
  else y := x;
  writeln(y);
end.


//(2)задача. запрограммировать другую функцию y = f(x).
procedure task_2();
Begin
  Var x, y: real;
  readln(x);
  if (x <= -0.5) or (x >= 0.5) then y := 1/x
  else y := 4*x;
  writeln(y);
end.

//(3)задача. Сделать имитацию квадратной мишени 2, в которую стреляют точками
procedure task_3();
Begin
  Var x, y: real; n: integer;
  n := 0;
  readln(x, y);
  if (abs(x) <= 1) and (abs(y) <= 1) then n := 1;
  writeln(n);
end.

//(4)задача. Сделать имитацию круглой мишени с радиусом 1, в которую стреляют точками
procedure task_4();
Begin
  Var x, y: real; n: integer;
  n := 0;
  readln(x, y);
  if sqr(x) + sqr(y) <= 1 then
    if y >= 0 then n := 2
  else n := 1;
  writeln(n)
end.

//(5)задача. Сделать имитацию круглой мишени с радиусом 1, в которой есть только
// 1 и 3 четверти, и в которую стреляют точками
procedure task_5();
Begin
  Var x, y: real; n: integer;
  n := 0;
  readln(x, y);
  if sqr(x) + sqr(y) <= 1 then
    if (y >= 0) and (x >= 0)then n := 1
    else if (y <= 0) and (x <= 0)then n := 2;
  writeln(n)
end.

//Лабараторная работа, усложнённая мишень, где две окружности, где у первой есть
//только 1 и 3 четверть, а вторая окружность со сдигом в верхний правый угол,
// где причём она пересекается с 1 четвертью и на их пересечении нету мишени.
procedure task_6();
begin
  var x, y, S_circle, S_square, a, r, s, mn: real;
    n, m, i, j: integer;
  n := 10;
  a := 2;
  r := 1;
  S_circle := sqr(r) * Pi;
  S_square := sqr(a);
  s := S_circle / S_square;
  for i := 1 to 10 do
  begin
    m := 0;
    for j := 1 to n do
    begin
      x := (random()-0.5)*a;
      y := (random()-0.5)*a;
      if sqr(x) + sqr(y) <= 1 then m := m + 1;
    end;
    mn := m/n;
    writeln('m = ', m);
    writeln('n = ', n);
    writeln('m/n = ', mn);
    writeln('Sкр/Sкв = ', s);
    writeln('(m/n)/(Sкр/Sкв) = ', mn/s);
    writeln('--------------------------');
    n := n * 10;
  end;
end;

programm lab_1;
begin
end.