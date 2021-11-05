program testscale;

uses Scale;

var
  s: BTreePtr;

begin
  CreateScale(s);
  InitialiseScale(s, 0, 9, 2, 10);
  ShowScale(s);
  WriteLn();
  ShiftScale(s, 6);
  AddToScale(s, 64, 6);
  ShowScale(s);
end.
