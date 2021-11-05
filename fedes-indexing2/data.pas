unit data;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  SysUtils,Dialogs,math,type_of_model;
 const NumEqns=3;

type
  float=real;
  PFloat=^float;
  TFloatArray=array[0..NumEqns] of float;
  PFloatArray=^TFloatArray;
  TFloatMatrix=array[0..NumEqns-1] of TFloatArray;
  PFloatMatrix=^TFloatMatrix;
  TIntegerArray1=array[0..NumEqns] of integer;
  //================================================================
  function FindMax(X,S:PFloatArray; N:integer):PFloatArray;
  procedure GaussPivot1(X:PFloatArray; S:PFloatArray; j,N:integer);
  procedure Eliminate1(var Mx:TFloatMatrix; const S:TFloatArray; N:integer);
  procedure Gauss1(var Mx:TFloatMatrix; var X:TFloatArray; N:integer);
  //=====================================================================
procedure GaussPivot0(var Mx:TFloatMatrix; const S:TFloatArray; j,N:integer);
procedure Eliminate0(var Mx:TFloatMatrix; const S:TFloatArray; N:integer);
procedure Substitute0(var Mx:TFloatMatrix; N:integer);
procedure CalcMags0(var Mx:TFloatMatrix; var S:TFloatArray; N:integer);
procedure Gauss0(var Mx:TFloatMatrix; var X:TFloatArray; N:integer);

 //function for cleaning =================
 //finding tha max and the min values in array;
 function min_values(a,b,c,d:real):real;
 function sum_array(arr:array of real):real;
 function sum_array_col(arr:TRealRealArray;col:integer):real;
 function max_value_array(arr:array of real):real;
  function max_value(value,a,b,c: real):integer;
 function min_value_array(arr:array of real):real;
 function min_argument_array(arr:array of real):integer;
 function avarage_value_array(arr:array of real):real;
 function avarage_value_array_array(arr:array of real;arr2:array of integer):real;
 //converting string to real and opposite
 function strtoreal(a:string): real;
 function realtostr(a:real;b,c:integer):string;
 //exploding string to array
 function explode(var a : TShortStringArray;border,s:string):integer;
 // exploding .fil file
 function explode_fil(var ar : TShortStringArray;s:string;border1,border2,border3 : string):integer;
 //function for chacking the string in the fil file
 function check_string(s:shortstring):shortstring;
 //function for finding information using distanse method
 function abs_avarage_value_array(arr:array of real):real;
 //Break stupid string form Marc
 procedure break_string(const str:string; var arr: TShortStringArray);
 procedure gaussalg (var x : matrix;var z : column;  n : integer);
