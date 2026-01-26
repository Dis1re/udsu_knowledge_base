unit TreeLib;

interface 

type TreeNode = record
  data: string;
  left: ^TreeNode;
  right: ^TreeNode;
end;

procedure printTreeDownTo(tree: ^TreeNode);
procedure printTreeUpTo(tree: ^TreeNode);
procedure printTreeLevel(tree: ^TreeNode; level: integer);
function getTreeLen(tree: ^TreeNode): integer;
procedure printTreeFull(tree:^TreeNode);
function makeTree(tree:^TreeNode): ^TreeNode;
procedure TreeMenu;

implementation
uses crt;

procedure printTreeDownTo(tree: ^TreeNode);
begin
  if tree <> nil then
  begin
    write(tree^.data, ' ');
    printTreeDownTo(tree^.left);
    printTreeDownTo(tree^.right);
  end;
end;

procedure printTreeUpTo(tree: ^TreeNode);
begin
  if tree <> nil then
  begin
    printTreeUpTo(tree^.left);
    printTreeUpTo(tree^.right);
    write(tree^.data, ' ');
  end;
end;

procedure printTreeLevel(tree: ^TreeNode; level: integer);
begin
  if tree <> nil then
    if level = 1 then write(tree^.data, ' ')
    else
    begin
      printTreeLevel(tree^.left, level-1);
      printTreeLevel(tree^.right, level-1);
    end;
end;

function getTreeLen(tree: ^TreeNode): integer;
var n1, n2: integer;
begin
  if tree = nil then
    result := 0
  else
  begin
    n1 := getTreeLen(tree^.left);
    n2 := getTreeLen(tree^.right);
    if n1 > n2 then 
      result := n1 + 1
    else
      result := n2 + 1;
  end;
end;

procedure printTreeFull(tree:^TreeNode);
begin
  var n := getTreeLen(tree);
  for var i := 1 to n do
  begin
    printTreeLevel(tree, i);
    writeln();
  end;
end;

function makeTree(tree:^TreeNode): ^TreeNode;
begin
  writeln('введите элемент: ');
  var elem:string;
  readln(elem);
  if elem <> '999' then
  begin
    new(tree);
    tree^.data := elem;
    tree^.left := makeTree(nil);
    tree^.right := makeTree(nil);
  end
  else
  begin
    tree := nil;
  end;
  result := tree;
end;

procedure TreeMenu;
  var isExit: boolean;
  command: string;
  tree: ^TreeNode;
  begin
  while not isExit do
  begin
    clrscr;
    writeln('Введите номер комманды (exit):');
    writeln(' 1) создать дерево');
    writeln(' 2) обход дерева сверху вниз');
    writeln(' 3) обход дерева снизу вверх');
    writeln(' 4) вывод уровня дерева');
    writeln(' 5) вывод всего дерева');
    readln(command);
    case command of
      '1':
      begin
        clrscr;
        tree := makeTree(nil);
        printTreeFull(tree);
        readkey();
      end;
      '2':
      begin
        clrscr;
        printTreeDownTo(tree);
        readkey();
      end;
      '3':
      begin
        clrscr;
        printTreeUpTo(tree);
        readkey();
      end;
      '4':
      begin
        clrscr;
        writeln('введите уровень дерева для вывода');
        var lvl: integer;
        readln(lvl);
        printTreeLevel(tree, lvl);
        readkey();
      end;
      '5':
      begin
        clrscr;
        printTreeFull(tree);
        readkey();
      end;
      'exit': isExit := true;
    end;
  end;
end;

end.