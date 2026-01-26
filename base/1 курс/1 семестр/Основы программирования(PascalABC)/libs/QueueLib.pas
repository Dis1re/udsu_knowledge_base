unit QueueLib;

interface

type
  QueueNode = record
    data: integer;
    next: ^QueueNode;
  end;
  
  Queue_ = record
    tail, head: ^QueueNode;
  end;
  
  procedure enQueue(var queue: Queue_; data: integer);
  procedure initQueue(var queue: Queue_);
  function getLenQueue(queue: Queue_): integer;
  procedure printQueue(queue: Queue_);
  function deQueue(var queue: Queue_): integer;
  function connectQueues(queue1: Queue_; queue2: Queue_): Queue_;
  procedure clearQueue(var queue1: Queue_);
  function reverseQueue(queue: Queue_): Queue_;
  procedure queueMenu;

implementation
uses crt;

procedure enQueue(var queue: Queue_; data: integer);
var
  newNode: ^QueueNode;
begin
  new(newNode);
  newNode^.data := data;
  newNode^.next := nil;
  queue.tail^.next := newNode;
  queue.tail := newNode;
end;

procedure initQueue(var queue: Queue_);
var
  isExit: boolean := false;
  newNode: ^QueueNode;
  value_: string;
  val: integer;
  data: integer;
begin
  new(newNode);
  writeln('Введите элемент: ');
  readln(value_);
  if value_ = 'exit' then
  begin
    isExit := true;
  end
  else
  begin
    try
      val := StrToInt(value_);
      newNode^.data := val;
    except
      on System.FormatException do
        writeln('Неверный формат ввода');
    else writeln('ошибка');
    end;
  end;
  newNode^.next := nil;
  queue.head := newNode;
  queue.tail := newNode;
  while not isExit do
  begin
    writeln('Введите элемент/exit: ');
    readln(value_);
    if value_ = 'exit' then
    begin
      isExit := true;
    end
    else
    begin
      try
        val := StrToInt(value_);
        enQueue(queue, val)
      except
        on System.FormatException do
          writeln('Неверный формат ввода');
      else writeln('ошибка');
      end;
    end;
  end;
end;

function getLenQueue(queue: Queue_): integer;
var
  node: ^QueueNode;
begin
  result := 0;
  node := Queue.head;
  while node <> nil do
  begin
    result += 1;
    node := node^.next;
  end;
end;

procedure printQueue(queue: Queue_);
var
  node: ^QueueNode;
begin
  node := queue.head;
  writeln('-queue-');
  while node <> nil do
  begin
    writeln(node^.data: 4);
    node := node^.next;
  end;
  writeln('-------');
end;

function deQueue(var queue: Queue_): integer;
begin
  if queue.head <> nil then
  begin
    result := queue.head^.data;
    queue.head := queue.head^.next;  
  end
  else
  begin
    writeln('ошибка, стек пустой');
  end;
end;

function connectQueues(queue1: Queue_; queue2: Queue_): Queue_;
begin
  queue1.tail^.next := queue2.head;
  result := queue1;
end;

procedure clearQueue(var queue1: Queue_);
begin
  queue1.head := nil;
  queue1.tail := nil;
end;

function reverseQueue(queue: Queue_): Queue_;
begin
  var n := getLenQueue(queue);
  var newQueue: Queue_;
  var node: ^QueueNode;
  var stack: array[1..100] of integer;
  node := queue.head;
  for var i := 1 to n do
  begin 
    stack[i] := node^.data;
    node:= node^.next;
  end;
  new(node);
  node^.next := nil;
  node^.data := queue.tail^.data;
  newQueue.head := node;
  newQueue.tail := node;
  for var i := n-1 downto 1 do
  begin
    enQueue(newQueue, stack[i]);
  end;
  result := newQueue;
end;

procedure queueMenu;
var
  isExit: boolean := false;
  command: string;
  elem: integer;
  queue1, queue2: Queue_;
begin
  while not isExit do
  begin
    clrscr;
    writeln('Введите номер комманды (exit):');
    writeln(' 1) Инициализировать 1-ую очередь');
    writeln(' 2) Инициализировать 2-ую очередь');
    writeln(' 3) Вывести очереди');
    writeln(' 4) Добавить элемент в 1-ую очередь');
    writeln(' 5) Извлечь элемент из 1-ой очереди');
    writeln(' 6) Cоединить две очереди');
    readln(command);
    case command of
      '1':
        begin
          clrscr;
          initQueue(queue1);
          clrscr;
          printQueue(queue1);
          readkey();
        end;
        '2':
        begin
          clrscr;
          initQueue(queue2);
          clrscr;
          printQueue(queue2);
          readkey();
       end;
       '3':
        begin
          clrscr;
          writeln('очередь 1');
          printQueue(queue1);
          writeln('очередь 2');
          printQueue(queue2);
          readkey();
       end;
      '4': 
        begin
          clrscr;
          writeln('Введите следущий элемент стека: ');
          readln(elem);
          enQueue(queue1, elem);
          printQueue(queue1);
          readkey();
        end;
      '5':
        begin
          clrscr;
          elem := deQueue(queue1);
          printQueue(queue1);
          writeln(elem);
          readkey();
        end;
      '6': 
        begin
          clrscr;
          queue1 := connectQueues(queue1, queue2);
          printQueue(queue1);
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