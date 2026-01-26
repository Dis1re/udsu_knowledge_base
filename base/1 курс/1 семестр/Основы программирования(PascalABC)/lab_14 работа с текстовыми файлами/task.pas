uses crt;

procedure MakeAndAddText;
var
  ch: char;
  Ok: boolean;
  TextName: string[12];
  Name: string[10];
  Mark: string[3];
  StudentText: Text;
begin
  clrscr;
  Ok := true;
  writeln('Введите имя файла');
  readln(TextName);
  assign(StudentText, TextName);
  {$I-} append(StudentText);
    {$I+}
  if not FileExists(TextName) then
    rewrite(StudentText);
  while Ok do
  begin
    writeln('будете ещё вводить? y/n');
    readln(ch);
    if ch = 'n' then
    begin
      Ok := false;
      close(StudentText);
    end
    else
      begin
      writeln('Введите имя студента');
      readln(Name);
      writeln('Введите оценки студента');
      readln(Mark);
      write(StudentText, Name: 10, Mark: 3);
    end;
  end;
end;

procedure ViewText;
var
  k: integer;
  ch: char;
  Name: string[10];
  TextName: string[12];
  Mark: string[3];
  StudentText: Text;
begin
  clrscr;
  k := 3;
  writeln('Введите имя файла');
  readln(TextName);
  assign(StudentText, TextName);
  {$I-} reset(StudentText);
    {$I+}
  if not FileExists(TextName) then
    writeln('такого файла нет')
    else
  begin
    while not Eof(StudentText) do
    begin
      k := k + 1;
      read(StudentText, Name, Mark);
      GoToXY(1, k);
      write(Name);
      GoToXY(12, k);
      write(Mark);
    end;
    close(StudentText);
  end;
  readkey();
end;


procedure BadBoys(Exam: byte);
var
  k: byte;
  ch: char;
  Name: string[10];
  TextName: string[12];
  Mark: string[3];
  StudentText: Text;
begin
  clrscr;
  k := 3;
  writeln('Введите имя файла');
  readln(TextName);
  assign(StudentText, TextName);
  {$I-} reset(StudentText);
    {$I+}
  if not FileExists(TextName) then
    writeln('такого файла нет')
    else
  begin
    while not Eof(StudentText) do
    begin
      read(StudentText, Name, Mark);
      if Mark[Exam] = '2' then
      begin
        k := k + 1;
        GoToXY(1, k);
        write(Name);
      end;
    end;
    writeln();
  end;
end;

begin
  MakeAndAddText;
end.