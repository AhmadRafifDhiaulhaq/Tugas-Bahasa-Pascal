program Doublelinkedlist;
uses CRT;
Type
    DLList=^data;
        data=record
            info:integer;
            next,prev:DLList;
        end;
    List=DLList;
    Node=DLList;

var L:list;
    pilih:char;
    ElmIn:integer;

Procedure CreateList (Var L:List);
begin
    L:=nil;
end;

Procedure InsertFirst (Var L:List;Elm:integer);
var
  P:Node;
begin
    New(P);
    P^.info:=Elm;
    if (L<>nil) then
    begin
        L^.Prev:=P;
        P^.next:=L;
    end;
    L:=P;
end;

Procedure InsertLast (Var L:List;elm:integer);
Var P,Pt : Node;
begin
    New (P);
    P^.info := elm;
  if (L=Nil) then
  Begin
     L:=P;
  end
  else
  begin
    Pt:=L;
    while Pt^.next <> nil do
          Pt:=Pt^.next;
    P^.Prev:=Pt;
    Pt^.Next:=P;
  end;
end;

Procedure DeleteFirst (var L:List);
var P:Node;
begin
    if L<>nil then
    begin
      if L^.next = nil then
      begin
           Dispose (L);
           L:=Nil;
      end
      else
      begin
          P:=L;
          L:=P^.next;
          P^.next:=Nil;
          dispose(P);
      end;
    end;
end;

procedure DeleteLast(var L:List);
var Prec,Pt:node;
begin
     if (L<>Nil) then
  begin
    Pt:=L;
    Prec:=Nil;
    while (Pt^.next<>Nil) do
    begin
      Prec:=Pt;
      Pt:=Pt^.next;
    end;
    if (Prec=Nil) then
    begin
       dispose (Pt);
       L:=Nil;
    end
    else
    begin
      Prec^.next:=Nil;
      Pt^.prev:=Nil;
      dispose(Pt);
    end;
  end;
end;

Procedure Tampil (Var L:List);
Var P:Node;
Begin
    clrscr;
    if L<> nil then
    begin
        P:=L;
        write (P^.info);
        write (' ');
        P:=P^.next;
        while P<>Nil do
        begin
            write (p^.info);
            write (' ');
            p:=P^.next;
        end;
    end;
    writeln;
end;

label ulang;
begin
createlist(L);
ulang:
clrscr;
tampil(L);
writeln;
writeln;
writeln ('============== Program Double Linked List Ahmad Rafif D ==============');
writeln;
writeln('1. Insert First');
writeln('2. Insert Last');
writeln('3. Delete Fisrt');
writeln('4. Delete Last');
writeln('0. Exit');
write('Pilih = ');
readln(pilih);
case pilih of
'1' : begin
      write('Masukkan Elemen Double Linked List = ');
    Readln (ElmIn);
      InsertFirst(L,ElmIn);
      tampil(L);
      end;
'2' : begin
       write('Masukkan Elemen Double Linked List = ');
    Readln (ElmIn);
      insertlast(L,ElmIn);
      tampil(L);
      end;
'3' : begin
      deletefirst(L);
      tampil(L);
      end;
'4' : begin
      deletelast(L);
      tampil(L);
      end;
'0':exit;
end;
writeln;
writeln ('Press Enter Buat Mengulang Program');
readln;
goto ulang;

end.
