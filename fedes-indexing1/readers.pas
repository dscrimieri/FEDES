unit readers;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface
uses
{$IFNDEF FPC}
  XMLIntf,
{$ELSE}
  DOM, XMLRead,
{$ENDIF}
  data,type_of_model,SysUtils,dialogs; //,ComCtrls;

//==================== reading Abaqus input file .inp ==========================
procedure abaqus_input_read(const str : string;
                            var nodes:TRealRealArray;
                            var elements:TIntegerIntegerArray);
//===================== reading Abaqus output file .dat ========================
 procedure abaqus_output_read(const str_ : string;
                             const l: integer;
                             var Stress:TRealRealArray;
                             var Displacement:TRealRealArray;
                             var TotalStrain:TRealRealArray;
                             var PlasticStrain:TRealRealArray;
                             var AccumulatedStrain:TRealRealArray);
 procedure ansys_input_read(const str : string;
                            var  Nodes:TRealRealArray;
                            var  Elements : TIntegerIntegerArray);
 procedure ansys_input_read_lis(const str : string;
                                var  Nodes:TRealRealArray;
                                var  Elements : TIntegerIntegerArray);
 procedure ansys_input_integration_points_read(const str : string;
                                               var  Nodes:TRealRealArray);
//===================== Ansys Output File .txt =================================
 procedure ansys_output_read(const str : string;
                             const TheLength : integer;
                             var  Displacements:TRealRealArray;
                             var  TotalStrains:TRealRealArray;
                             var  Stresses:TRealRealArray);
 //======================== MARC input file .t19 ================================
procedure marc_input_output_read(const str_ : string;
                                 var  Nodes:TRealRealArray;
                                 var  Elements : TIntegerIntegerArray;
                                 var  Displacements:TRealRealArray);
procedure marc_stress_output_read(const str : string;
                                  var  Stresses:TRealRealArray);
procedure deform_input_output_read(const str_ : string;
                                   var Nodes : TRealRealArray;
                                   var Elements : TIntegerIntegerArray;
                                   var Stresses:TRealRealArray;
                                   var Displacements:TRealRealArray;
                                   var AccumulatedPlasticStrain:TRealRealArray);
procedure deform_input_read(const str_ : string;
                            var Nodes : TRealRealArray;
                            var Elements : TIntegerIntegerArray);
procedure vulcan_input_read(const str_ : string;
                                   var Nodes : TRealRealArray;
                                   var Elements : TIntegerIntegerArray);
procedure vulcan_output_read(const str_ : string;
                             var Stresses:TRealRealArray;
                             var Displacements:TRealRealArray);
procedure morpheo_input_output_read(XMLDocument1: TXMLDocument;
                                    const str_ : string;
                                    var Nodes : TRealRealArray;
                                    var Elements : TIntegerIntegerArray;
                                    var Stresses:TRealRealArray;
                                    var Displacements:TRealRealArray;
                                    var TotalStrains:TRealRealArray;
                                    var AccumulatedStrain:TRealRealArray);
procedure morpheo_input_read(XMLDocument1: TXMLDocument;
                            const str_ : string;
                            var Nodes : TRealRealArray;
                            var Elements : TIntegerIntegerArray);
procedure XML_input_read (const str_: string;
                          Displacements:TRealRealArray);
//======================== MARC input output read .t19 =========================
{
 procedure ansys_dat_output_read(const str_ : string);
 //===================== Ansys Input File .inp =================================
procedure ansys_inp_output_read(const str_ : string;el_number,el_nodes:integer);
 //===================== Ansys Input File .txt Integrationd points =============
procedure ansys_input_read(const str : string; const el_number : integer;var int_point_num_for_el : integer);
//====================== Deform Input File .key ================================
procedure deform_input_read(const str_ : string);
//====================== Deform Output File .key ================================

//======================= Morpheo Input file .vtu ==============================
procedure morpheo_input_read(const str_ : string);
//======================= Morpheo Input output .vtu ==============================
procedure morpheo_output_read(const str_ : string);

//======================== MARC stress output read .t19 =========================
procedure marc_stress_output_read(const str_ : string);
//======================== Vulcan mesh read .msh ===============================

}
implementation

procedure abaqus_input_read(const str : string;
                            var nodes:TRealRealArray;
                            var elements:TIntegerIntegerArray);
var
c,c1,st : string;
file_content : textfile;
A,A1 : TShortStringArray;
AnzTokens,i,br,br_1,j,br_el : integer;
action,node,element : integer;
new_row,new_row_2 : boolean;
begin
action := 3;
node := 0;
element := 0;
action := 0;
br := -1;
br_1 := -1;
st := '';
    Assignfile(file_content,str);
    Reset(file_content);
    while not eof(file_content) do
    begin
         readln(file_content,c1);
         c := LowerCase(c1);
         if copy(c,1,1) = '*' then
            begin
             action := 3;
            end;
         if copy(c,1,5) = '*node' then
            begin
             action := 1;
             node := node + 1;
            end;
        if copy(c,1,8) = '*element' then
            begin
             action := 2;
             element := element + 1;
             end;
        if (pos('*element output',c)=1) then
            begin
             action := 3;
            end;
        if (action = 1) and (pos('*node',c)=0) and (node = 1) then
          begin
            br := br + 1;
          end;
        if (action = 2) and (pos('*element',c)=0)  then
          begin
            inc(br_1);
              AnzTokens := explode(A1,',',trim(c));
              if trim(A1[high(A1)])= '' then
               dec(br_1);
              A1 := nil;
       end;
    end;
    closefile(file_content);


    SetLength(nodes,br+1,4);
    SetLength(elements,br_1+1,21);

    new_row := false;
    action := 3;
    node := 0;
    element := 0;
    st := '';
    br := -1;
    br_1 := -1;
    Assignfile(file_content,str);
    Reset(file_content);
    while not eof(file_content) do
    begin
         readln(file_content,c1);
         c := LowerCase(c1);
         if (pos('*',c)>0) then
            begin
             action := 3;
            end;
         if (pos('*node',c)=1) then
            begin
             action := 1;
             node := node + 1;
            end;
        if (pos('*element',c)=1) then
            begin
             action := 2;
             element := element + 1;
            end;
        if (pos('*element output',c)=1) then
            begin
             action := 3;
            end;
        if (action = 1) and (pos('*node',c)=0) and (node=1) then
          begin
            br := br + 1;
                AnzTokens := explode(A,',',c);
                for i := 0 to high(A) do
                begin
                nodes[br,i] :=  strtoreal(trim(A[i]));
                end;
                A := nil;
          end;
        if (action = 2) and (pos('*element',c)=0)  then
          begin

            AnzTokens := explode(A,',',trim(c));
            if trim(A[high(A)]) <> '' then
            begin
                if new_row then
                begin
                        br_1 := br_1 + 1;
                        st := st + c;
                        AnzTokens := explode(A1,',',st);
                        for j := low(A1) to high(A1) do
                        elements[br_1,j] := strtoint(trim(A1[j]));
                        A1 := nil;
                        st := '';
                        new_row := false;
                end
                else
                begin
                        br_1 := br_1 + 1;
                        for j := low(A) to high(A) do
                        elements[br_1,j] := strtoint(trim(A[j]));
                        A := nil;
                end;
            end
            else
            begin
              st := st + c;
              new_row := true;
             end;
          A := nil;
          end;
      end;
      closefile(file_content);

end;

procedure abaqus_output_read(const str_ : string;
                             const l : integer;
                             var Stress:TRealRealArray;
                             var Displacement:TRealRealArray;
                             var TotalStrain:TRealRealArray;
                             var PlasticStrain:TRealRealArray;
                             var AccumulatedStrain:TRealRealArray);
