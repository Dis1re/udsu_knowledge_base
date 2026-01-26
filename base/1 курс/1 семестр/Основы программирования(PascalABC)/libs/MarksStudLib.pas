unit MarksStudLib;

interface

procedure CreateFile;
procedure DisplayFile;
procedure AppendToFile;
procedure CreateAndAppendText;
procedure DisplayText;
procedure FindStudentsWithPoorGrades(examIndex: Integer);
procedure FixStudentMark;
procedure DeleteStudent;
procedure DeleteStudentsWithPoorGrades(minimumTwos: Integer);
procedure MarksStudMenu;

implementation

uses Crt;

type
  TStudent = record
    Name: string[10];
    Mark: string[3];
  end;

var
  Mode: integer;

procedure CreateFile;
var
  continueInput: char;
  isInputActive: boolean;
  fileName: string[12];
  studentFile: file of TStudent;
  currentStudent: TStudent;
begin
  ClrScr; 
  isInputActive := True;
  writeln('Введите имя файла:');
  readln(fileName);
  assign(studentFile, fileName);
  rewrite(studentFile);
  
  while isInputActive do
  begin
    GoTOXY(30, 10);
    writeln('Будете еще вводить? (y/n)');
    GoToXY(30, 11); 
    readln(continueInput);
    GoToXY(30, 11); 
    Clrscr;
    
    if continueInput = 'n' then
    begin
      isInputActive := False;
      close(studentFile);
    end
    else
    begin
      GoToXY(30, 20);
      writeln('Введите фамилию студента:');
      GoToXY(30, 21); 
      readln(currentStudent.Name);
      ClrScr;
      GoToXY(30, 22);
      writeln('Введите его оценки:');
      GoToXY(30, 23); 
      readln(currentStudent.Mark);
      ClrScr;
      write(studentFile, currentStudent);
    end;
  end;
end;

procedure DisplayFile;
var
  lineNumber: integer;
  fileName: string[12];
  studentFile: file of TStudent;
  currentStudent: TStudent;
begin
  ClrScr; 
  lineNumber := 3;
  writeln('Введите имя файла:');
  readln(fileName);
  assign(studentFile, fileName);
  reset(studentFile);
  
  while not EOF(studentFile) do
  begin
    read(studentFile, currentStudent);
    GoToXY(1, lineNumber); 
    writeln(currentStudent.Name);
    GoToXY(11, lineNumber); 
    writeln(currentStudent.Mark);
    inc(lineNumber);
  end;
  close(studentFile);
end;

procedure AppendToFile;
var
  continueInput: char;
  isInputActive: boolean;
  fileName, tempFileName: string[12];
  studentFile, tempFile: file of TStudent;
  currentStudent: TStudent;
begin
  ClrScr; 
  isInputActive := True;
  writeln('Введите имя файла:');
  readln(fileName);
  assign(studentFile, fileName);
  reset(studentFile);
  tempFileName := 'temp.dat';
  assign(tempFile, tempFileName);
  rewrite(tempFile);

  while not EOF(studentFile) do
  begin
    read(studentFile, currentStudent);
    write(tempFile, currentStudent);
  end;

  while isInputActive do
  begin
    GoToXY(30, 10); 
    writeln('Будете еще вводить? (y/n)');
    GoToXY(30, 11); 
    readln(continueInput);
    ClrScr;
    
    if continueInput = 'n' then
    begin
      isInputActive := false;
      close(tempFile);
    end
    else
    begin
      GoToXY(30, 20);
      writeln('Введите фамилию студента:');
      GoToXY(30, 21); 
      readln(currentStudent.Name);
      ClrScr;
      GoToXY(30, 22);
      writeln('Введите его оценки:');
      GoToXY(30, 23); 
      readln(currentStudent.Mark);
      write(tempFile, currentStudent);
    end;
  end;

  close(studentFile);
  erase(studentFile);
  rename(tempFile, fileName);
end;

procedure CreateAndAppendText;
var
  continueInput: char;
  isInputActive: boolean;
  textName: string[12];
  studentName: string[10];
  studentMark: string[3];
  studentText: Text;
begin
  ClrScr; 
  isInputActive := True;
  writeln('Введите имя файла:');
  readln(textName);
  assign(studentText, textName);
  {$I-} append(studentText); {$I+}
  if not FileExists(textName) then
    rewrite(studentText);

  while isInputActive do
  begin
    GoToXY(30, 10); 
    writeln('Будете еще вводить? (y/n)');
    GoToXY(30, 11); 
    readln(continueInput);
    ClrScr;
    
    if continueInput = 'n' then
    begin
      isInputActive := False;
      close(studentText);
    end
    else
    begin
      GoToXY(30, 20);
      writeln('Введите фамилию студента:');
      GoToXY(30, 21); 
      readln(studentName);
      ClrScr;
      GoToXY(30, 22);
      writeln('Введите его оценки:');
      GoToXY(30, 23); 
      readln(studentMark);
      writeln(studentText, studentName:10, studentMark:3);
    end;
  end;
end;

procedure DisplayText;
var
  lineNumber: integer;
  textName: string[12];
  studentName: string[10];
  studentMark: string[3];
  studentText: Text;
