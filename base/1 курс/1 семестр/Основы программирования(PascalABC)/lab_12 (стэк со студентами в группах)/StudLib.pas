
uses Crt, System;

const
  MaxGroups = 100;  
  MaxNames = 100;   

type
  PersonRecord = record
    Number: integer;
    Name: string[20];
  end;

  PersonArray = array[1..MaxNames] of PersonRecord;

  GroupRecord = record
    Number: integer;
    GroupName: string[10];
    Members: PersonArray;
    MemberCount: integer;
  end;

  GroupArray = array[1..MaxGroups] of GroupRecord;

var
  Groups: GroupArray;
  GroupCount: integer;

procedure CreateMemberList(var Members: PersonArray; var MemberCount: integer);
var
  NameValue: string[20];
  k: integer;
begin
  MemberCount := 0;
  k := 0;
  while True do
  begin
    writeln('Введите фамилию (n):');
    readln(NameValue);
    if (NameValue = 'n') then Break;
    k := k + 1;
    MemberCount := k;
    Members[k].Number := k;
    Members[k].Name := NameValue;
  end;
end;

procedure CreateGroupList;
var
  GroupValue: string[10];
  k: integer;
begin
  GroupCount := 0;
  k := 0;
  while True do
  begin
    writeln('Введите номер группы (n):');
    readln(GroupValue);
    if (GroupValue = 'n') then Break;
    k := k + 1;
    GroupCount := k;
    Groups[k].Number := k;
    Groups[k].GroupName := GroupValue;
    CreateMemberList(Groups[k].Members, Groups[k].MemberCount);
  end;
end;

procedure DisplayMembers(const Members: PersonArray; MemberCount, col: integer);
var
  PosX, PosY, i: integer;
begin
  PosX := 12 * col - 7;
  PosY := 2;
  for i := 1 to MemberCount do
  begin
    PosY := PosY + 1;
    GoToXY(PosX, PosY);
    write(Members[i].Name);
  end;
end;

procedure SelectGroupMenu;
var
  n, i: integer;
begin
  for i := 1 to GroupCount do
  begin
    write(i:5, '.', Groups[i].GroupName:6);
  end;
  GoToXY(30, 22);
  writeln('Выберите номер группы:');
  GoToXY(39, 23);
  read(n);
  if (n >= 1) and (n <= GroupCount) then
  begin
    DisplayMembers(Groups[n].Members, Groups[n].MemberCount, n);
  end;
end;

procedure ReverseArray(var Members: PersonArray; MemberCount: integer);
var
  i, j: integer;
  Temp: PersonRecord;
begin
  i := 1;
  j := MemberCount;
  while i < j do
  begin
    Temp := Members[i];
    Members[i] := Members[j];
    Members[j] := Temp;
    i := i + 1;
    j := j - 1;
  end;
end;

procedure ReverseAllMembers;
var
  i: integer;
begin
  for i := 1 to GroupCount do
  begin
    ReverseArray(Groups[i].Members, Groups[i].MemberCount);
  end;
end;

procedure ReverseGroups(var Groups: GroupArray; GroupCount: integer);
var
  i, j: integer;
  Temp: GroupRecord;
begin
  i := 1;
  j := GroupCount;
  while i < j do
  begin
    Temp := Groups[i];
    Groups[i] := Groups[j];
    Groups[j] := Temp;
    i := i + 1;
    j := j - 1;
  end;
end;

procedure StackStudMenu;
var
  command: integer;
  isExit: boolean;
begin
  while not isExit do
  begin
  writeln('Введите номер комманды: ');
  writeln('1. Создать список групп');
  writeln('2. Показать список групп');
  writeln('3. Перевернуть фамилии');
  writeln('4. Перевернуть группы');
  readln(command);
  case command of
    1: 
    begin
      CreateGroupList; 
      clrscr;
    end;
    2: 
    begin 
      ClrScr; 
      SelectGroupMenu; 
      readkey;
      ClrScr; 
      end;
    3: 
    begin 
      ReverseAllMembers; 
      ClrScr; 
      end;
    4: 
    begin 
      ReverseGroups(Groups, GroupCount); 
      ClrScr; 
    end;
    5: isExit := true;
  end;    
  end;
end;

begin
  GroupCount := 0;
  StackStudMenu;
end.
