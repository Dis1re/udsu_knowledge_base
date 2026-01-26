uses crt;
uses system;
uses Compl;
uses Vect;
uses VectC;
uses MatrixCo;
uses StackLib;
uses QueueLib;
uses StudListsLib;
uses MarksStudLib;
uses TreeLib;
uses exam_task1;
uses exam_task2;

procedure wait();
begin
  writeln('Нажмите на любую клавишу, чтобы продолжить...');
  readkey();
  ClrScr();
end;

procedure ComplexMenu();
var command: string;
exitF: boolean := false;
begin
    while true do
  begin
    ClrScr();
    writeln('Комплексные числа(Compl)');
    writeln('введите комманду:');
    writeln('1 - суммирование');
    writeln('2 - вычитание');
    writeln('3 - умножение');
    writeln('4 - умножение на скаляр');
    writeln('5 - инвертировать число');
    writeln('6 - деление чисел');
    writeln('7 - модуль числа');
    writeln('8 - нулевое число');
    writeln('9 - единичное число');
    writeln('10 - ввести случайное число');
    writeln('11 - sinC');
    writeln('12 - cosC');
    writeln('0 - выход.');
    readln(command);
    
    case command of
      //add
      '1':
      begin
        var a, b, c: complex;
        a := inputC(); b:= inputC(); c := addC(a, b); writeln('Вывод: '); 
        outputC(c);
        wait();
      end;
      //sub
      '2': 
      begin
        var a, b, c: complex;
        a := inputC(); b:= inputC(); c := subC(a, b); writeln('Вывод: '); 
        outputC(c);
        wait();
      end;
      //mult
      '3': 
      begin
        var a, b, c: complex;
        a := inputC(); b:= inputC(); c := multC(a, b);writeln('Вывод: '); 
        outputC(c);
        wait();
      end;
      //prod
      '4': 
      begin
        var a, c: complex; var b: real;
        a := inputC(); writeln('введите натуральное число: '); readln(b); 
        c := prodC(b, a); writeln('Вывод: '); outputC(c);
        wait();
      end;
      //inv
      '5': 
      begin
        var a, c: complex;
        a := inputC(); c := invC(a);writeln('Вывод: '); outputC(c);
        wait();
      end;
      //div
      '6': 
      begin
        var a, b, c: complex;
        a := inputC(); b:= inputC(); c := divC(a, b);writeln('Вывод: '); 
        outputC(c);
        wait();
      end;
      //modul
      '7': 
      begin
        var a: complex;
        a := inputC(); var c : real := modulC(a);writeln('Вывод: '); writeln(c);
        wait();
      end;
      //zero
      '8': 
      begin
        var a: complex;
        a := zeroC();writeln('Вывод: '); outputC(a);
        wait();
      end;
      //one
      '9': 
      begin
        var a: complex;
        a := oneC(); writeln('Вывод: ');outputC(a);
        wait();
      end;
      //rand
      '10': 
      begin
        var a: complex;
        writeln('случайное число:');
        a := randNumC(); writeln('Вывод: ');outputC(a);
        wait();
      end;
      '11': 
      begin
        var a, s: complex;
        a := inputC(); s := sinC(a);writeln('Вывод: ');outputC(s);
        wait();
      end;
      '12': 
      begin
        var a, s: complex;
        a := inputC(); s := cosC(a);writeln('Вывод: ');outputC(s);
        wait();
      end;
      '0': exitF := true
      else 
        begin
          writeln('Введённой комманды нет в списке.');
          wait();
          end;
    end;
    
    if exitF then 
      break;
    
  end;
end;

