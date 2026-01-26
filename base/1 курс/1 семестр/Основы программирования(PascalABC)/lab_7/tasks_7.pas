Type Complex = record
  Re, Im: real;
end;

procedure Add(u, v: Complex; var w: Complex);
begin 
  w.Re := u.Re + v.Re;
  w.Im := u.Im + v.Im;
end;

procedure Mult(u, v: Complex; var w: Complex);
begin 
  w.Re := u.Re * v.Re - u.Im * v.Im;
  w.Im := u.Re * v.Im + u.Im * v. Re;
end;

procedure Inv(z: Complex; var w: Complex);
Var q: real;
begin 
  q := sqr(z.Re) + sqr(z.Im);
  w.Re := z.Re / q;
  w.Im := - z.Im / q;
end;

procedure Di(u, v: Complex; var w: Complex);
var z: Complex;
begin 
  Inv(v, z);
  Mult(u, z, w);
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

procedure task_7();
const n = 100;
var w, z, p: complex; i: integer;
begin
  writeln('введите z: ');
  readln(z.Re, z.Im);
  one(w);
  One(p);
  for i := 1 to n do
  begin
    writeln(p);
    Mult(p, z, p);
    Add(w, p, w);
  end;
  writeln('w = ', w);
end;

begin
  task_7();
end.
