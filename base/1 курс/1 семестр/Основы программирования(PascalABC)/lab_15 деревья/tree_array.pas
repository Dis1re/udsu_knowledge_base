
const
  n = 11;

type
  Node = record
    ch: char;
    left, right: byte;
  end;

var
  Tree: array[1..n] of Node;

procedure WayUpDown(Next: byte);
begin
  if Next <> 0 then
  begin
    with Tree[Next] do
    begin
      write(ch, ' ');
      WayUpDown(left);
      WayUpDown(right);
    end;
  end;
end;

procedure WayDownUp(Next: byte);
begin
  if Next <> 0 then
  begin
    with Tree[Next] do
    begin
      WayDownUp(left);
      WayDownUp(right);
      write(ch, ' ');
    end;
  end;
end;

procedure WayHoriz(Next, Level: byte);
begin
  if Next <> 0 then
  begin
    with Tree[Next] do
      if Level = 1 then write(ch, ' ')
      else
      begin
        WayHoriz(left, Level - 1);
        WayHoriz(right, Level - 1); 
      end;
  end;
end;

procedure PrintTree(Next: byte; num: integer);
begin
  for var i := 1 to n do
  begin
    WayHoriz(Next, i);
    writeln();
  end;
end;


var
  n1, n2, n3, n4, n5, n6, n7: Node;

// / 
// +-
// ABCD

begin
  n1.ch := '/'; n1.left := 2; n1.right := 3;
  n2.ch := '+'; n2.left := 4; n2.right := 5;
  n3.ch := '-'; n3.left := 6; n3.right := 7;
  n4.ch := 'A'; n4.left := 0; n4.right := 0;
  n5.ch := 'B'; n5.left := 0; n5.right := 0;
  n6.ch := 'C'; n4.left := 0; n4.right := 0;
  n7.ch := 'D'; n5.left := 0; n5.right := 0;
  Tree[1] := n1;
  Tree[2] := n2;
  Tree[3] := n3;
  Tree[4] := n4;
  Tree[5] := n5;
  Tree[6] := n6;
  Tree[7] := n7;
  WayUpDown(1);
end.