procedure MatrixCMenu();
var command: string;
exitF: boolean := false;
n: integer := 2;
begin
    while true do
  begin
    ClrScr();
    writeln('Комплексные матрицы(MatrixCo)');
    writeln('введите комманду:');
    writeln('1 - суммирование матриц');
    writeln('2 - вычитание матриц');
    writeln('3 - умножение матриц');
    writeln('4 - умножение матрицы на скаляр');
    writeln('5 - норма матрицы');
    writeln('6 - нулевая матрица');
    writeln('7 - единичная матрица');
    writeln('8 - заполнить матрицу числом');
    writeln('9 - заполнить матрицу случ. компл. числом');
    writeln('0 - выход.');
    readln(command);
    
    case command of
      
      //add
      '1':
      begin
        var a, b, c: matrixC;
        a := inputMatrixC(n); b:= inputMatrixC(n); c := addMatrixC(a, b); 
        writeln('Вывод: '); outputMatrixC(c);
        wait();
      end;
      
      //sub
      '2': 
      begin
        var a, b, c: matrixC;
        a := inputMatrixC(n); b:= inputMatrixC(n); c := subMatrixC(a, b); 
        writeln('Вывод: ');outputMatrixC(c);
        wait();
      end;
      
      //mult
      '3': 
      begin
        var a, b, c: matrixC;
        a := inputMatrixC(n); b:= inputMatrixC(n); c := multMatrixC(a, b);
        writeln('Вывод: '); outputMatrixC(c);
        wait();
      end;
      
      //prod
      '4': 
      begin
        var a, c: matrixC; var t: real;
        a := inputMatrixC(n); writeln('введите натуральное число: '); readln(t);
        c := prodMatrixC(t, a);writeln('Вывод: '); outputMatrixC(c);
        wait();
      end;
      
      //modul
      '5': 
      begin
        var a: matrixC;
        a := inputMatrixC(n); var c : real := normMatrixC(a);writeln('Вывод: '); 
        writeln(c);
        wait();
      end;
      
      //zero
      '6': 
      begin
        var a: MatrixC;
        a := zeroMatrixC(n);writeln('Вывод: '); outputMatrixC(a);
        wait();
      end;
      
      //one
      '7': 
      begin
        var a: MatrixC;
        a := oneMatrixC(n); writeln('Вывод: ');outputMatrixC(a);
        wait();
      end;
      
      //fill
      '8': 
      begin
        var a: matrixC;
        writeln('случайное число:');
        var num: complex := inputC();
        a := fillMatrixC(n, num);
        writeln('Вывод: ');outputMatrixC(a);
        wait();
      end;
      
      //rand
      '9': 
      begin
        var a: matrixC;
        writeln('случайное число:');
        a := RandNumMatrixC(n); writeln('Вывод: ');outputMatrixC(a);
        wait();
      end;
      
      '0': exitF := true
      else 
        begin
          writeln('Введённой комманды нет в списке.');
          wait();
          end;
    end;
    
    if exitF then 
      break;
    
  end;
end;

procedure VectorMenu();
var command: string;
exitF: boolean := false;
n: integer := 3;
begin
    while true do
  begin
    ClrScr();
    writeln('Вектора(Vect)');
    writeln('введите комманду:');
    writeln('1 - суммирование векторов');
    writeln('2 - вычитание векторов');
    writeln('3 - векторное умножение векторов');
    writeln('4 - умножение вектора на скаляр');
    writeln('5 - скалярное умножение векторов');
    writeln('6 - смешанное умножение векторов');
    writeln('7 - модуль вектора');
    writeln('8 - нулевой вектор');
    writeln('9 - единичный вектор');
    writeln('10 - заполнить вектор');
    writeln('11 - заполнить случайный вектор');
    writeln('0 - выход.');
    readln(command);
    
    case command of 
      //add
      '1':
      begin
        var a, b, c: vector;
        a := inputVect(n); b := inputVect(n); c := addVect(a, b); 
        writeln('Вывод: ');outputVect(c);
        wait;
      end;
      
      //sub
      '2':
      begin
        var a, b, c: vector;
        a := inputVect(n); b := inputVect(n); c := subVect(a, b); 
        writeln('Вывод: '); outputVect(c);
        wait;
      end;
      
      //vectMult
      '3':
      begin
        var a, b, c: vector;
        a := inputVect(n); b := inputVect(n); c := vectMult(a, b); 
        writeln('Вывод: '); outputVect(c);
        wait;
      end;
      
      //prodMult
      '4':
      begin
        var a, c: vector;
        var t: real;
        a := inputVect(n); writeln('Введите число'); readln(t); 
        c := prodVect(t, a); writeln('Вывод: '); outputVect(c);
        wait;
      end;
      
      //scalMultVect
      '5':
      begin
        var a, b: vector;
        var c: real;
        a := inputVect(n); b := inputVect(n); c := scalMultVect(a, b);
        writeln('Вывод: '); writeln(c);
        wait;
      end;
      
      //mixMultVect
      '6':
      begin
        var a, b, c: vector;
        var d: real;
        a := inputVect(n); b := inputVect(n); c := inputVect(n); 
        d := mixMultVect(a, b, c); writeln('Вывод: '); writeln(d);
        wait;
      end;
      
      //modulVect
      '7':
      begin
        var a: vector;
        var c: real;
        a := inputVect(n); c := modulVect(a); writeln('Вывод: '); writeln(c);
        wait;
      end;
      
      //zeroVect
      '8':
      begin
        var a: vector;
        a := zeroVect(n); writeln('Вывод: '); outputVect(a);
        wait;
      end;
      
      //oneVect
      '9':
      begin
        var a: vector;
        a := oneVect(n); writeln('Вывод: '); outputVect(a);
        wait;
      end;
      
      //fillVect
      '10':
      begin
        var a, c: vector;
        var t: real;
        writeln('введите число: ');readln(t); a := fillVect(n, t); 
        writeln('Вывод: '); outputVect(a);
        wait;
      end;
      
      //randNumVect
      '11':
      begin
        var a: vector;
        a := randNumVect(n); writeln('Вывод: '); outputVect(a);
        wait;
      end;
      
      '0': exitF := true
      else 
        begin
          writeln('Введённой комманды нет в списке.');
          wait();
          end;
    end;
    
    if exitF then 
      break;
    
    end;
