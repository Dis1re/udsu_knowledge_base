program test;

uses crt, Compl;


procedure wait;
begin
  Writeln('Нажмите любую клавишу, чтобы продолжить...');
  ReadKey;
end;

var pass: boolean = True; inpCom: string;

begin
  while pass do
  begin
    ClrScr();
    writeln('Введите команду: ');
    writeln('1 - комплексные числа, ');
    writeln('2 - комплексные матрицы, ');
    writeln('3 - вектор, ');
    writeln('4 - комплексные вектор, ');
    writeln('0 - выход');
    readln(inpCom);
    case inpCom of 
      '1': MenuCompl();
      '2':;
      '3':;
      '4':;
      '0': pass := false
      else
      begin
        writeln('Введена неправильная команда.');
        wait;
      end;
    end;
  end;
end.