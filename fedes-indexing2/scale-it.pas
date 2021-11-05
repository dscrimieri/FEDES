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

var ex: boolean;

procedure CreateBTree(var btp: BTreePtr);
begin
  new(btp);
  btp^.Value := Value;
  btp^.Index := Index;
  btp^.Left := nil;
  btp^.Right := nil;
end;

begin
  WriteLn('Value to add: ', Value);
  ex := false;
  while (Scale^.Index <> -1) and not ex do
    begin
      if Value < Scale^.Value then
        if Scale^.Left = nil then
          begin
            CreateBTree(Scale^.Left);
            ex := true;
          end
        else
          Scale := Scale^.Left
      else if Value > Scale^.Value then
        if Scale^.Right = nil then
          begin
            CreateBTree(Scale^.Right);
            ex := true;
          end
        else
          Scale := Scale^.Right
      else (* Value = Scale^.Value *)
        begin
          WriteLn('Error. Value already present in scale: ', Value);
          ex := true;
        end;
    end;
  if Scale^.Index = -1 then
    begin
      Scale^.Value := Value;
      Scale^.Index := Index;
    end;
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
var err: boolean;
begin
  err := false;
  while (Idx <> Scale^.Index) and not err do
    begin
      if (Idx < Scale^.Index) and (Scale^.Left <> nil) then
        Scale := Scale^.Left
      else if (Idx > Scale^.Index) and (Scale^.Right <> nil) then
        Scale := Scale^.Right
      else
        begin
          WriteLn('Error. Value not found in scale for index: ', Idx);
          err := true;
        end;
    end;
  if Idx = Scale^.Index then
    FindValue := Scale^.Value;
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
var stop: boolean;
begin
  stop := false;
  while (X <> Scale^.Value) and not stop do
    begin
      if X < Scale^.Value then
        if Scale^.Left <> nil then
          Scale := Scale^.Left
        else if Scale^.Index > 0 then
          begin
            FindPos := Scale^.Index - 1;
            stop := true;
          end
        else
          begin
            FindPos := 0;
            { WriteLn('Error. Index not found in scale (value to insert: ', X, ', scale value: ', Scale^.Value, ')') }
            stop := true;
          end
      else if X > Scale^.Value then
        if Scale^.Right <> nil then
          Scale := Scale^.Right
        else
          begin
            FindPos := Scale^.Index;
            stop := true;
          end;
    end;
  if X = Scale^.Value then
    FindPos := Scale^.Index;
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
