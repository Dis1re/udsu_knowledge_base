uses crt;

type 
  StackVertic = record
    Number: integer;
    Name: string[20];
    Next: ^StackVertic
  end;
  
  StackHoriz = record
    Number: integer;
    Group: string[10];
    Head: ^StackVertic;
    Next:^StackHoriz 
  end;
  
var Horiz: ^StackHoriz;

procedure MakeMenuVertic(Vertic: ^StackVertic);
var   
  Ok: boolean;
  NameValue: string[20];
  k: integer;
  Top: ^StackVertic;
begin
  Ok := true;
  Vertic := nil;
  k := 0;
  while Ok do
  begin
    writeln('введите фамилию студента: ');
    readln(NameValue);
    k := k + 1;
    if (NameValue = 'n') or (NameValue = 'N') then
      Ok := false
    else
    begin
      new(Top);
      Top^.Next := Vertic;
      Top^.Number := k;
      Top^.Name := NameValue;
      Vertic := Top;
    end;
  end;
end;


procedure MakeMenuHoriz;
var
  Vertic: ^StackVertic;
  Top: ^StackHoriz;
  GroupValue: string[10];
  Ok: boolean;
  k: integer;
begin
  Ok := true;
  Horiz := nil;
  k := 0;
  while Ok do
  begin
    writeln('номер группы: ');
    readln(GroupValue);
    k += 1;
    if (GroupValue = 'n') or (GroupValue = 'N') then
      Ok := false
    else
    begin
      new(Top);
      Top^.Next := Horiz;
      Top^.Number := k;
      Top^.Group := GroupValue;
      MakeMenuVertic(Vertic);
      Top^.Head := Vertic;
      Horiz := Top;
    end;
  end;
end;

procedure PutMenuVertic(Vertic: ^StackVertic; n: integer);
var
  Top: ^StackVertic;
  PosX, PosY: integer;
begin
  Top := Vertic;
  PosX := 12*n-7;
  PosY := 2;
  while Top <> nil do
  begin
    PosY := PosX + 1;
    GoToXY(PosX, PosY);
    write(Top^.Name);
    Top := Top^.Next;
  end;
end;


procedure ChoicMenuHoriz;
var 
  Top: ^StackHoriz;
  n, k: integer;
begin
  Top := Horiz;
  while Top <> nil do
  begin
    n := n + 1;
    write(n:5, '.', Top^.Group:6);
    Top := Top^.next;
  end;
  GoToXY(30, 22);
  writeln('Выберите пункт меню: ');
  GoToXY(39, 23);
  read(n);
  Top := Horiz;
  k := Horiz^.Number + 1;
  while Top^.Number + n <> k do
    Top := Top^.next;
  PutMenuVertic(Top^.Head, n);
end;

begin
  MakeMenuHoriz;
  ChoicMenuHoriz;
end.