begin
  ClrScr; 
  lineNumber := 3;
  writeln('Введите имя файла:');
  readln(textName);
  assign(studentText, textName);
  {$I-} reset(studentText); {$I+}
  if not FileExists(textName) then
    writeln('Файл ', textName, ' не найден')
  else
  begin
    while not EOF(studentText) do
    begin
      read(studentText, studentName, studentMark);
      GoToXY(1, lineNumber); 
      write(studentName);
      GoToXY(12, lineNumber); 
      writeln(studentMark);
      inc(lineNumber);
    end;
    close(studentText);
  end;
end;

procedure FindStudentsWithPoorGrades(examIndex: Integer);
var
  studentFile: file of TStudent;
  currentStudent: TStudent;
  fileName: string[12];
begin
  writeln('Введите имя файла:');
  readln(fileName);
  assign(studentFile, fileName);
  reset(studentFile);

  writeln('Студенты с двойками по экзамену №', examIndex, ':');
  while not EOF(studentFile) do
  begin
    read(studentFile, currentStudent);
    if (currentStudent.Mark[examIndex] = '2') then
      writeln(currentStudent.Name);
  end;
  close(studentFile);
end;

procedure FixStudentMark;
var
  fileName, tempFileName, studentNameToFix: string[12];
  studentFile, tempFile: file of TStudent;
  currentStudent: TStudent;
  newMark: string[3];
begin
  ClrScr;
  writeln('Введите имя файла:');
  readln(fileName);
  assign(studentFile, fileName);
  reset(studentFile);
  tempFileName := 'temp.dat';
  assign(tempFile, tempFileName);
  rewrite(tempFile);

  writeln('Введите фамилию студента, чью оценку хотите исправить:');
  readln(studentNameToFix);

  while not EOF(studentFile) do
  begin
    read(studentFile, currentStudent);
    if currentStudent.Name = studentNameToFix then
    begin
      writeln('Текущая оценка: ', currentStudent.Mark);
      writeln('Введите новую оценку: ');
      readln(newMark);
      currentStudent.Mark := newMark;
    end;
    write(tempFile, currentStudent);
  end;

  close(studentFile);
  close(tempFile);
  erase(studentFile);
  rename(tempFile, fileName);
  writeln('Оценка изменена.');
end;

procedure DeleteStudent;
var
  fileName, tempFileName, studentNameToDelete: string[12];
  studentFile, tempFile: file of TStudent;
  currentStudent: TStudent;
begin
  ClrScr;
  writeln('Введите имя файла:');
  readln(fileName);
  assign(studentFile, fileName);
  reset(studentFile);
  tempFileName := 'temp.dat';
  assign(tempFile, tempFileName);
  rewrite(tempFile);

  writeln('Введите фамилию студента, которого хотите удалить:');
  readln(studentNameToDelete);

  while not EOF(studentFile) do
  begin
    read(studentFile, currentStudent);
    if currentStudent.Name <> studentNameToDelete then
      write(tempFile, currentStudent);
  end;

  close(studentFile);
  close(tempFile);
  erase(studentFile);
  rename(tempFile, fileName);
  writeln('Студент удален.');
end;

procedure DeleteStudentsWithPoorGrades(minimumTwos: Integer);
var
  studentFile, tempFile: file of TStudent;
  currentStudent: TStudent;
  fileName, tempFileName: string[12];
  i, twoCount: Integer;
begin
  writeln('Введите имя файла:');
  readln(fileName);
  assign(studentFile, fileName);
  reset(studentFile);
  tempFileName := 'temp.dat';
  assign(tempFile, tempFileName);
  rewrite(tempFile);

  while not EOF(studentFile) do
  begin
    read(studentFile, currentStudent);
    twoCount := 0;
    for i := 1 to 3 do
      if currentStudent.Mark[i] = '2' then
        inc(twoCount);

    if twoCount < minimumTwos then
      write(tempFile, currentStudent);
  end;

  close(studentFile);
  close(tempFile);
  erase(studentFile);
  rename(tempFile, fileName);
  writeln('Удаление студентов с >= ', minimumTwos, ' двойками завершено.');
end;

procedure MarksStudMenu;
begin
  var isExit := false;
  while not isExit do
  begin
    ClrScr;
  writeln('Выберите режим работы:');
  writeln('1 - Создать новый файл');
  writeln('2 - Просмотр файла');
  writeln('3 - Добавление данных в файл');
  writeln('4 - Создание/добавление данных в текстовый файл');
  writeln('5 - Просмотр текстового файла');
  writeln('6 - Найти студентов с двойками по определенному экзамену');
  writeln('7 - Исправить оценку студента');
  writeln('8 - Удалить студента');
  writeln('9 - Удалить студентов с >= 2 двойками');
  writeln('10 - выход');
  readln(Mode);

  case Mode of
    1: CreateFile;
    2: DisplayFile;
    3: AppendToFile;
    4: CreateAndAppendText;
    5: DisplayText;
    6: FindStudentsWithPoorGrades(1);
    7: FixStudentMark;
    8: DeleteStudent;
    9: DeleteStudentsWithPoorGrades(2);
    10: isExit := true;
  else
    writeln('Неверный режим.');
  end;
  end;
  
end;

end.
