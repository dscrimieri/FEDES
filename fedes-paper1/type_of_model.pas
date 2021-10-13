unit type_of_model;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface
type
 TStringArray = array of string;
 TShortStringArray = array of shortstring;
 TShortStringStringArray = array of array of shortstring;
 TRealArray = array of real;
 TRealRealArray = array of array of real;
 TIntegerIntegerArray = array of array of integer;
 TIntegerArray = array of integer;
 matrix = array[1..10, 1..11] of real;
 column = array[1..10] of real;
implementation

end.