implementation

 function sum_array(arr:array of real):real;
  var
  sum : real;
  s : integer;
  begin
  sum := 0;
  for s := low(arr) to high(arr) do
    begin
    sum := sum + arr[s];
    end;
  sum_array := sum;
 end;
  function sum_array_col(arr:TRealRealArray;col:integer):real;
  var
  sum : real;
  s : integer;
  begin
  sum := 0;
  for s := low(arr) to high(arr) do
    begin
    sum := sum + arr[s,col];
    end;
  sum_array_col := sum;
 end;
  function avarage_value_array_array(arr:array of real;arr2:array of integer):real;
  var
  d,broqt : integer;
  sum : real;
  begin
    sum := 0;
    broqt := 0;
    for d := low(arr2) to high(arr2) do
      begin
        broqt := broqt +1;
        sum := sum + arr[arr2[d]];
      end;
    avarage_value_array_array := 3/1;
  end;
 function avarage_value_array(arr:array of real):real;
 var
 s,broq4:integer;
 sum : real;
 begin
  sum := 0;
  broq4 := 0;
  for s := low(arr) to high(arr) do
    begin
    broq4 := broq4 + 1;
    sum := sum + arr[s];
    end;
  avarage_value_array := sum/broq4;
 end;
  function abs_avarage_value_array(arr:array of real):real;
 var
 s,broq4:integer;
 sum : real;
 begin
  sum := 0;
  broq4 := 0;
  for s := low(arr) to high(arr) do
    begin
    broq4 := broq4 + 1;
    sum := sum + abs(arr[s]);
    end;
  abs_avarage_value_array := sum/broq4;
 end;
 function max_value_array(arr:array of real):real;
 var
  i : integer;
  m:real;
 begin
  m:=0;
  for i:= 1 to high(arr) do
    begin
      if arr[i] > m then m := arr[i];
    end;
    result := m;
 end;
 function min_value_array(arr:array of real):real;
 var
  i : integer;
  m:real;
 begin
  m:=0;
  for i:= 1 to high(arr) do
    begin
      if arr[i] < m then m := arr[i];
    end;
    result := m;
 end;
 function min_argument_array(arr:array of real):integer;
  var
  i,value : integer;
  m:real;
 begin
  m:=arr[0];
  value := 0;
  for i:= 1 to high(arr) do
    begin
      if arr[i] < m then
      begin
       m := arr[i];
       value := i;
      end;
    end;
    result := value;
 end;

 function strtoreal(a:string): real;
  var X : real;
      k : integer;
  begin
    val(a,x,k);
    strtoreal:= x;
  end;

 function realtostr(a:real;b,c:integer):string;
  var  s : string;
  begin
    str(a:b:c,s);
    realtostr := s;
  end;

 function explode(var a : TShortStringArray;border,s:string):integer;
 var
    s2 : string;
 begin
    Result := 0;
    s2 := s + border;
    repeat
      SetLength(a,Length(a)+1);
      a[result] := copy(s2,0,pos(Border,s2)-1);
      delete(s2,1,Length(a[result]+border));
      inc(result);
    until s2='';
 end;

 function explode_fil(var ar : TShortStringArray;s:string;border1,border2,border3:string):integer;
 var
    s2,new_str : string;
    i,br : integer;
    a : TShortStringArray;
 begin
    new_str := '';
    Result := 0;
    s2 := s + border1;
    delete(s2,1,1);
    a := nil;
    repeat
      SetLength(a,Length(a)+1);
      a[result] := copy(s2,0,pos(Border1,s2)-1);
      //showmessage(a[result]);
      delete(s2,1,Length(a[result]+border1));
      inc(result);
    until s2='';
    for i := low(a) to high(a) do
    begin
      new_str := new_str + 'A'  + a[i] ;
    end;
    //showmessage(new_str);
    Result := 0;
    s2 := new_str + border2;
    a := nil;
    delete(s2,1,1);
    repeat
      SetLength(a,Length(a)+1);
      a[result] := copy(s2,0,pos(Border2,s2)-1);
      //showmessage(a[result]);
      delete(s2,1,Length(a[result]+border2));
      inc(result);
    until s2='';
    new_str := '';
    for i := low(a) to high(a) do
    begin
      new_str := new_str + 'D' + a[i];
    end ;
    //showmessage(new_str);
    result := 0;
    a := nil;
    s2 := new_str + border3;
    delete(s2,1,1);
    //showmessage(s2);
    repeat
      SetLength(a,Length(a)+1);
      a[result] := copy(s2,0,pos(Border3,s2)-1);
      //showmessage(a[result]);
      delete(s2,1,Length(a[result]+border3));
      inc(result);
    until s2='';
    br := -1;
    for i := low(a) to high(a) do
    begin
      if length(trim(a[i])) >= 16 then
      begin
      inc(br);
      SetLength(ar,Length(ar)+1);
      ar[br] := trim(a[i])+'e'+trim(a[i+1]);
      a[i+1] := '';
      end
      else  if a[i] <> '' then
      begin
      inc(br);
      SetLength(ar,Length(ar)+1);
      ar[br] := trim(a[i]);
      end
    end;
 end;
 function check_string(s:shortstring):shortstring;
 var str : shortstring;
 begin
  str := trim(s);
  check_string := copy(str,2,length(str));
 end ;