end;

procedure VectorCMenu();
var command: string;
exitF: boolean := false;
n: integer := 3;
begin
    while true do
  begin
    ClrScr();
    writeln('Вектора(VectC)');
    writeln('введите комманду:');
    writeln('1 - суммирование векторов');
    writeln('2 - вычитание векторов');
    writeln('3 - векторное умножение векторов');
    writeln('4 - умножение вектора на скаляр');
    writeln('5 - скалярное умножение векторов');
    writeln('6 - смешанное умножение векторов');
    writeln('7 - модуль вектора');
    writeln('8 - нулевой вектор');
    writeln('9 - единичный вектор');
    writeln('10 - заполнить вектор');
    writeln('11 - заполнить случайный вектор');
    writeln('0 - выход.');
    readln(command);
    
    case command of 
      //addC
      '1':
      begin
        var a, b, c: vectorC;
        a := inputVectC(n); b := inputVectC(n); c := addVectC(a, b); 
        writeln('Вывод: ');outputVectC(c);
        wait;
      end;
      
      //subC
      '2':
      begin
        var a, b, c: vectorC;
        a := inputVectC(n); b := inputVectC(n); c := subVectC(a, b); 
        writeln('Вывод: '); outputVectC(c);
        wait;
      end;
      
      //vectMultC
      '3':
      begin
        var a, b, c: vectorC;
        a := inputVectC(n); b := inputVectC(n); c := vectMultC(a, b); 
        writeln('Вывод: '); outputVectC(c);
        wait;
      end;
      
      //prodMultC
      '4':
      begin
        var a, c: vectorC;
        var t: real;
        a := inputVectC(n); writeln('Введите число'); readln(t); 
        c := prodVectC(t, a); writeln('Вывод: '); outputVectC(c);
        wait;
      end;
      
      //scalMultVectC
      '5':
      begin
        var a, b: vectorC;
        var c: complex;
        a := inputVectC(n); b := inputVectC(n); c := scalMultVectC(a, b);
        writeln('Вывод: '); writeln(c);
        wait;
      end;
      
      //mixMultVectC
      '6':
      begin
        var a, b, c: vectorC;
        var d: complex;
        a := inputVectC(n); b := inputVectC(n); c := inputVectC(n); 
        d := mixMultVectC(a, b, c); writeln('Вывод: '); writeln(d);
        wait;
      end;
      
      //modulVectC
      '7':
      begin
        var a: vectorC;
        var c: real;
        a := inputVectC(n); c := modulVectC(a); writeln('Вывод: '); writeln(c);
        wait;
      end;
      
      //zeroVectC
      '8':
      begin
        var a: vectorC;
        a := zeroVectC(n); writeln('Вывод: '); outputVectC(a);
        wait;
      end;
      
      //oneVectC
      '9':
      begin
        var a: vectorC;
        a := oneVectC(n); writeln('Вывод: '); outputVectC(a);
        wait;
      end;
      
      //fillVectC
      '10':
      begin
        var a, c: vectorC;
        var t: complex;
        writeln('введите компл. число: '); t := inputC(); a := fillVectC(n, t); 
        writeln('Вывод: '); outputVectC(a);
        wait;
      end;
      
      //randNumVectC
      '11':
      begin
        var a: vectorC;
        a := randNumVectC(n); writeln('Вывод: '); outputVectC(a);
        wait;
      end;
      
      '0': exitF := true
      else 
        begin
          writeln('Введённой комманды нет в списке.');
          wait();
          end;
    end;
    
    if exitF then 
      break;
    
    end;
end;

var command: string;
  exitF: boolean := false;
begin
  while true do
  begin
    ClrScr();
    writeln('введите комманду:');
    writeln('1 - комплексные числа(Compl)');
    writeln('2 - комплексные матрицы(MatrixCo)');
    writeln('3 - вектора(Vect)');
    writeln('4 - комплексные вектора(VectC)');
    writeln('5 - стек');
    writeln('6 - очереди');
    writeln('7 - списки студентов');
    writeln('8 - дневник студентов');
    writeln('9 - бинарные деревья');
    writeln('10 - первая задача с экзамена');
    writeln('11 - вторая задача с экзамена');
    writeln('0 - выход.');
    readln(command);
    
    case command of
      '1': ComplexMenu();
      '2': MatrixCMenu();
      '3': VectorMenu();
      '4': VectorCMenu();
      '5': StackMenu();
      '6': QueueMenu();
      '7': StudListsMenu();
      '8': MarksStudMenu();
      '9': TreeMenu();
      '10': task1;
      '11': task2;
      '0': exitF := true;
      else writeln('Введённой комманды нет в списке.')
    end;
    
    if exitF then 
      break;
    
  end;
end.