
const n = 10;

var arr: array[1..n] of integer;
begin
  for var i := 1 to n do
  begin
    var num := random(1, 100);
    arr[i] := num;
    write(num, ', ');
  end;
  writeln();
  
  for var i := 1 to n - 1 do
    for var j := 1 to n - i do
    begin
      if arr[j] > arr[j + 1] then
      begin  
        var b := arr[j + 1];
        arr[j + 1] := arr[j];
        arr[j] := b;
      end;
    end;
  
  for var i := 1 to n do
  begin
    write(arr[i], ', ');
  end;  
    
end.