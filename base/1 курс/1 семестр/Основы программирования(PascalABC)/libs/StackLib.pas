unit StackLib;

interface

type
  StackNode = record
    data: integer;
    next: ^StackNode;
  end; 
  
  procedure addToStack(var stack: ^StackNode; elem: integer);
  function getStackLen(stack: ^StackNode): integer;
  procedure printStack(head: ^StackNode);
  function popStack(var stack: ^StackNode): integer;
  function connectStacks(stack1, stack2: ^StackNode): ^StackNode;
  procedure reverseStack(var stack: ^StackNode);
  procedure clearStack(var stack1: ^StackNode);
  procedure StackMenu;
  
implementation
uses crt;

procedure addToStack(var stack: ^StackNode; elem: integer);
var
  newNode: ^StackNode;
begin
  new(newNode);
  newNode^.data := elem;
  newNode^.next := stack;
  stack := newNode;
end;

function getStackLen(stack: ^StackNode): integer;
var
  n: integer := 0;
  node: ^StackNode;
begin
  node := stack;
  while node <> nil do
    n += 1;
  result := n;
end;

procedure printStack(head: ^StackNode);
var
  node: ^StackNode;
begin
  node := head;
  writeln('-stack-');
  while node <> nil do
  begin
    writeln(node^.data: 4);
    node := node^.next;
  end;
  writeln('-------');
end;

function popStack(var stack: ^StackNode): integer;
begin
  if stack <> nil then
  begin
  result := stack^.data;
  stack := stack^.next;  
  end;
end;

function connectStacks(stack1, stack2: ^StackNode): ^StackNode;
var
  node: ^StackNode;
begin
  node := stack2;
  if node <> nil then
  begin
    while node^.next <> nil do
      node := node^.next;
    node^.next := stack1;
    result := stack2;  
  end
  else
    writeln('второй стэк - пустой');
end;

procedure reverseStack(var stack: ^StackNode);
var
  node: ^StackNode;
  reversedStack: ^StackNode := nil;
begin
  node := stack;
  while node <> nil do
  begin
    addToStack(reversedStack, node^.data);
    node := node^.next;
  end;
  stack := reversedStack;
end;

procedure clearStack(var stack1: ^StackNode);
begin
  stack1 := nil;
end;

procedure StackMenu;
var
  isExit: boolean := false;
  command: string;
  elem: integer;
  stack1, stack2: ^StackNode;
begin
  while not isExit do
  begin
    clrscr;
    writeln('Введите номер комманды (exit):');
    writeln(' 1) создать 1-ый стек');
    writeln(' 2) создать 2-ой стек');
    writeln(' 3) показать стеки');
    writeln(' 4) очистить 1-ый стек');
    writeln(' 5) очистить 2-ой стек');
    writeln(' 6) Добавить элемент в 1-ый стек');
    writeln(' 7) Добавить элемент в 2-ой стек');
    writeln(' 8) Извлечь элемент из первого стека');
    writeln(' 9) Извлечь элемент из второго стека');
    writeln(' 10) Cоединить два стека');
    writeln(' 11) Перевернуть 1-ый стек');
    readln(command);
    case command of
      '1': 
      begin
        clrscr;
        stack1 := nil;
        var input: integer;
        while true do
        begin
          writeln('Введите элемент стека (999 - выход):');
          readln(input);
          if input = 999 then break;
          addToStack(stack1,  input);
        end;
        clrscr;
        printStack(stack1);
        readkey();
      end;
      '2': 
      begin
        clrscr;
        stack2 := nil;
        var input: integer;
        while true do
        begin
          writeln('Введите элемент стека (999 - выход):');
          readln(input);
          if input = 999 then break;
          addToStack(stack2,  input);
        end;
        clrscr;
        printStack(stack2);
        readkey();
      end;
      '3': 
      begin
        clrscr;
        writeln('Стек 1');
        printStack(stack1);
        writeln('Стек 2');
        printStack(stack2);
        readkey();
      end;
      '4': 
        begin
          clrscr;
          stack1 := nil;
          writeln('Первый стек очищен.');
          readkey();
        end;
        '5': 
        begin
          clrscr;
          stack2 := nil;
          writeln('Второй стек очищен.');
          readkey();
        end;
      '6': 
        begin
          clrscr;
          printStack(stack1);
          writeln('Введите следущий элемент стека: ');
          readln(elem);
          addToStack(stack1, elem);
          printStack(stack1);
          readkey();
        end;
        '7': 
        begin
          clrscr;
          printStack(stack2);
          writeln('Введите следущий элемент стека: ');
          readln(elem);
          addToStack(stack2, elem);
          printStack(stack2);
          readkey();
        end;
      '8':
        begin
          clrscr;
          printStack(stack1);
          elem := popStack(stack1);
          printStack(stack1);
          writeln(elem);
          readkey();
        end;
        '9':
        begin
          clrscr;
          printStack(stack2);
          elem := popStack(stack2);
          printStack(stack2);
          writeln(elem);
          readkey();
        end;
      '10': 
        begin
          clrscr;
          writeln('стек 1');
          writeln('стек 2');
          stack1 := connectStacks(stack1, stack2);
          printStack(stack1);
          readkey();
        end;
        '11': 
        begin
          clrscr;
          reverseStack(stack1);
          printStack(stack1);
          readkey();
        end;
      'exit': isExit := true
    else 
      begin
        writeln('Введена неверная комманда.');
        readkey();
      end;
    end;
  end;
end;

end.