unit Scale;

interface

type
  BTreePtr = ^BTree;
  BTree = record
    Value: real;
    Index: integer;
    Left, Right: BTreePtr;
  end;

procedure CreateScale(var Scale: BTreePtr);
procedure AddToScale(Scale: BTreePtr; Value: real; Index: integer);
procedure InitialiseScale(Scale: BTreePtr; L, U: integer; Min, StepSize: real);
function FindValue(Scale: BTreePtr; Idx: integer): real;
procedure ShiftScale(Scale: BTreePtr; Idx: integer);
function FindPos(X: real; Scale: BTreePtr): longint;
procedure ShowScale(Scale: BTreePtr);

implementation

procedure CreateScale(var Scale: BTreePtr);
begin
  new(Scale);
  Scale^.Index := -1;
  Scale^.Left := nil;
  Scale^.Right := nil;
end;

procedure AddToScale(Scale: BTreePtr; Value: real; Index: integer);

procedure CreateBTree(var btp: BTreePtr);
begin
  new(btp);
  btp^.Value := Value;
  btp^.Index := Index;
  btp^.Left := nil;
  btp^.Right := nil;
end;

procedure Add(Scale: BTreePtr);
begin
  if Scale^.Index = -1 then
    begin
      Scale^.Value := Value;
      Scale^.Index := Index;
    end
  else if Value < Scale^.Value then
    if Scale^.Left <> nil then
      Add(Scale^.Left)
    else
      CreateBTree(Scale^.Left)
  else if Value > Scale^.Value then
    if Scale^.Right <> nil then
      Add(Scale^.Right)
    else
      CreateBTree(Scale^.Right)
  else (* Value = Scale^.Value *)
    WriteLn('Error. Value already present in scale.');    
end;

begin
  Add(Scale);
end;

procedure InitialiseScale(Scale: BTreePtr; L, U: integer; Min, StepSize: real);

procedure InitialiseScaleRec(L, U: integer);
var i: integer;
begin
  if L <= U then
    begin
      i := trunc((L + U) / 2);
      AddToScale(Scale, Min + i * StepSize, i);
      InitialiseScaleRec(L, i - 1);
      InitialiseScaleRec(i + 1, U);
    end
end;

begin
  InitialiseScaleRec(L, U);
end;

function FindValue(Scale: BTreePtr; Idx: integer): real;

function Search(Scale: BTreePtr): real;
begin
  if Idx = Scale^.Index then
    Search := Scale^.Value
  else if (Idx < Scale^.Index) and (Scale^.Left <> nil) then
    Search := Search(Scale^.Left)
  else if (Idx > Scale^.Index) and (Scale^.Right <> nil) then
    Search := Search(Scale^.Right)
  else
    WriteLn('Error. Value not found in scale');
end;

begin
  FindValue := Search(Scale);
end;

procedure ShiftScale(Scale: BTreePtr; Idx: integer);

var
  doShift: boolean;

procedure Search(Scale: BTreePtr);
begin
  if Scale^.Left <> nil then
    Search(Scale^.Left);
  if Idx = Scale^.Index then
    doShift := true;      
  if doShift then
    Scale^.Index := Scale^.Index + 1;
  if Scale^.Right <> nil then
    Search(Scale^.Right);
end;

begin
  doShift := false;
  Search(Scale);
  if not doShift then
    WriteLn('Error. Index not found in scale');
end;

function FindPos(X: real; Scale: BTreePtr): longint;

function Search(Scale: BTreePtr): integer;
begin
  if X = Scale^.Value then
    Search := Scale^.Index
  else if X < Scale^.Value then
    if Scale^.Left <> nil then
      Search := Search(Scale^.Left)
    else if Scale^.Index > 0 then
      Search := Scale^.Index - 1
    else
      Search := 0
      { WriteLn('Error. Index not found in scale (value to insert: ', X, ', scale value: ', Scale^.Value, ')') }
  else if X > Scale^.Value then
    if Scale^.Right <> nil then
      Search := Search(Scale^.Right)
    else
      Search := Scale^.Index;
end;

begin
  FindPos := Search(Scale);
end;

procedure ShowScale(Scale: BTreePtr);
begin
  if Scale <> nil then
    begin
      Write(' ([', Scale^.Value, ' ', Scale^.Index, ']');
      ShowScale(Scale^.Left);
      ShowScale(Scale^.Right); 
      Write(')');
    end;
end;

end.