procedure break_string(const str:string; var arr: TShortStringArray);
var
    A,A1,A2 : TShortStringArray;
    AnzTokens,i,br_,br,j: integer;
    s2 : string;
begin
    br := 0;
    AnzTokens := explode(A,' ',str);
    br_ := -1;
    for i := low(A) to High(A) do
    begin
        if A[i] <> '' then
        begin
                br_ := br_ + 1;
                SetLength(A1,Length(A1)+1);
                A1[br_] := A[i];
        end ;
    end;
    for i := low(A1) to High(A1) do
    begin
     if length(A1[i]) > 13 then
     begin
       SetLength(A2,Length(A2)+1);
       A2[br] := copy(A1[i],1,12);
       br := br + 1;
       delete (A1[i],1,12);
       for j := 1 to round(length(A1[i])/13) do
       begin
       SetLength(A2,Length(A2)+1);
       A2[br] := copy(A1[i],1,13);
       br := br + 1;
       delete (A1[i],1,13);
       end;
     end
     else
     begin
       SetLength(A2,Length(A2)+1);
       A2[br] := A1[i];
       br := br + 1;
     end;
     
    end;
arr := A2;
end;
  function max_value(value,a,b,c: real):integer;
  var
  mid : real;
  v : integer;
  begin
  mid := abs(value - a);
  v := 1;
  if mid < abs(value - b) then
  begin
  mid := abs(value - b);
  v := 2;
  end;
  if mid < abs(value - c) then
  begin
  mid := abs(value - c);
  v := 3;
  end;
  Result := v;
  end;
function min_values(a,b,c,d:real):real;
var
value : real;
begin
value := a;
if value < b then
value := b;
if value < c then
value := c;
if value < d then
value := d;

result := value;
end;
procedure gaussalg (var x : matrix;var z : column;  n : integer);
  var   dg, fk, ee : real;   i, j, k : integer;
 begin
  for i := 1 to n - 1 do
   begin
   dg := x[i, i];
    for j := i + 1 to n do
     begin
      if x[j, i] = 0 then
      fk := 0
      else
      fk := x[j, i] / dg;
      for k := i to n + 1 do
       x[j, k] := x[j, k] - fk * x[i, k]
     end
   end;
  for i := 1 to n do   z[i] := x[i, n + 1];
  for i := n downto 2 do
   begin   dg := x[i, i];    ee := z[i];
    for j := i - 1 downto 1 do  
        z[j] := z[j] - ee * x[j, i] / dg
   end;
  for i := 1 to n do   z[i] := z[i] / x[i, i]
 end;

 function FindMax(X,S:PFloatArray; N:integer):PFloatArray;
// return pivot Row
var
  i:Integer;
  big: single;
begin
  big := abs(X[0]*S[0]);
  result := X;
  i:=1;
  while i<N do  // converted for to while
  begin
    inc(X);  // step one row
    if (abs(X[0]*S[i]) > big) then
    begin
      big := abs(X[0]*S[i]);
      result := X;
    end;
    inc(i);
  end;
end;

procedure GaussPivot1(X:PFloatArray; S:PFloatArray; j,N:integer);
// Restructured Param types
var
   i: integer;
   big,dummy: single;
   Pivot:PFloatArray;
begin
  X:=@X[j];  // shift to First element to change
  Pivot:=FindMax(X,@S[j],N-j);  // pulled out loop
  i:=0;
  N:=N-j;
  // note that physically copying rows is faster than indexing
  while i<=N do // converted for to while
  begin
  	dummy:=X[i];
    X[i]:=Pivot[i];
    Pivot[i]:=dummy;
    inc(i);
  end;
end;   { procedure Pivot }


