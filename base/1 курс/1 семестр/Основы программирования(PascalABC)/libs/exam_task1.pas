unit exam_task1;

interface

  procedure task1();  

implementation

uses Compl, crt;

procedure task1();
const n = 10;
begin
  var a : array[1..n] of complex;
  writeln('[');
  for var k := 1 to n do
  begin
    a[k].re := sin(3*k + 1) * sin(3*k + 1);
    a[k].im := (-1) * cos(k *k + 2);
    writeln(a[k].re : 7 : 3, ' - i * (', a[k].im : 7 : 3, '),');
  end; 
  writeln(']');
  
  var maxC := modulC(a[1]);
  var modC: real;
  for var i := 2 to n do 
  begin
    modC := modulC(a[i]);
    maxC := max(maxC, modC);
  end;
  writeln('max = ', maxC); 
  readkey();
end;

end.