var
  c : string;
  br,br_1,br_2,br_3,br_,br_1_,br_2_,br_3_,action,AnzTokens,i : integer;
  operating_str_arr : TStringArray;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    br := -1;
    br_1 := -1;
    br_2 := -1;
    br_3 := -1;

    action := 5;
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
          readln(file_content_,c);

          if (pos('S11',c)>0) and (pos('S22',c)>0) then
            begin
             br := 1;
             end;
        if (pos('U1',c)>0) and  (pos('U2',c)>0) then
            begin
             br_1 := 1;
             end;
        if (pos('E11',c)>0) and  (pos('E22',c)>0) then
            begin
             br_2 := 1;
             end;
        if (pos('PE11',c)>0) and  (pos('PE22',c)>0) then
            begin
             br_3 := 1;
            end;
        end;
    closefile(file_content_);


    if br = 1 then
    SetLength(Stress,l,6);

    if br_1 = 1 then
    SetLength(Displacement,l,3);

    if br_2 = 1 then
    SetLength(TotalStrain,l,6);

    if br_3=1 then
    begin
    SetLength(AccumulatedStrain,l,1);
    SetLength(PlasticStrain,l,6);
    end;

    for I := 0 to l-1 do
    begin
     if Stress <> nil then
     begin
     Stress[i,0] := 0;
     Stress[i,1] := 0;
     Stress[i,2] := 0;
     Stress[i,3] := 0;
     Stress[i,4] := 0;
     Stress[i,5] := 0;
     end;

     if Displacement <> nil then
     begin
     Displacement[i,0] := 0;
     Displacement[i,1] := 0;
     Displacement[i,2] := 0;
     end;

     if AccumulatedStrain <> nil then
     AccumulatedStrain[i,0] := 0;

     if TotalStrain<> nil then
     begin
     TotalStrain[i,0] := 0;
     TotalStrain[i,1] := 0;
     TotalStrain[i,2] := 0;
     TotalStrain[i,3] := 0;
     TotalStrain[i,4] := 0;
     TotalStrain[i,5] := 0;
     end;

     if PlasticStrain <> nil then
     begin
     PlasticStrain[i,0] := 0;
     PlasticStrain[i,1] := 0;
     PlasticStrain[i,2] := 0;
     PlasticStrain[i,3] := 0;
     PlasticStrain[i,4] := 0;
     PlasticStrain[i,5] := 0;
     end;

    end;

    br := -1;
    br_1 := -1;
    br_2 := -1;
    br_3 := -1;
    action := 5;
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
          readln(file_content_,c);
          if (pos('S11',c)>0) and (pos('S22',c)>0) then
             action := 1;
        if (pos('U1',c)>0) and  (pos('U2',c)>0) then
             action := 2;
        if (pos('E11',c)>0) and  (pos('E22',c)>0) then
             action := 3;
        if (pos('PE11',c)>0) and  (pos('PE22',c)>0) then
             action := 4;
        if (pos('MAXIMUM',c)>0)then
             action := 5;
        if (action = 1) and (pos('NOTE',c)=0) and (trim(c)<>'') and (pos('S11',c)=0) and  (pos('S22',c)=0)then
          begin
                AnzTokens := explode(A,' ',trim(c));
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
                if Length(A1) = 7 then
                begin
                Stress[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                Stress[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                Stress[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
                Stress[strtoint(A1[0])-1,3] := strtoreal(A1[4]);
                Stress[strtoint(A1[0])-1,4] := strtoreal(A1[6]);
                Stress[strtoint(A1[0])-1,5] := strtoreal(A1[5]);
                end;

                if Length(A1) = 5 then
                begin
                Stress[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                Stress[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                Stress[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
                Stress[strtoint(A1[0])-1,3] := strtoreal(A1[4]);
                end;

                if Length(A1) = 4 then
                begin
                Stress[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                Stress[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                Stress[strtoint(A1[0])-1,3] := strtoreal(A1[3]);
                end;
                A := nil;
                A1 := nil;
          end;
        if (action = 2) and (pos('NOTE',c)=0) and (TRIM(c)<>'') and (pos('U1',c)=0) and  (pos('U2',c)=0) then
          begin
            AnzTokens := explode(A,' ',trim(c));
                br_1_ := -1;
                for i := low(A) to High(A) do
                begin
                  if A[i] <> '' then
                  begin
                    br_1_ := br_1_ + 1;
                    SetLength(A1,Length(A1)+1);
                    A1[br_1_] := A[i];
                  end ;
                end;

                if Length(A1)=4 then
                begin
                Displacement[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                Displacement[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                Displacement[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
                end;

                if Length(A1)=3 then
                begin
                Displacement[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                Displacement[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                end;

                A := nil;
                A1 := nil;
          end;

          if (action = 3) and (pos('NOTE',c)=0) and (c<>'') and (pos('E11',c)=0) and  (pos('E22',c)=0)then
          begin
                br_2 := br_2 + 1;
                AnzTokens := explode(A,' ',trim(c));
                br_2_ := -1;
                for i := low(A) to High(A) do
                begin
                  if A[i] <> '' then
                  begin
                    br_2_ := br_2_ + 1;
                    SetLength(A1,Length(A1)+1);
                    A1[br_2_] := A[i];
                  end ;
                end;

                if Length(A1) = 7 then
                begin
                TotalStrain[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                TotalStrain[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                TotalStrain[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
                TotalStrain[strtoint(A1[0])-1,3] := strtoreal(A1[4]);
                TotalStrain[strtoint(A1[0])-1,4] := strtoreal(A1[6]);
                TotalStrain[strtoint(A1[0])-1,5] := strtoreal(A1[5]);
                end;

                if Length(A1) = 5 then
                begin
                TotalStrain[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                TotalStrain[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                TotalStrain[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
                TotalStrain[strtoint(A1[0])-1,3] := strtoreal(A1[4]);
                end;

                if Length(A1) = 4 then
                begin
                TotalStrain[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                TotalStrain[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                TotalStrain[strtoint(A1[0])-1,3] := strtoreal(A1[3]);
                end;
                A := nil;
                A1 := nil;
          end;

          if (action = 4) and (pos('NOTE',c)=0) and (c<>'') and (pos('all',lowercase(c))=0) and (pos('PE11',c)=0) and  (pos('PE22',c)=0) then
          begin

            AnzTokens := explode(A,' ',trim(c));
                br_3_ := -1;
                for i := low(A) to High(A) do
                begin
                  if A[i] <> '' then
                  begin
                    br_3_ := br_3_ + 1;
                    SetLength(A1,Length(A1)+1);
                    A1[br_3_] := A[i];
                  end ;
                end;
                if Length(A1) = 9 then
                begin
                PlasticStrain[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                PlasticStrain[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                PlasticStrain[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
                PlasticStrain[strtoint(A1[0])-1,3] := strtoreal(A1[4]);
                PlasticStrain[strtoint(A1[0])-1,4] := strtoreal(A1[6]);
                PlasticStrain[strtoint(A1[0])-1,5] := strtoreal(A1[5]);

                AccumulatedStrain[strtoint(A1[0])-1,0] := strtoreal(A1[7]);
                end;

                if Length(A1) = 7 then
                begin
                PlasticStrain[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                PlasticStrain[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                PlasticStrain[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
                PlasticStrain[strtoint(A1[0])-1,3] := strtoreal(A1[4]);

                AccumulatedStrain[strtoint(A1[0])-1,0] := strtoreal(A1[5]);
                end;

                if Length(A1) = 6 then
                begin
                PlasticStrain[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
                PlasticStrain[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
                PlasticStrain[strtoint(A1[0])-1,3] := strtoreal(A1[3]);

                AccumulatedStrain[strtoint(A1[0])-1,0] := strtoreal(A1[4]);
                end;
                A := nil;
                A1 := nil;
          end;
        end;
    closefile(file_content_);
end;

procedure ansys_input_read(const str : string;
                           var  Nodes:TRealRealArray;
                           var  Elements : TIntegerIntegerArray);
var
  c : string;
  br,br_1,br_2,br_3,br_el,action,AnzTokens,i,num_nblocks,num_eblocks : integer;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    br := -1;
    br_1 := 0;
    br_2 := 0;
    br_el := 0;
    action := 4;
    num_nblocks := 1;
    num_eblocks := 1;
    Assignfile(file_content_,str);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('nblock',c)=1) then
         begin
             action := 1;
         end;
         if (pos('eblock',c)=1) then
         begin
                action := 2;
         end;
         if (c='') or (pos('!',c)>0) or (pos('/',c)>0) or (trim(c) = '-1') then
            begin
              action := 4;
            end;
         if (action = 1) and (pos('nblock',c)=0) and (pos('(',c)=0) then
           begin
             br_1 := br_1 + 1;
           end;
         if (action = 2) and (pos('eblock',c)=0) and (pos('(',c)=0) then
           begin
             br_2 := br_2 + 1;
           end;
        end;
    close(file_content_);
    SetLength(Nodes,br_1,4);
    SetLength(Elements,br_2,21);
    br := -1;
    br_1 := -1;
    br_2 := -1;
    br_3 := -1;
    num_nblocks := 1;
    num_eblocks := 1;
    Assignfile(file_content_,str);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('nblock',c)=1) then
         begin
                action := 1;
         end;
         if (pos('eblock',c)=1) then
         begin
                action := 2;
         end;
         if (c='') or (pos('!',c)>0) or (pos('/',c)>0) or (trim(c) = '-1') then
            begin
              action := 4;
            end;
         if (action = 1) and (pos('nblock',c)=0) and (pos('(',c)=0) then
           begin
            br_1 := br_1 + 1;
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Nodes[br_1,0] := strtoreal(trim(A1[0]));
             Nodes[br_1,1] := strtoreal(trim(A1[1]));
             Nodes[br_1,2] := strtoreal(trim(A1[2]));
             Nodes[br_1,3] := strtoreal(trim(A1[3]));
             A := nil;
             A1 := nil;
             end;
         if (action = 2) and (pos('eblock',c)=0) and (pos('(',c)=0) then
           begin
             br_2 := br_2 + 1;
             AnzTokens := explode(A,' ',trim(c));
             br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;

         if A1[high(A1)]<>A1[high(A1)-1] then      //hex elements
         begin
          elements[br_2,0] := strtoint(A1[0]);
          elements[br_2,1] := strtoint(A1[5]);
          elements[br_2,2] := strtoint(A1[6]);
          elements[br_2,3] := strtoint(A1[7]);
          elements[br_2,4] := strtoint(A1[8]);
          elements[br_2,5] := strtoint(A1[9]);
          elements[br_2,6] := strtoint(A1[10]);
          elements[br_2,7] := strtoint(A1[11]);
          elements[br_2,8] := strtoint(A1[12]);
         end
         else if (A1[high(A1)]=A1[high(A1)-1])and (A1[high(A1)]=A1[high(A1)-1]) then        //tet elements
         begin
          elements[br_2,0] := strtoint(A1[0]);
          elements[br_2,1] := strtoint(A1[5]);
          elements[br_2,2] := strtoint(A1[6]);
          elements[br_2,3] := strtoint(A1[7]);
          elements[br_2,4] := strtoint(A1[9]);
         end
         else     //wedge elements
         begin
          elements[br_2,0] := strtoint(A1[0]);
          elements[br_2,1] := strtoint(A1[5]);
          elements[br_2,2] := strtoint(A1[6]);
          elements[br_2,3] := strtoint(A1[7]);
          elements[br_2,4] := strtoint(A1[9]);
          elements[br_2,5] := strtoint(A1[10]);
          elements[br_2,6] := strtoint(A1[11]);
         end;
            A := nil;
            A1 := nil;
           end;
        end;
    close(file_content_);
end;
procedure ansys_input_read_lis(const str : string;
                               var Nodes:TRealRealArray;
                               var Elements : TIntegerIntegerArray);
var
  c : string;
  br,br_1,br_2,br_3,br_el,action,AnzTokens,i,num_nblocks,num_eblocks : integer;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    br := -1;
    br_1 := 0;
    br_2 := 0;
    br_el := 0;
    action := 4;
    num_nblocks := 1;
    num_eblocks := 1;
    Assignfile(file_content_,str);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('NODE',c)>0)and (pos('X',c)>0) then
         begin
             action := 1;
         end;
         if (pos('ELEM',c)>0)and(pos('MAT',c)>0)and(pos('TYP',c)>0)   then
         begin
                action := 2;
         end;
         if (action = 1) and (pos('NODE',c)=0) and (trim(c)<>'') and (pos('LIST',c)=0) and (pos('SORT',c)=0)   then
           begin
             br_1 := br_1 + 1;
           end;
         if (action = 2) and (pos('ELEM',c)=0) and (trim(c)<>'') and (pos('LIST',c)=0) and (pos('SORT',c)=0)   then
           begin
             br_2 := br_2 + 1;
           end;
        end;
    close(file_content_);
    SetLength(Nodes,br_1,4);
    SetLength(Elements,br_2,21);
    br := -1;
    br_1 := -1;
    br_2 := -1;
    br_3 := -1;
    num_nblocks := 1;
    num_eblocks := 1;
    Assignfile(file_content_,str);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('NODE',c)>0)and (pos('X',c)>0) then
         begin
             action := 1;
         end;
         if (pos('ELEM',c)>0)and(pos('MAT',c)>0)and(pos('TYP',c)>0)   then
         begin
                action := 2;
         end;

         if (action = 1) and (pos('NODE',c)=0) and (trim(c)<>'') and (pos('LIST',c)=0) and (pos('SORT',c)=0)   then
           begin
            br_1 := br_1 + 1;
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Nodes[br_1,0] := strtoreal(trim(A1[0]));
             Nodes[br_1,1] := strtoreal(trim(A1[1]));
             Nodes[br_1,2] := strtoreal(trim(A1[2]));
             Nodes[br_1,3] := strtoreal(trim(A1[3]));
             A := nil;
             A1 := nil;
             end;
           if (action = 2) and (pos('ELEM',c)=0) and (trim(c)<>'') and (pos('LIST',c)=0) and (pos('SORT',c)=0)   then
           begin
             br_2 := br_2 + 1;
             AnzTokens := explode(A,' ',trim(c));
             br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
         if A1[high(A1)]<>A1[high(A1)-1] then      //hex elements
         begin
          elements[br_2,0] := strtoint(A1[0]);
          elements[br_2,1] := strtoint(A1[5]);
          elements[br_2,2] := strtoint(A1[6]);
          elements[br_2,3] := strtoint(A1[7]);
          elements[br_2,4] := strtoint(A1[8]);
          elements[br_2,5] := strtoint(A1[9]);
          elements[br_2,6] := strtoint(A1[10]);
          elements[br_2,7] := strtoint(A1[11]);
          elements[br_2,8] := strtoint(A1[12]);
         end
         else if (A1[high(A1)]=A1[high(A1)-1])and (A1[high(A1)]=A1[high(A1)-1]) and (A1[high(A1)]=A1[high(A1)-2]) then        //tet elements
         begin
          elements[br_2,0] := strtoint(A1[0]);
          elements[br_2,1] := strtoint(A1[6]);
          elements[br_2,2] := strtoint(A1[7]);
          elements[br_2,3] := strtoint(A1[8]);
          elements[br_2,4] := strtoint(A1[10]);
         end
         else     //wedge elements
         begin
          elements[br_2,0] := strtoint(A1[0]);
          elements[br_2,1] := strtoint(A1[5]);
          elements[br_2,2] := strtoint(A1[6]);
          elements[br_2,3] := strtoint(A1[7]);
          elements[br_2,4] := strtoint(A1[9]);
          elements[br_2,5] := strtoint(A1[10]);
          elements[br_2,6] := strtoint(A1[11]);
         end;
            A := nil;
            A1 := nil;
           end;
        end;
    close(file_content_);
end;

 procedure ansys_output_read(const str : string;
                             const TheLength : integer;
                             var  Displacements:TRealRealArray;
                             var  TotalStrains:TRealRealArray;
                             var  Stresses:TRealRealArray);
var
  c : string;
  br,br_1,br_2,br_3,action,AnzTokens,i : integer;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    br := -1;
    br_1 := 0;
    br_2 := 0;
    action := 4;

    br := -1;
    br_1 := -1;
    br_2 := -1;
    br_3 := -1;
    Assignfile(file_content_,str);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('NODE',c)>0) and  (pos('UX',c)>0) and (pos('UY',c)>0) then
            begin
             action := 1;
             SetLength(Displacements,TheLength,3);
             end;
         if (pos('NODE',c)>0) and  (pos('SX',c)>0) and (pos('SY',c)>0)then
            begin
              SetLength(Stresses,TheLength,6);
              action := 2;
            end;
         if (pos('NODE',c)>0) and  (pos('EX',c)>0) and (pos('EY',c)>0)then
            begin
              SetLength(TotalStrains,TheLength,6);
              action := 3;
            end;
         if (c='') or (pos('--',c)>0) then
            begin
              action := 4;
            end;
         if (action = 1) and (pos('NODE',trim(c))=0) then
           begin
            br_1 := br_1 + 1;
            AnzTokens := explode(A,chr(9),trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Displacements[br_1,0] := strtoreal(A1[1]);
             Displacements[br_1,1] := strtoreal(A1[2]);
             Displacements[br_1,2] := strtoreal(A1[3]);
             A := nil;
             A1 := nil;
             end;
         if (action = 2) and (pos('NODE',trim(c))=0) then
           begin
            br_2 := br_2 + 1;
            AnzTokens := explode(A,chr(9),trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Stresses[br_2,0] := strtoreal(A1[1]);
             Stresses[br_2,1] := strtoreal(A1[2]);
             Stresses[br_2,2] := strtoreal(A1[3]);
             Stresses[br_2,3] := strtoreal(A1[4]);
             Stresses[br_2,4] := strtoreal(A1[5]);
             Stresses[br_2,5] := strtoreal(A1[6]);
             A := nil;
             A1 := nil;
             end;
         if (action = 3) and (pos('NODE',trim(c))=0) then
           begin
            br_3 := br_3 + 1;
            AnzTokens := explode(A,chr(9),trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             TotalStrains[br_3,0] := strtoreal(A1[1]);
             TotalStrains[br_3,1] := strtoreal(A1[2]);
             TotalStrains[br_3,2] := strtoreal(A1[3]);
             TotalStrains[br_3,3] := strtoreal(A1[4]);
             TotalStrains[br_3,4] := strtoreal(A1[5]);
             TotalStrains[br_3,5] := strtoreal(A1[6]);
             A := nil;
             A1 := nil;
             end;
        end;
    close(file_content_);
end;
procedure marc_input_output_read(const str_ : string;
                          var  Nodes:TRealRealArray;
                          var  Elements : TIntegerIntegerArray;
                          var  Displacements:TRealRealArray);
var
c,str : string;
file_content_ : textfile;
A,A1 : TShortStringArray;
action,node_num,AnzTokens,element_num, i, br,br_conectivity,nodes_in_el,num_rows,br_,counter,br_el_  ,disp_br_: integer;
point,displ : boolean;
begin
action := 0;
node_num := 0;
element_num := 0;
br_conectivity := 0;
br_ := -1;
br_el_ := -1;
disp_br_ := -3;
displ := false;
counter := 0;
Assignfile(file_content_,str_);
Reset(File_content_);
      while not eof(file_content_) do
      begin
         readln(file_content_,c);
         if (pos('=beg=50800',c) > 0) then
         begin
         action :=1;
         end;
         if (pos('=beg=50700',c) > 0) then
         begin
         action := 2;
         end;
         if (pos('=beg=50200',c) > 0) then
         begin
         action := 3;
         end;
         if (pos('=beg=52401',c) > 0) then
         begin
         action := 5;
         end;
         if (pos('=end=',c) > 0) or ((pos('Temperature',c) > 0)) or ((pos('External Force',c) > 0)) or ((pos('Reaction Force',c) > 0)) then
         begin
         action := 0;
         end;
      if (action = 1 ) and (pos('=beg=50800',c) = 0) and (c<>'') then
      begin
      AnzTokens := explode(A,' ',trim(c));
      br_ := br_ + 1;
       br := -1;
       for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
       Nodes[br_,0] := strtoreal(A1[0]);
       Nodes[br_,1] := strtoreal(A1[1]);
       Nodes[br_,2] := strtoreal(A1[2]);
       Nodes[br_,3] := strtoreal(A1[3]);
       A := nil;
       A1 := nil;
      end;
      if (action = 2 ) and (pos('=beg=50700',c) = 0) and (c<>'') then
      begin
       br_conectivity := br_conectivity + 1;
       if br_conectivity = 1 then
       begin
       counter := counter + 1;
       AnzTokens := explode(A,' ',trim(c));
       br := -1;
       for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
       nodes_in_el := strtoint(A1[2]);
       SetLength(Elements,element_num,21);
       num_rows := round((nodes_in_el+3)/6);
       A := nil;
       A1 := nil;
       str := c;
       end
      else
      begin
        counter := counter + 1;
        if counter < num_rows then
        begin
         str := str + c;

        end
        else
        begin
         str := str + c;
         br_el_ := br_el_ + 1;
         AnzTokens := explode(A,' ',trim(str));
         br := -1;
         for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
         for i := low(A1) to high(A1) do
         begin
           if i=0 then
           Elements[br_el_,i] := strtoint(A1[i]);
           if i > 2 then
           begin
           Elements[br_el_,i-2] := strtoint(A1[i]);
           end;
         end;
         A1 := nil;
         A := nil;
         str := '';
         counter := 0;
        end;
      end;
      end;
      if (action = 3 ) and (pos('=beg=50200',c) = 0) and (c<>'') then
      begin
       AnzTokens := explode(A,' ',trim(c));
       br := -1;
       for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
       node_num := strtoint(A1[1]);
       element_num := strtoint(A1[2]);
       SetLength(Nodes,node_num,4);
       SetLength(Displacements,node_num,3);
       A := nil;
       A1 := nil;
       action := 0;
      end;
      if (action = 5 ) and (pos('=beg=52401',c) = 0) and (c<>'') then
      begin
      if (pos('Displacement',c) > 0) then
       displ := true;
        if (displ=true) and (pos('Displacement',c) = 0) then
        begin
                disp_br_ := disp_br_ + 1;
                if disp_br_ >= 0 then

                if length(trim(c))> 50 then
                begin
                  Displacements[disp_br_ ,0] := strtoreal(trim(copy(c,1,13)));;
                  Displacements[disp_br_ ,1] := strtoreal(trim(copy(c,14,13)));
                  Displacements[disp_br_ ,2] := strtoreal(trim(copy(c,27,13)));

                  disp_br_ := disp_br_ + 1;

                  Displacements[disp_br_ ,0] := strtoreal(trim(copy(c,40,13)));;
                  Displacements[disp_br_ ,1] := strtoreal(trim(copy(c,53,13)));
                  Displacements[disp_br_ ,2] := strtoreal(trim(copy(c,66,13)));
                end
                else
                begin
                  Displacements[disp_br_ ,0] := strtoreal(trim(copy(c,1,13)));;
                  Displacements[disp_br_ ,1] := strtoreal(trim(copy(c,14,13)));
                  Displacements[disp_br_ ,2] := strtoreal(trim(copy(c,27,13)));
                end;
                
        end;
      end;
      end;

Close(file_content_);
end;
procedure marc_stress_output_read(const str : string;
                                  var  Stresses:TRealRealArray);
var
c : string;
file_content_ : textfile;
A,A1 : TShortStringArray;
action,br,br_,AnzTokens,i : integer;
begin
   action := 0;
   br_ := 0;
   Assignfile(file_content_,str);
   Reset(File_content_);
      while not eof(file_content_) do
      begin
         readln(file_content_,c);
         if (pos('g e n e r a l i z e d',c) > 0) then
         action := 1;
         if (pos('tresca',c) > 0) then
         action := 0;
         if (action = 1) and (pos('g e n e r a l i z e d',c) = 0) and (c<>'') then
         br_ := br_ + 1;
      end;
       SetLength(Stresses,br_,6);
       br_ := -1;
      Reset(File_content_);
      while not eof(file_content_) do
      begin
         readln(file_content_,c);
         if (pos('g e n e r a l i z e d',c) > 0) then
         action := 1;
         if (pos('tresca',c) > 0) then
         action := 0;
         if (action = 1) and (pos('g e n e r a l i z e d',c) = 0) and (c<>'') then
         begin
         br_ := br_ + 1;
         AnzTokens := explode(A,' ',trim(c));
         br := -1;
         for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
         Stresses[br_,0] := strtoreal(A1[1]);
         Stresses[br_,1] := strtoreal(A1[2]);
         Stresses[br_,2] := strtoreal(A1[3]);
         Stresses[br_,3] := strtoreal(A1[4]);
         Stresses[br_,4] := strtoreal(A1[5]);
         Stresses[br_,5] := strtoreal(A1[6]);
         A := nil;
         A1 := nil;
         end;
      end;
Close(file_content_);
end;
procedure deform_input_output_read(const str_ : string;
                                   var Nodes : TRealRealArray;
                                   var Elements : TIntegerIntegerArray;
                                   var Stresses:TRealRealArray;
                                   var Displacements:TRealRealArray;
                                   var AccumulatedPlasticStrain:TRealRealArray);
var
  c,str : string;
  br,counter,AnzTokens,i,node_number,action, element_number, node_number_in_element,br_,counter_,counter_1 : integer;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    action := 0;
    counter := 0;
    counter_ := -1;
    counter_1 := -1;
    br_ := 0;
    str := '';
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         counter := counter + 1;
         readln(file_content_,c);
         if (pos('RZ',uppercase(c)) = 1) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[2]);
            Action := 1;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(Nodes,node_number,4);
         end;
         if (pos('ELMCON',uppercase(c)) > 0) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            element_number := strtoint(A1[2]);
            node_number_in_element := strtoint(A1[3]);
            action := 2;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(Elements,element_number,21);
         end;
          if (pos('URZ',uppercase(c)) > 0) then
         begin
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[2]);
            A := nil;
            A1 := nil;
            Action := 5;
            counter := 0;

            SetLength(Displacements,length(Nodes),3);
            for I := 0 to high(nodes) do
              begin
                Displacements[i,0] := 0;
                Displacements[i,1] := 0;
                Displacements[i,2] := 0;
              end;

         end;
        if (pos('STRESS',uppercase(c)) > 0) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[4]);
            element_number := strtoint(A1[2]);
            Action := 3;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(Stresses,node_number,6);
         end;
         if (pos('STRAIN',uppercase(c)) > 0) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[4]);
            element_number := strtoint(A1[2]);
            Action := 4;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(AccumulatedPlasticStrain,length(Nodes),1);
            for I := 0 to high(Nodes) do
            AccumulatedPlasticStrain[i,0] := 0;
              
         end;
        if (counter>0) and (counter<=node_number) and (action=1) then
        begin
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Nodes[counter-1,0] := strtoint(A1[0]);
             Nodes[counter-1,1] := strtoreal(A1[1]);
             Nodes[counter-1,2] := strtoreal(A1[2]);
             Nodes[counter-1,3] := strtoreal(A1[3]);
             A := nil;
             A1 := nil;
        end;
        if (counter>0)and (counter<=element_number) and (action=2) then
        begin
           br := -1;
           AnzTokens := explode(A,' ',trim(c));
           for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
           for i := 0 to node_number_in_element do
            begin
              if i=0 then
              Elements[counter-1,i] := strtoint(A1[i])
              else
              Elements[counter-1,i] := strtoint(A1[i]);
            end;
         A := nil;
         A1 := nil;
        end;
        if (counter>0) and (counter<=(node_number+element_number)*2) and (counter>element_number*2) and (action=3) then
        begin
           br_ := br_ + 1;
           if br_ < 2 then
           str := str + c
           else
           begin
            counter_1 := counter_1 + 1;
            str := str + c;
            AnzTokens := explode(A,' ',trim(str));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Stresses[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
             Stresses[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
             Stresses[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
             Stresses[strtoint(A1[0])-1,3] := strtoreal(A1[4]);
             Stresses[strtoint(A1[0])-1,4] := strtoreal(A1[5]);
             Stresses[strtoint(A1[0])-1,5] := strtoreal(A1[6]);
             A := nil;
             A1 := nil;
             br_ := 0;
             str := '';
           end;
        end;
        if (counter>0) and (counter<=node_number) and (action=5) then
        begin
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            counter_ := counter_ + 1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Displacements[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
             Displacements[strtoint(A1[0])-1,1] := strtoreal(A1[2]);
             Displacements[strtoint(A1[0])-1,2] := strtoreal(A1[3]);
             A := nil;
             A1 := nil;
             br_ := 0;
             str := '';
        end;
        if (counter>0) and (counter<=(node_number+element_number)) and (counter>element_number) and (action=4) then
        begin

            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             AccumulatedPlasticStrain[strtoint(A1[0])-1,0] := strtoreal(A1[1]);
             A := nil;
             A1 := nil;
             br_ := 0;
        end;
        end;
    Close(file_content_);
end;
procedure deform_input_read(const str_ : string;
                            var Nodes : TRealRealArray;
                            var Elements : TIntegerIntegerArray);
var
  c,str : string;
  br,counter,AnzTokens,i,node_number,action, element_number, node_number_in_element,br_,counter_,counter_1 : integer;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    action := 0;
    counter := 0;
    counter_ := -1;
    counter_1 := -1;
    br_ := 0;
    str := '';
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         counter := counter + 1;
         readln(file_content_,c);
         if (pos('RZ',uppercase(c)) = 1) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[2]);
            Action := 1;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(Nodes,node_number,4);
         end;
         if (pos('ELMCON',uppercase(c)) > 0) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            element_number := strtoint(A1[2]);
            node_number_in_element := strtoint(A1[3]);
            action := 2;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(Elements,element_number,21);
         end;

        if (counter>0) and (counter<=node_number) and (action=1) then
        begin
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             Nodes[counter-1,0] := strtoint(A1[0]);
             Nodes[counter-1,1] := strtoreal(A1[1]);
             Nodes[counter-1,2] := strtoreal(A1[2]);
             Nodes[counter-1,3] := strtoreal(A1[3]);
             A := nil;
             A1 := nil;
        end;
        if (counter>0)and (counter<=element_number) and (action=2) then
        begin
           br := -1;
           AnzTokens := explode(A,' ',trim(c));
           for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
           for i := 0 to node_number_in_element do
            begin
              if i=0 then
              Elements[counter-1,i] := strtoint(A1[i])
              else
              Elements[counter-1,i] := strtoint(A1[i]);
            end;
         A := nil;
         A1 := nil;
        end;
        end;
    Close(file_content_);
end;
procedure vulcan_input_read (const str_ : string;
                                   var Nodes : TRealRealArray;
                                   var Elements : TIntegerIntegerArray);
var
  c,c1 : string;
  file_content : textfile;
  A,A1 : TShortStringArray;
  br, br1, br2, AnzTokens, i, el_number, j : integer;
  action : integer;
  new_row,new_row_2 : boolean;
begin
action := 0;
br1 := -1;
br2 := -1;
    Assignfile(file_content,str_);
    Reset(file_content);
    while not eof(file_content) do
    begin
         readln(file_content,c1);
         c := LowerCase(c1);
         if (pos('coordinates',c)>0) then
            begin
             action := 1;

            end;
        if (pos('elements',c)>0) then
            begin
             action := 2;

             end;
        if (pos('end elements',c)>0) or (pos('end coordinates',c)>0)  then
            begin
             action := 3;
            end;
        if (action = 1) and (pos('coordinates',c)=0) then
          begin
            br1 := br1 + 1;
          end;
        if (action = 2) and (pos('elements',c)=0) then
          begin
            inc(br2);
            if (br2 = 0) then
            begin
            AnzTokens := explode(A,' ',trim(c));
                 br := -1;
                 for i := low(A) to high(A) do
                 begin
                        if A[i] <> '' then
                        begin
                        br := br + 1;
                        setlength(A1,length(A1)+1);
                        A1[br] := A[i];
                        end;
                end;
            end;
            el_number := br;
            A := nil;
            A1 := nil;
          end;
    end;
    closefile(file_content);
    SetLength(Nodes,br1+1,4);
    SetLength(Elements,br2+1,21);

    br1 := -1;
    br2 := -1;
    Assignfile(file_content,str_);
    Reset(file_content);
    while not eof(file_content) do
    begin
         readln(file_content,c1);
         c := LowerCase(c1);
         if (pos('coordinates',c)>0) then
            begin
             action := 1;
            end;
        if (pos('elements',c)>0) then
            begin
             action := 2;
             end;
        if (pos('end elements',c)>0) or (pos('end coordinates',c)>0)  then
            begin
             action := 3;
            end;
        if (action = 1) and (pos('coordinates',trim(c))=0) then
          begin
            br1 := br1 + 1;
                AnzTokens := explode(A,chr(9),trim(c));
                 br := -1;
                 for i := low(A) to high(A) do
                 begin
                        if A[i] <> '' then
                        begin
                        br := br + 1;
                        setlength(A1,length(A1)+1);
                        A1[br] := A[i];
                        end;
                end;
                Nodes[br1,0] :=  strtoreal(trim(A1[0]));
                Nodes[br1,1] := strtoreal(trim(A1[1]));
                Nodes[br1,2] := strtoreal(trim(A1[2]));
                Nodes[br1,3] := strtoreal(trim(A1[3]));
                //showmessage(A1[1]+A1[2]+A1[3]);
                A := nil;
                A1 := nil;
          end;
        if (action = 2) and (pos('elements',c)=0) then
          begin
            br2 := br2 + 1;
            AnzTokens := explode(A,' ',trim(c));
                 br := -1;
                 for i := low(A) to high(A) do
                 begin
                        if A[i] <> '' then
                        begin
                        br := br + 1;
                        setlength(A1,length(A1)+1);
                        A1[br] := A[i];
                        end;
                end;
            for j := low(A1) to high(A1)-1 do
            begin
              Elements[br2,j] := strtoint(trim(A1[j]));
            end;
            A := nil;
            A1 := nil;
          end;
      end;
      closefile(file_content);
end;
procedure vulcan_output_read (const str_ : string;
                              var Stresses:TRealRealArray;
                              var Displacements:TRealRealArray);
var
c,c1 : string;
file_content : textfile;
A,A1 : TShortStringArray;
br, br1, br2, action, AnzTokens, i : integer;
begin
action := 0;
br1 := -1;
br2 := -1;
    Assignfile(file_content,str_);
    Reset(file_content);
    while not eof(file_content) do
    begin
         readln(file_content,c1);
         c := LowerCase(c1);
         if (pos('result',c)>0) and (pos('displacements',c)>0) then
            begin
             action := 11;
            end;
        if (pos('result',c)>0) and (pos('"stresses',c)>0) then
            begin
             action := 12;
             end;
        if (pos('values',c)>0) and (action = 11) then
            begin
              action := 1;
            end;
        if (pos('values',c)>0) and (action = 12) then
            begin
              action := 2;
            end;
        if (pos('end values',c)>0)  then
            begin
             action := 3;
            end;
        if (action = 1) and (pos('values',c)=0) then
          begin
            br1 := br1 + 1;
          end;
        if (action = 2) and (pos('values',c)=0) then
          begin
            br2 := br2 + 1;
          end;
    end;
    closefile(file_content);
    SetLength(Stresses,br2+1,6);
    SetLength(Displacements,br1+1,3);

    action := 0;
    br1 := -1;
    br2 := -1;
    Assignfile(file_content,str_);
    Reset(file_content);
    while not eof(file_content) do
    begin
         readln(file_content,c1);
         c := LowerCase(c1);
         if (pos('result',c)>0) and (pos('displacements',c)>0) then
            begin
             action := 11;
            end;
        if (pos('result',c)>0) and (pos('"stresses',c)>0) then
            begin
             action := 12;
             end;
        if (pos('values',c)>0) and (action = 11) then
            begin
              action := 1;
            end;
        if (pos('values',c)>0) and (action = 12) then
            begin
              action := 2;
            end;
        if (pos('end values',c)>0)  then
            begin
             action := 3;
            end;
        if (action = 1) and (pos('values',c)=0) then
          begin
            br1 := br1 + 1;
            AnzTokens := explode(A,' ',trim(c));
                 br := -1;
                 for i := low(A) to high(A) do
                 begin
                        if A[i] <> '' then
                        begin
                        br := br + 1;
                        setlength(A1,length(A1)+1);
                        A1[br] := A[i];
                        end;
                end;
                Displacements[br1,0] := strtoreal(trim(A1[1]));
                Displacements[br1,1] := strtoreal(trim(A1[2]));
                Displacements[br1,2] := strtoreal(trim(A1[3]));
                A := nil;
                A1 := nil;
          end;
        if (action = 2) and (pos('values',c)=0) then
          begin
            br2 := br2 + 1;
            AnzTokens := explode(A,' ',trim(c));
                 br := -1;
                 for i := low(A) to high(A) do
                 begin
                        if A[i] <> '' then
                        begin
                        br := br + 1;
                        setlength(A1,length(A1)+1);
                        A1[br] := A[i];
                        end;
                end;
                Stresses[br2,0] := strtoreal(trim(A1[1]));
                Stresses[br2,1] := strtoreal(trim(A1[2]));
                Stresses[br2,2] := strtoreal(trim(A1[3]));
                Stresses[br2,3] := strtoreal(trim(A1[4]));
                Stresses[br2,4] := strtoreal(trim(A1[5]));
                Stresses[br2,5] := strtoreal(trim(A1[6]));
                A := nil;
                A1 := nil;
          end;
    end;
    closefile(file_content);

end;
procedure morpheo_input_read(XMLDocument1: TXMLDocument;
                            const str_ : string;
                            var Nodes : TRealRealArray;
                            var Elements : TIntegerIntegerArray);
var
{$IFNDEF FPC}
  piece : IXMLNode;
{$ELSE}
  piece : TDOMNode;
{$ENDIF}
c : string;
file_content_ : textfile;
A,A1 : TShortStringArray;
node_number,element_number,action,counter,AnzTokens,br,i,counter_2,counter_3 : integer;
counter_4,counter_5,counter_6: integer;
point : boolean;
begin
{$IFNDEF FPC}
    XMLDocument1.LoadFromFile(str_);
    xmldocument1.Active;
    piece := xmldocument1.DocumentElement.ChildNodes.First.ChildNodes.FindNode('Piece');
    node_number := piece.Attributes['NumberOfPoints'];
    element_number := piece.Attributes['NumberOfCells'];
{$ELSE}
    ReadXMLFile(XMLDocument1, str_);
    piece := xmldocument1.DocumentElement.FirstChild.FindNode('Piece');
    node_number := StrToInt(piece.Attributes.GetNamedItem('NumberOfPoints').NodeValue);
    element_number := StrToInt(piece.Attributes.GetNamedItem('NumberOfCells').NodeValue);
{$ENDIF}
    counter := -1;
    counter_2 := -1;
    counter_3 := -1;
    counter_4 := -1;
    counter_5 := -1;
    counter_6 := -1;
    point := false;



    action := 0;
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('<PointData',c) > 0) then
         point := true;
         if (pos('</PointData>',c) > 0) then
         point := false;
         if (pos('<DataArray',c) > 0) and (pos('coordinates',lowercase(c)) > 0)  then
         begin
         action := 1;
         SetLength(Nodes,node_number,4);
         end;
         if (pos('<DataArray',c) > 0) and (pos('connectivity',lowercase(c)) > 0) then
         begin
         action := 2;
         SetLength(Elements,element_number,21);
         end;

         if (pos('</DataArray>',c) > 0) then
         action := 0;

         if (action = 1) and (pos('<DataArray',c) = 0) then
         begin
           counter := counter + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          Nodes[counter,0] := counter + 1;
          Nodes[counter,1] := strtoreal(A1[0]);
          Nodes[counter,2] := strtoreal(A1[1]);
          Nodes[counter,3] := strtoreal(A1[2]);
          A := nil;
          A1 := nil;
         end;
        if (action = 2) and (pos('<DataArray',c) = 0) then
        begin
          counter_2 := counter_2 + 1;
          AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            for I := 0 to length(A1)  do
              begin
                if i = 0 then
                 Elements[counter_2,i] := counter_2 + 1
                 else
                  Elements[counter_2,i] := strtoint(A1[i-1])+1;
              end;
          A := nil;
          A1 := nil;
        end;
        end;
    Close(file_content_);
end;
procedure morpheo_input_output_read(XMLDocument1: TXMLDocument;
                                    const str_ : string;
                                    var Nodes : TRealRealArray;
                                    var Elements : TIntegerIntegerArray;
                                    var Stresses:TRealRealArray;
                                    var Displacements:TRealRealArray;
                                    var TotalStrains:TRealRealArray;
                                    var AccumulatedStrain:TRealRealArray);
var
{$IFNDEF FPC}
  piece : IXMLNode;
{$ELSE}
  piece : TDOMNode;
{$ENDIF}
c : string;
file_content_ : textfile;
A,A1 : TShortStringArray;
node_number,element_number,action,counter,AnzTokens,br,i,counter_2,counter_3 : integer;
counter_4,counter_5,counter_6: integer;
point : boolean;
begin
{$IFNDEF FPC}
     XMLDocument1.LoadFromFile(str_);
     xmldocument1.Active;
     piece := xmldocument1.DocumentElement.ChildNodes.First.ChildNodes.FindNode('Piece');
     node_number := piece.Attributes['NumberOfPoints'];
     element_number := piece.Attributes['NumberOfCells'];
{$ELSE}
     ReadXMLFile(XMLDocument1, str_);
     piece := xmldocument1.DocumentElement.FirstChild.FindNode('Piece');
     node_number := StrToInt(piece.Attributes.GetNamedItem('NumberOfPoints').NodeValue);
     element_number := StrToInt(piece.Attributes.GetNamedItem('NumberOfCells').NodeValue);
{$ENDIF}
    counter := -1;
    counter_2 := -1;
    counter_3 := -1;
    counter_4 := -1;
    counter_5 := -1;
    counter_6 := -1;
    point := false;



    action := 0;
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('<PointData',c) > 0) then
         point := true;
         if (pos('</PointData>',c) > 0) then
         point := false;
         if (pos('<DataArray',c) > 0) and (pos('coordinates',lowercase(c)) > 0)  then
         begin
         action := 1;
         SetLength(Nodes,node_number,4);
         end;
         if (pos('<DataArray',c) > 0) and (pos('connectivity',lowercase(c)) > 0) then
         begin
         action := 2;
         SetLength(Elements,element_number,21);
         end;
         if (pos('<DataArray',c) > 0) and (pos('stress',lowercase(c)) > 0) and (point = true) then
         begin
         action := 3;
         SetLength(Stresses,node_number,6);
         end;
         if (pos('<DataArray',c) > 0) and (pos('displacement',lowercase(c)) > 0) and (point = true) then
         begin
         action := 4;
         SetLength(Displacements,node_number,3);
         end;
          if (pos('<DataArray',c) > 0) and (pos('"strain',lowercase(c)) > 0) and (point = true) then
         begin
         action := 5;
         SetLength(TotalStrains,node_number,6);
         end;
          if (pos('<DataArray',c) > 0) and (pos('accumulated_plastic_strain',lowercase(c)) > 0) and (point = true) then
         begin
         action := 6;
         SetLength(AccumulatedStrain,node_number,1);
         end;
         if (pos('</DataArray>',c) > 0) then
         action := 0;

         if (action = 1) and (pos('<DataArray',c) = 0) then
         begin
           counter := counter + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          Nodes[counter,0] := counter + 1;
          Nodes[counter,1] := strtoreal(A1[0]);
          Nodes[counter,2] := strtoreal(A1[1]);
          Nodes[counter,3] := strtoreal(A1[2]);
          A := nil;
          A1 := nil;
         end;
        if (action = 2) and (pos('<DataArray',c) = 0) then
        begin
          counter_2 := counter_2 + 1;
          AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            for I := 0 to length(A1)  do
              begin
                if i = 0 then
                 Elements[counter_2,i] := counter_2 + 1
                 else
                  Elements[counter_2,i] := strtoint(A1[i-1])+1;
              end;
          A := nil;
          A1 := nil;
        end;
        if (action = 3) and (pos('<DataArray',c) = 0) then
        begin
           counter_3 := counter_3 + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          Stresses[counter_3,0] := strtoreal(A1[0]);
          Stresses[counter_3,1] := strtoreal(A1[4]);
          Stresses[counter_3,2] := strtoreal(A1[8]);
          Stresses[counter_3,3] := strtoreal(A1[1]);
          Stresses[counter_3,4] := strtoreal(A1[5]);
          Stresses[counter_3,5] := strtoreal(A1[2]);
          A := nil;
          A1 := nil;
        end;
        if (action = 4) and (pos('<DataArray',c) = 0) then
        begin
           counter_4 := counter_4 + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          Displacements[counter_4,0] := strtoreal(A1[0]);
          Displacements[counter_4,1] := strtoreal(A1[1]);
          Displacements[counter_4,2] := strtoreal(A1[2]);
          A := nil;
          A1 := nil;
        end;
        if (action = 5) and (pos('<DataArray',c) = 0) then
        begin
           counter_5 := counter_5 + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          TotalStrains[counter_5,0] := strtoreal(A1[0]);
          TotalStrains[counter_5,1] := strtoreal(A1[4]);
          TotalStrains[counter_5,2] := strtoreal(A1[8]);
          TotalStrains[counter_5,3] := strtoreal(A1[1]);
          TotalStrains[counter_5,4] := strtoreal(A1[5]);
          TotalStrains[counter_5,5] := strtoreal(A1[2]);
          A := nil;
          A1 := nil;
        end;
        if (action = 6) and (pos('<DataArray',c) = 0) then
        begin
           counter_6 := counter_6 + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          AccumulatedStrain[counter_6,0] := strtoreal(A1[0]);
          A := nil;
          A1 := nil;
        end;
        end;
    Close(file_content_);
end;
 procedure ansys_input_integration_points_read(const str : string;
                                               var  Nodes:TRealRealArray);
var
  c : string;
  file_content : textfile;
  A,A1 : TShortStringArray;
  AnzTokens,i,action,br,br_ : integer;
  element_number : integer;
begin
    action := 3;
    br := -1;
    Assignfile(file_content,str);
    Reset(file_content);
      while not eof(file_content) do
        begin
         readln(file_content,c);
         if (pos('NODE',c)>0) and  (pos('XC',c)>0) and (pos('YC',c)>0) then
            begin
             action := 1;
             end;
         if (pos('ELEMENT=',c)>0) or (c='1') or (trim(c) = '') then
            begin
             action := 3;
             end;
         if (action=1) and (pos('NODE',c)=0) then
             begin
               br := br + 1;
             end

        end;
    Close(file_content);
    SetLength(Nodes,br+1,4);


    action := 3;
    br := -1;
    Assignfile(file_content,str);
    Reset(file_content);
      while not eof(file_content) do
        begin
         readln(file_content,c);
         if (pos('NODE',c)>0) and  (pos('XC',c)>0) and (pos('YC',c)>0) then
            begin
             action := 1;

             end;
         if (pos('ELEMENT=',c)>0) or (c='1') or (trim(c) = '') then
            begin
             action := 3;
             end;
         if (pos('ELEMENT=',c)>0) then
            begin
             action := 2;
              br_ := -1;
             AnzTokens := explode(A,' ',trim(c));
                for i := low(A) to high(A) do
                 begin
                        if A[i] <> '' then
                        begin
                        br_ := br_ + 1;
                        setlength(A1,length(A1)+1);
                        A1[br_] := A[i];
                        end;
                end;
                element_number :=  strtoint(A1[1]);
                A := nil;
                A1 := nil
             end;
         if (action=1) and (pos('NODE',c)=0) then
             begin
               br := br + 1;
               br_ := -1;
               AnzTokens := explode(A,' ',trim(c));
                for i := low(A) to high(A) do
                 begin
                        if A[i] <> '' then
                        begin
                        br_ := br_ + 1;
                        setlength(A1,length(A1)+1);
                        A1[br_] := A[i];
                        end;
                end;
                Nodes[br,0] := element_number;
                Nodes[br,1] := strtoreal(A1[1]);
                Nodes[br,2] := strtoreal(A1[2]);
                Nodes[br,3] := strtoreal(A1[3]);
                 A := nil;
                 A1 := nil;
             end;

        end;
    Close(file_content);

end;

procedure XML_input_read (const str_: string;
                          Displacements:TRealRealArray);
var
file_content_ :  textfile;
action,counter,AnzTokens,br,i: integer;
A,A1 : TShortStringArray;
c : string;
begin
  counter := -1;
  Assignfile(file_content_,str_);
  Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('<',c) > 0) then
         action := 0;
         if (pos('<DataArray',c) > 0) and (pos('displacement',c) > 0) then
         action := 1;

         if (action = 1) and (pos('<DataArray',c) = 0) then
         begin
           counter := counter + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          Displacements[counter,0] := Displacements[counter,0] + strtoreal(A1[0]);
          Displacements[counter,1] := Displacements[counter,1] + strtoreal(A1[1]);
          Displacements[counter,2] := Displacements[counter,2] + strtoreal(A1[2]);
          A := nil;
          A1 := nil;
        end;
      end;
    Close(file_content_);
end;
{

procedure deform_input_read(const str_ : string);
var
  c : string;
  br,counter,AnzTokens,i,node_number,action, element_number, node_number_in_element : integer;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    action := 0;
    counter := 0;
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         counter := counter + 1;
         readln(file_content_,c);
         if (pos('RZ',uppercase(c)) = 1) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[2]);
            Action := 1;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(form1.node_number_2,node_number);
            SetLength(form1.x_coord_2,node_number);
            SetLength(form1.y_coord_2,node_number);
            SetLength(form1.z_coord_2,node_number);
         end;
         if (pos('ELMCON',uppercase(c)) > 0) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            element_number := strtoint(A1[2]);
            node_number_in_element := strtoint(A1[3]);
            action := 2;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(form1.elements_2,element_number,node_number_in_element+1);
         end;
        if (counter>0) and (counter<=node_number) and (action=1) then
        begin
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             form1.node_number_2[counter-1] := strtoint(A1[0]);
             form1.x_coord_2[counter-1] := strtoreal(A1[1]);
             form1.y_coord_2[counter-1] := strtoreal(A1[2]);
             form1.z_coord_2[counter-1] := strtoreal(A1[3]);
             A := nil;
             A1 := nil;
        end;
        if (counter>0)and (counter<=element_number) and (action=2) then
        begin
           br := -1;
           AnzTokens := explode(A,' ',trim(c));
           for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
           for i := 0 to node_number_in_element do
            begin
              if i=0 then
              form1.elements_2[counter-1,i] := strtoint(A1[i])
              else
              form1.elements_2[counter-1,i] := strtoint(A1[i]);
            end;
         A := nil;
         A1 := nil;
        end;

        end;
    Close(file_content_);
end;
procedure deform_input_output_read(const str_ : string);
var
  c,str : string;
  br,counter,AnzTokens,i,node_number,action, element_number, node_number_in_element,br_,counter_ : integer;
  file_content_ : textfile;
  A,A1 : TShortStringArray;
begin
    action := 0;
    counter := 0;
    counter_ := -1;
    br_ := 0;
    str := '';
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         counter := counter + 1;
         readln(file_content_,c);
         if (pos('RZ',uppercase(c)) = 1) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[2]);
            Action := 1;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(form1.node_number,node_number);
            SetLength(form1.x_coord,node_number);
            SetLength(form1.y_coord,node_number);
            SetLength(form1.z_coord,node_number);
         end;
         if (pos('ELMCON',uppercase(c)) > 0) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            element_number := strtoint(A1[2]);
            node_number_in_element := strtoint(A1[3]);
            action := 2;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(form1.elements,element_number,node_number_in_element+1);
         end;
        if (pos('STRESS',uppercase(c)) > 0) then
         begin
         AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            node_number := strtoint(A1[4]);
            element_number := strtoint(A1[2]);
            Action := 3;
            A := nil;
            A1 := nil;
            counter := 0;
            SetLength(form1.stress11,node_number);
            SetLength(form1.stress22,node_number);
            SetLength(form1.stress33,node_number);
            SetLength(form1.stress12,node_number);
            SetLength(form1.stress23,node_number);
            SetLength(form1.stress13,node_number);
         end;
        if (counter>0) and (counter<=node_number) and (action=1) then
        begin
            AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             form1.node_number[counter-1] := strtoint(A1[0]);
             form1.x_coord[counter-1] := strtoreal(A1[1]);
             form1.y_coord[counter-1] := strtoreal(A1[2]);
             form1.z_coord[counter-1] := strtoreal(A1[3]);
             A := nil;
             A1 := nil;
        end;
        if (counter>0)and (counter<=element_number) and (action=2) then
        begin
           br := -1;
           AnzTokens := explode(A,' ',trim(c));
           for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
           for i := 0 to node_number_in_element do
            begin
              if i=0 then
              form1.elements[counter-1,i] := strtoint(A1[i])
              else
              form1.elements[counter-1,i] := strtoint(A1[i]);
            end;
         A := nil;
         A1 := nil;
        end;
        if (counter>0) and (counter<=(node_number+element_number)*2) and (counter>element_number*2) and (action=3) then
        begin
           br_ := br_ + 1;
           if br_ < 2 then
           str := str + c
           else
           begin
            counter_ := counter_ + 1;
            str := str + c;
            AnzTokens := explode(A,' ',trim(str));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
             form1.stress11[counter_] := strtoreal(A1[1]);
             form1.stress22[counter_] := strtoreal(A1[2]);
             form1.stress33[counter_] := strtoreal(A1[3]);
             form1.stress12[counter_] := strtoreal(A1[4]);
             form1.stress23[counter_] := strtoreal(A1[5]);
             form1.stress13[counter_] := strtoreal(A1[6]);
             A := nil;
             A1 := nil;
             br_ := 0;
             str := '';
           end;
        end;
        end;
    Close(file_content_);
end;
procedure morpheo_input_read(const str_ : string);
var
piece : IXMLNode;
c : string;
file_content_ : textfile;
A,A1 : TShortStringArray;
node_number,element_number,action,counter,AnzTokens,br,i,counter_2 : integer;
begin
form1.XMLDocument1.LoadFromFile(str_);
form1.xmldocument1.Active;
piece := form1.xmldocument1.DocumentElement.ChildNodes.First.ChildNodes.FindNode('Piece');
node_number := piece.Attributes['NumberOfPoints'];
element_number := piece.Attributes['NumberOfCells'];
    counter := -1;
    counter_2 := -1;
    SetLength(form1.node_number_2,node_number);
    SetLength(form1.x_coord_2,node_number);
    SetLength(form1.y_coord_2,node_number);
    SetLength(form1.z_coord_2,node_number);


    action := 0;
    Assignfile(file_content_,str_);
    Reset(File_content_);
      while not eof(file_content_) do
        begin
         readln(file_content_,c);
         if (pos('<DataArray',c) > 0) and (pos('coordinates',c) > 0) then
         action := 1;
         if (pos('<DataArray',c) > 0) and (pos('connectivity',c) > 0) then
         action := 2;
         if (pos('</DataArray>',c) > 0) then
         action := 0;

         if (action = 1) and (pos('<DataArray',c) = 0) then
         begin
           counter := counter + 1;
           AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
          form1.node_number_2[counter] := counter + 1;
          form1.x_coord_2[counter] := strtoreal(A1[0]);
          form1.y_coord_2[counter] := strtoreal(A1[1]);
          form1.z_coord_2[counter] := strtoreal(A1[2]);
          A := nil;
          A1 := nil;
         end;
        if (action = 2) and (pos('<DataArray',c) = 0) then
        begin
          counter_2 := counter_2 + 1;
          AnzTokens := explode(A,' ',trim(c));
            br := -1;
            for i := low(A) to high(A) do
            begin
                 if A[i] <> '' then
                 begin
                   br := br + 1;
                   setlength(A1,length(A1)+1);
                   A1[br] := A[i];
                 end;
            end;
            if counter_2 = 0  then
            begin
              SetLength(form1.elements_2,element_number,length(A1)+1);
              for I := 0 to length(A1) do
              begin
                if i = 0 then
                 form1.elements_2[counter_2,i] := counter_2+1
                 else
                  form1.elements_2[counter_2,i] := strtoint(A1[i-1])+1;
              end;

            end
            else
            begin
               for I := 0 to length(A1) do
              begin
                if i = 0 then
                 form1.elements_2[counter_2,i] := counter_2 + 1
                 else
                  form1.elements_2[counter_2,i] := strtoint(A1[i-1])+1;
              end;
            end;
          A := nil;
          A1 := nil;
        end;
        end;
    Close(file_content_);

end;
procedure vulcan_input_read (const str_ : string);

}
end.