procedure Eliminate1(var Mx:TFloatMatrix; const S:TFloatArray; N:integer);
var
	i,j,k:Integer;
  scale,divisor:Double;
  Mxj,Mxk:PFloatArray;
begin
  // generally, all matrix references have been reduced to array refs.
  // by making a Pointer to the rows.
  k:=0;
  while k<N-1 do
	begin
  	GaussPivot1(@Mx[k],@S,k,N);
    Mxk:=@Mx[k];  // Get row k
    j:=k+1;
    Mxj:=@Mx[j];  // Get row j
    Divisor:=1/Mxk[k];     // move division out of loop
    while j<N do  // converted for to while
    begin
      Scale:=Mxj[k]*Divisor;
      i:=k+1;
      while i<=N do  // converted for to while
      begin
        Mxj[i]:=Mxj[i]-Scale*Mxk[i];
        inc(i);
      end;
      inc(j);
      inc(Mxj);  // step forward one row
    end;
    inc(k);
	end;
end;

procedure Gauss1(var Mx:TFloatMatrix; var X:TFloatArray; N:integer);
Var
	S:TFloatArray;
  i:integer;
begin
  CalcMags0(Mx,S,N);
  Eliminate1(Mx,S,N);  // only eliminate changed
  Substitute0(Mx,N);
  for i:=0 to N-1 do
  	X[i]:=Mx[i,N];
end;
//===============================================================================
procedure GaussPivot0(var Mx:TFloatMatrix; const S:TFloatArray; j,N:integer);
var
   i: integer;
   pivot: integer;
   big,dummy: float;
begin
  pivot := j;
  big := abs(Mx[j,j]*S[j]);
  for i := j+1 to N-1 do
    if (abs(Mx[i,j]*S[i]) > big) then
    begin
      big := abs(Mx[i,j]*S[i]);
      pivot := i;
    end;
  for i:=0 to N do
  begin
  	dummy:=Mx[j,i];
    Mx[j,i]:=Mx[pivot,i];
    Mx[Pivot,i]:=dummy;
  end;
end;   { procedure Pivot }


procedure Eliminate0(var Mx:TFloatMatrix; const S:TFloatArray; N:integer);
var
	i,j,k:Integer;
  scale:Double;
begin
	for k:=0 to N-2 do
	begin
  	GaussPivot0(Mx,S,k,N);
		for j:=k+1 To N-1 do
    begin
      Scale:=Mx[j,k]/Mx[k,k];
      for i := k+1 to N do    // Iterate
        Mx[j,i]:=Mx[j,i]-Scale*Mx[k,i];
    end;
	end;
end;

procedure Substitute0(var Mx:TFloatMatrix; N:integer);
var
  i,j:integer;
  sum:float;
begin
  Mx[N-1,N]:=Mx[N-1,N]/Mx[N-1,N-1];
	for i:=N-2 downto 0 do
  begin
    sum:=0;
		for j:=i+1 to N-1 do
			sum:=sum+Mx[i,j]*Mx[j,N];
		Mx[i,N]:=(Mx[i,N]-sum)/Mx[i,i];
  end;
end;

procedure CalcMags0(var Mx:TFloatMatrix; var S:TFloatArray; N:integer);
var
	i,j: integer;
begin
  for i := 0 to N-1 do
  begin
    S[i] := abs(Mx[i,1]);
    for j := 0 to N-1 do
      if abs(Mx[i,j]) > S[i] then
      	S[i] := abs(Mx[i,j]);
    S[i]:=1/S[i];
  end;
end;

procedure Gauss0(var Mx:TFloatMatrix; var X:TFloatArray; N:integer);
Var
	S:TFloatArray;
  i:integer;
begin
	CalcMags0(Mx,S,N);
  Eliminate0(Mx,S,N);
  Substitute0(Mx,N);
  for i:=0 to N-1 do
  	X[i]:=Mx[i,N];
end;
end.