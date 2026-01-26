uses crt;

Type Student = record
  Name: string[10];
  Mark: string[10]
end;

Var Mode: integer;

procedure MakeFile;
Var 
  ch: char;
  Ok: boolean;
  FileName: string[12];
  StudentFile: file of Student;
  FlowStudent: Student;
begin
  ClrScr;
  Ok := true;
  writeln('Дайте имя файлу');
  readln(FileName);
  assign(StudentFile, FileName);
  rewrite(StudentFile);
  with FlowStudent do
    While Ok do
    begin
      GoToXY(30, 10);
      writeln('Будете ещё вводить? y/n');
      GoToXY(30, 11);
      readln(ch);
      GoToXY(30, 11);
      ClearLine;
      if ch = 'n' then
      begin
        ok := false;
        close(StudentFile)
      end
      else
      begin
        GoToXY(30, 20);
        ClearLine;
        writeln('Введите фамилию студента');
        GoToXY(30, 21);
        readln(Name);
        GoToXY(30, 22);
        ClearLine;
        writeln('Введите его оценки');
        GoToXY(30, 23);
        readln(Mark);
        write(StudentFile, FlowStudent);
      end;
    end;
end;

procedure ViewFile;
Var 
  k: integer;
  ch: char;
  FileName: string[12];
  StudentFile: file of Student;
  FlowStudent: Student;
begin
  ClrScr;
  k := 3;
  writeln('Введите файл');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);
  with FlowStudent do
    while not EOF(StudentFile) do
    begin
      k := k + 1;
      read(StudentFile, FlowStudent);
      GoToXY(1, k);
      writeln(Name);
      GoToXY(11, k);
      writeln(mark);
    end;
    close(StudentFile);
    readkey();
end;

procedure AddFile;
var
  ch: char;
  Ok: boolean;
  FileName, NewName: string[12];
  StudentFile, NewFile: file of Student;
  FlowStudent: Student;
begin
  ClrScr;
  Ok := true;
  writeln('Введите имя файла');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);
  NewName := 'aaaaa';
  assign(NewFile, NewName);
  while not EOF(StudentFile) do
  begin
    read(StudentFile, FlowStudent);
    write(NewFile, FlowStudent);
  end;
  with FlowStudent do
    while Ok do
    begin
      GoToXY(30, 10);
      writeln('Будете ещё вводить? y/n');
      GoToXY(30, 11);
      readln(ch);
      if ch = 'n' then
      begin
        Ok := false;
        close(NewFile);
      end
      else
      begin
        GoToXY(30, 20);
        writeln('Введите фамилию студента');
        GoToXY(30, 21);
        readln(Name);
        GoToXY(30, 22);
        writeln('Введите его оценки');
        GoToXY(30, 23);
        readln(Mark);
        write(NewFile, FlowStudent);
      end;
    end;
    close(StudentFile);
    erase(StudentFile);
    rename(NewFile, FileName);
end;

begin
  MakeFile;
  ViewFile;
  AddFile;
  ViewFile;
end.