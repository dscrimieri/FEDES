
unit parsers;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface
uses
{$IFNDEF FPC}
  XMLIntf,
{$ELSE}
{$ENDIF}
  math,type_of_model,SysUtils,data,Dialogs;

//================== Abaqus prosedures for outputting subroutines SIGINI===============
procedure FortranNPM(const path : string;
                     const ScaleFactor : string;
                     const Nodes : TRealRealArray;
                     const Stresses : TRealRealArray;
                     const AccumulatedStrain : TrealRealArray);
procedure FortranDMUFP(const path : string;
                       const ScaleFactor : string;
                       const Nodes : TRealRealArray;
                       const Stresses : TRealRealArray;
                       const AccumulatedStrain : TrealRealArray);
procedure FortranDMUE (const path : string;
                       const ScaleFactor : string;
                       const Nodes : TRealRealArray;
                       const Elements : TIntegerIntegerArray;
                       const NodesInElement : TIntegerArray;
                       const Stresses : TRealRealArray;
                       const AccumulatedStrain : TrealRealArray);
procedure FortranMUESF(const path : string;
                       const ScaleFactor : string;
                       const Nodes : TRealRealArray;
                       const Elements : TIntegerIntegerArray;
                       const NodesInElement : TIntegerArray;
                       const Stresses : TRealRealArray;
                       const AccumulatedStrain : TrealRealArray);
//procedure FortranMUESF(memo1:TMemo;s_factor:string);
{
//================== Abaqus prosedures for outputting subroutines HARDANI===============
procedure hardani_distance_method_in_element(memo1:TMemo;s_factor:string);
procedure hardani_distance_method_in_field_of_points(memo1:TMemo;s_factor:string);
procedure create_abaqus_input_file(memo1:TMemo);
//============================== Abaqus  ===============================



//=================== Ansys prosedure for outputting ISSTERSS file =============
procedure create_ansys_isstress_file(memo : TMemo;s_factor : string);
procedure create_ansys_isstress_file1(memo : TMemo;s_factor : string);
//=================== Deform procedure for outputting KEY file =================
procedure create_deform_key_file(const s1,s2,s3,s12,s23,s13 : array of real;memo : TMemo;str_ : string);
//=================== Morpheo procedure for outputting XML file ================
procedure create_morpheo_nodal_stress (memo : Tmemo; str_ : string);
procedure create_morpheo_element_stress (const s1,s2,s3,s12,s23,s13 : array of real; memo : Tmemo; str_ : string);
//==================== Marc procsedure  for outputin t19 file ==================
procedure create_marc_output_file (const s1,s2,s3 : array of real;memo:Tmemo;str_ : string);
//=================== Neutral XML file for model one ===========================
}

//procedure create_xml1(savedialog:Tsavedialog);
//=================== Neutral XML file for model two ===========================
//============================ Abaqus Input file  ==============================
procedure CreateFortranAbaqusFile(const filename1: string;
                                  const filename2: string;
                                  const Nodes : TRealRealArray;
                                  const Displacements : TRealRealArray;
                                  const Stresses : TRealRealArray;
                                  const AccumulatedStrain : TRealRealArray);
procedure CreateAbaqusFile(const filename1: string;
                           const filename2: string;
                           const Nodes : TRealRealArray;
                           const Elements : TIntegerIntegerArray;
                           const Stresses : TRealRealArray;
                           const Displacements : TRealRealArray;
                           const TotalStrains : TRealRealArray;
                           const PlasticStrains : TRealRealArray;
                           const AccumulatedStrains : TRealRealArray);
procedure createXML2(const filename: string;
                    const Nodes : TRealRealArray;
                    const Elements: TIntegerIntegerArray;
                    const NodesInElement : TIntegerArray;
                    const Stresses : TRealRealArray;
                    const Displacements : TRealRealArray;
                    const TotalStrains : TRealRealArray;
                    const PlasticStrains : TRealRealArray;
                    const AccumulatedStrains : TRealRealArray);

procedure createXML1(const filename: string;
                    const Nodes : TRealRealArray;
                    const Elements: TIntegerIntegerArray;
                    const NodesInElement : TIntegerArray;
                    const Stresses : TRealRealArray;
                    const Displacements : TRealRealArray;
                    const TotalStrains : TRealRealArray;
                    const PlasticStrains : TRealRealArray;
                    const AccumulatedStrains : TRealRealArray);

procedure CreateAnsysFiles(const filename: string;
                           const Nodes : TRealRealArray;
                           const NodesInIntegration :  TRealRealArray;
                           const Elements: TIntegerIntegerArray;
                           const NodesInElement : TIntegerArray;
                           const Stresses : TRealRealArray;
                           const Displacements : TRealRealArray;
                           const TotalStrains : TRealRealArray;
                           const PlasticStrains : TRealRealArray;
                           const AccumulatedStrains : TRealRealArray);
procedure CreateDeformFile( const filename1: string;
                            const filename2: string;
                            const Nodes : TRealRealArray;
                            const Elements: TIntegerIntegerArray;
                            const NodesInElement : TIntegerArray;
                            const Stresses : TRealRealArray;
                            const Displacements : TRealRealArray;
                            const TotalStrains : TRealRealArray;
                            const PlasticStrains : TRealRealArray;
                            const AccumulatedStrains : TRealRealArray);
procedure CreateMorpheoFile( const filename1: string;
                            const filename2: string;
                            const Nodes : TRealRealArray;
                            const Elements: TIntegerIntegerArray;
                            const NodesInElement : TIntegerArray;
                            const Stresses : TRealRealArray;
                            const Displacements : TRealRealArray;
                            const TotalStrains : TRealRealArray;
                            const PlasticStrains : TRealRealArray;
                            const AccumulatedStrains : TRealRealArray);
implementation

procedure FortranNPM(const path : string;
                     const ScaleFactor : string;
                     const Nodes : TRealRealArray;
                     const Stresses : TRealRealArray;
                     const AccumulatedStrain : TrealRealArray);
var
  k,br,br_to_3,v : integer;
  str_stress11,str_stress22,str_stress33 : string;
  str_coord1,str_coord2,str_coord3 : string;
  str_element : string;
  MyFile : textfile;
  stress_length, node_length, AccumulatedStrain_length : integer;
  z_coord,s3,s5,s6 : real;
begin
if (Stresses <> nil)or(AccumulatedStrain <> nil) then
begin
z_coord := sum_array_col(Nodes,3);
s3:= sum_array_col(Stresses,2);
s5:= sum_array_col(Stresses,4);
s6:= sum_array_col(Stresses,5);
stress_length := length(Stresses);
AccumulatedStrain_length := length(AccumulatedStrain);
node_length := length(Nodes);
Assignfile(MyFile,path);
ReWrite(MyFile);
  if Stresses <> nil then
  Begin
  Writeln(MyFile,'      SUBROUTINE SIGINI(SIGMA,COORDS,NTENS,NCRDS,NOEL,NPT,LAYER,');
  Writeln(MyFile,'     1 KSPT,LREBAR,NAMES)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION SIGMA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: node_number,element_number,counter');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance,initial_distance');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress11('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress22('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress12('+ inttostr(stress_length)+')');
  if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress23('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress13('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(node_length)+')');
  Writeln(MyFile,'      CHARACTER NAMES(2)*80');
  for k := low(Stresses) to  high(Stresses) do
  begin
    Writeln(MyFile,'      stress11('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,0]));
    Writeln(MyFile,'      stress22('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,1]));
    Writeln(MyFile,'      stress12('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,3]));

    if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
    begin
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
    if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
    begin
    Writeln(MyFile,'      stress23('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,4]));
    Writeln(MyFile,'      stress13('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,5]));
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));

    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;

  Writeln(MyFile,'      node_number = '+inttostr(stress_length));
  Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
      Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
 if z_coord <> 0 then
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, node_number');
      Writeln(MyFile,'            x = abs(COORDS(1)-coord1(i))**2');
      Writeln(MyFile,'            y = abs(COORDS(2)-coord2(i))**2');
      Writeln(MyFile,'            z = abs(COORDS(3)-coord3(i))**2');
      Writeln(MyFile,'            distance = sqrt(x+y+z)');
      Writeln(MyFile,'              IF (distance < initial_distance) THEN');
      Writeln(MyFile,'                initial_distance = distance');
      Writeln(MyFile,'                counter = i');
      Writeln(MyFile,'              ENDIF');
      Writeln(MyFile,'           ENDDO');
      Writeln(MyFile,'           SIGMA(1) = stress11(counter)+(stress11(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           SIGMA(2) = stress22(counter)+(stress22(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           SIGMA(3) = stress33(counter)+(stress33(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           SIGMA(4) = stress12(counter)+(stress12(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           SIGMA(5) = stress13(counter)+(stress13(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           SIGMA(6) = stress23(counter)+(stress23(counter)*'+ScaleFactor+')');
 end
 else
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, node_number');
      Writeln(MyFile,'            x = abs(COORDS(1)-coord1(i))**2');
      Writeln(MyFile,'            y = abs(COORDS(2)-coord2(i))**2');
      Writeln(MyFile,'            distance = sqrt(x+y)');
      Writeln(MyFile,'              IF (distance < initial_distance) THEN');
      Writeln(MyFile,'                initial_distance = distance');
      Writeln(MyFile,'                counter = i');
      Writeln(MyFile,'              ENDIF');
      Writeln(MyFile,'           ENDDO');
      Writeln(MyFile,'           SIGMA(1) = stress11(counter)+(stress11(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           SIGMA(2) = stress22(counter)+(stress22(counter)*'+ScaleFactor+')');
      if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
      begin
      Writeln(MyFile,'           SIGMA(3) = stress33(counter)+(stress33(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           SIGMA(4) = stress12(counter)+(stress12(counter)*'+ScaleFactor+')');
      end
      else
      Writeln(MyFile,'           SIGMA(3) = stress12(counter)+(stress12(counter)*'+ScaleFactor+')');

 end;
      Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  End;
  if AccumulatedStrain <> nil then
  Begin
  Writeln(MyFile,'      SUBROUTINE HARDINI(ALPHA,EQPS,COORDS,NTENS,NCRDS,NOEL,NPT,');
  Writeln(MyFile,'     1 LAYER,KSPT,LREBAR,REBARN)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION ALPHA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: node_number,element_number,counter');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance,initial_distance');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z');
  Writeln(MyFile,'      DOUBLEPRECISION :: eps_value');
  Writeln(MyFile,'      DOUBLEPRECISION :: eps('+ inttostr(AccumulatedStrain_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(node_length)+')');
  Writeln(MyFile,'      CHARACTER*80 REBARN');
  for k := low(AccumulatedStrain) to  high(AccumulatedStrain) do
  begin
    Writeln(MyFile,'      eps('+inttostr(k+1) + ') = ' + floattostr(AccumulatedStrain[k,0]));
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));
    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;

  Writeln(MyFile,'      node_number = '+inttostr(AccumulatedStrain_length));
    Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
      Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
 if z_coord <> 0 then
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, node_number');
      Writeln(MyFile,'            x = abs(COORDS(1)-coord1(i))**2');
      Writeln(MyFile,'            y = abs(COORDS(2)-coord2(i))**2');
      Writeln(MyFile,'            z = abs(COORDS(3)-coord3(i))**2');
      Writeln(MyFile,'            distance = sqrt(x+y+z)');
      Writeln(MyFile,'              IF (distance < initial_distance) THEN');
      Writeln(MyFile,'                initial_distance = distance');
      Writeln(MyFile,'                counter = i');
      Writeln(MyFile,'              ENDIF');
      Writeln(MyFile,'           ENDDO');
      Writeln(MyFile,'           eps_value = eps(counter)+(eps(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           if (eps_value < 0) then');
      Writeln(MyFile,'           eps_value = 0');
      Writeln(MyFile,'           endif');
      Writeln(MyFile,'           EQPS = eps_value');
 end
 else
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, node_number');
      Writeln(MyFile,'            x = abs(COORDS(1)-coord1(i))**2');
      Writeln(MyFile,'            y = abs(COORDS(2)-coord2(i))**2');
      Writeln(MyFile,'            distance = sqrt(x+y)');
      Writeln(MyFile,'              IF (distance < initial_distance) THEN');
      Writeln(MyFile,'                initial_distance = distance');
      Writeln(MyFile,'                counter = i');
      Writeln(MyFile,'              ENDIF');
      Writeln(MyFile,'           ENDDO');
      Writeln(MyFile,'           eps_value = eps(counter)+(eps(counter)*'+ScaleFactor+')');
      Writeln(MyFile,'           if (eps_value < 0) then');
      Writeln(MyFile,'           eps_value = 0');
      Writeln(MyFile,'           endif');
      Writeln(MyFile,'           EQPS = eps_value');
 end;
      Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  End;
Close(MyFile);
end;
end;

procedure FortranDMUFP(const path : string;
                       const ScaleFactor : string;
                       const Nodes : TRealRealArray;
                       const Stresses : TRealRealArray;
                       const AccumulatedStrain : TrealRealArray);
var
k,br,br_to_3,v : integer;
str_stress11,str_stress22,str_stress33 : string;
  str_coord1,str_coord2,str_coord3 : string;
  str_element : string;
  MyFile : textfile;
  stress_length, node_length, AccumulatedStrain_length : integer;
  z_coord,s3,s5,s6,eps_value : real;
begin
if (Stresses <> nil)or(AccumulatedStrain <> nil) then
begin
z_coord := sum_array_col(Nodes,3);
s3:= sum_array_col(Stresses,2);
s5:= sum_array_col(Stresses,4);
s6:= sum_array_col(Stresses,5);
stress_length := length(Stresses);
AccumulatedStrain_length := length(AccumulatedStrain);
node_length := length(Nodes);
Assignfile(MyFile,path);
ReWrite(MyFile);
  if Stresses <> nil then
  begin
  Writeln(MyFile,'      SUBROUTINE SIGINI(SIGMA,COORDS,NTENS,NCRDS,NOEL,NPT,LAYER,');
  Writeln(MyFile,'     1 KSPT,LREBAR,NAMES)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION SIGMA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: closest_node(8)');
  Writeln(MyFile,'      INTEGER :: i1,j1,k1,l1,f,br,if_coincide');
  Writeln(MyFile,'      INTEGER :: which_quadrant,ixat_solation');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress_avarage1,stress_avarage2,stress_avarage3');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress_avarage12,stress_avarage23,stress_avarage13');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress_at_1,stress_at_2,stress_at_3');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress_at_12,stress_at_23,stress_at_13');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z,initial,q_k_sum,quadr_sum');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: quadr(8),q_k(8)')
  else
  Writeln(MyFile,'      DOUBLEPRECISION :: quadr(4),q_k(4)');

  Writeln(MyFile,'      DOUBLEPRECISION :: stress11('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress22('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress12('+ inttostr(stress_length)+')');
  if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress23('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress13('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(node_length)+')');
  Writeln(MyFile,'      CHARACTER NAMES(2)*80');
  for k := low(Stresses) to  high(Stresses) do
  begin
    Writeln(MyFile,'      stress11('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,0]));
    Writeln(MyFile,'      stress22('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,1]));
    Writeln(MyFile,'      stress12('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,3]));

    if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
    begin
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
    if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
    begin
    Writeln(MyFile,'      stress23('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,4]));
    Writeln(MyFile,'      stress13('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,5]));
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));

    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;

      Writeln(MyFile,'      node_number = '+inttostr(stress_length));
      Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
      Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
  if z_coord <> 0 then
  begin
      Writeln(MyFile,'          if_coincide = 0');
      Writeln(MyFile,'          do f = 1, 8');
      Writeln(MyFile,'            quadr(f) = -1');
      Writeln(MyFile,'            closest_node(f) = -1');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          do j1 = 1, node_number');
      Writeln(MyFile,'             if ((coord1(j1)==COORDS(1)).and.(coord2(j1)==COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)==COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 0');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)<=COORDS(1)).and.(coord2(j1)<=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 1');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>COORDS(1)).and.(coord2(j1)<COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 2');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>=COORDS(1)).and.(coord2(j1)<=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)>=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 3');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)<COORDS(1)).and.(coord2(j1)<COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)>COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 4');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)<=COORDS(1)).and.(coord2(j1)>=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 5');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>COORDS(1)).and.(coord2(j1)>COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 6');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>=COORDS(1)).and.(coord2(j1)>=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)>=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 7');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if (k1 == 0) then');
      Writeln(MyFile,'                   which_quadrant = 8');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             x = abs(COORDS(1)-coord1(j1))**2');
      Writeln(MyFile,'             y = abs(COORDS(2)-coord2(j1))**2');
      Writeln(MyFile,'             z = abs(COORDS(3)-coord3(j1))**2');
      Writeln(MyFile,'             initial = sqrt(x+y+z)');
      Writeln(MyFile,'             if (which_quadrant == 0) then');
      Writeln(MyFile,'               if_coincide = 0');
      Writeln(MyFile,'               stress_at_1 = stress11(j1)');
      Writeln(MyFile,'               stress_at_2 = stress22(j1)');
      Writeln(MyFile,'               stress_at_3 = stress33(j1)');
      Writeln(MyFile,'               stress_at_12 = stress12(j1)');
      Writeln(MyFile,'               stress_at_23 = stress23(j1)');
      Writeln(MyFile,'               stress_at_13 = stress13(j1)');
      Writeln(MyFile,'             else if (which_quadrant == 1) then');
      Writeln(MyFile,'                if (quadr(1) == -1) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                else if (quadr(1) > initial) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 2) then');
      Writeln(MyFile,'                if (quadr(2) == -1) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                else if (quadr(2) > initial) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 3) then');
      Writeln(MyFile,'                if (quadr(3) == -1) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                else if (quadr(3) > initial) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 4) then');
      Writeln(MyFile,'                if (quadr(4) == -1) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                else if (quadr(4) > initial) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 5) then');
      Writeln(MyFile,'                if (quadr(5) == -1) then');
      Writeln(MyFile,'                  quadr(5) = initial');
      Writeln(MyFile,'                  closest_node(5) = j1');
      Writeln(MyFile,'                else if (quadr(5) > initial) then');
      Writeln(MyFile,'                  quadr(5) = initial');
      Writeln(MyFile,'                  closest_node(5) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 6) then');
      Writeln(MyFile,'                if (quadr(6) == -1) then');
      Writeln(MyFile,'                  quadr(6) = initial');
      Writeln(MyFile,'                  closest_node(6) = j1');
      Writeln(MyFile,'                else if (quadr(6) > initial) then');
      Writeln(MyFile,'                  quadr(6) = initial');
      Writeln(MyFile,'                  closest_node(6) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 7) then');
      Writeln(MyFile,'                if (quadr(7) == -1) then');
      Writeln(MyFile,'                  quadr(7) = initial');
      Writeln(MyFile,'                  closest_node(7) = j1');
      Writeln(MyFile,'                else if (quadr(7) > initial) then');
      Writeln(MyFile,'                  quadr(7) = initial');
      Writeln(MyFile,'                  closest_node(7) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 8) then');
      Writeln(MyFile,'                if (quadr(8) == -1) then');
      Writeln(MyFile,'                  quadr(8) = initial');
      Writeln(MyFile,'                  closest_node(8) = j1');
      Writeln(MyFile,'                else if (quadr(8) > initial) then');
      Writeln(MyFile,'                  quadr(8) = initial');
      Writeln(MyFile,'                  closest_node(8) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (if_coincide == 1) then');
      Writeln(MyFile,'            SIGMA(1) = stress_at_1');
      Writeln(MyFile,'            SIGMA(2) = stress_at_2');
      Writeln(MyFile,'            SIGMA(3) = stress_at_3');
      Writeln(MyFile,'            SIGMA(4) = stress_at_12');
      Writeln(MyFile,'            SIGMA(5) = stress_at_13');
      Writeln(MyFile,'            SIGMA(6) = stress_at_23');
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            quadr_sum = 0');
      Writeln(MyFile,'            q_k_sum = 0');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                quadr_sum = quadr_sum + quadr(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                q_k(f) = quadr_sum/quadr(f)');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                q_k(f) = -1');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (q_k(f) /= -1) then');
      Writeln(MyFile,'                q_k_sum = q_k_sum + q_k(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            stress_avarage1 = 0');
      Writeln(MyFile,'            stress_avarage2 = 0');
      Writeln(MyFile,'            stress_avarage3 = 0');
      Writeln(MyFile,'            stress_avarage12 = 0');
      Writeln(MyFile,'            stress_avarage23 = 0');
      Writeln(MyFile,'            stress_avarage13 = 0');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                stress_avarage1 = stress_avarage1 + ');
      Writeln(MyFile,'     *		       stress11(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage2 = stress_avarage2 + ');
      Writeln(MyFile,'     *		       stress22(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage3 = stress_avarage3 + ');
      Writeln(MyFile,'     *		       stress33(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage12 = stress_avarage12 + ');
      Writeln(MyFile,'     *		       stress12(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage23 = stress_avarage23 + ');
      Writeln(MyFile,'     *		       stress23(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage13 = stress_avarage13 + ');
      Writeln(MyFile,'     *		       stress13(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            SIGMA(1) = stress_avarage1 + (stress_avarage1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = stress_avarage2 + (stress_avarage2*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(3) = stress_avarage3 + (stress_avarage3*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(4) = stress_avarage12 + (stress_avarage12*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(5) = stress_avarage13 + (stress_avarage13*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(6) = stress_avarage23 + (stress_avarage23*'+ScaleFactor+')');
      Writeln(MyFile,'           endif');
 end
 else
 begin
      Writeln(MyFile,'          if_coincide = 0');
      Writeln(MyFile,'          do f = 1, 4');
      Writeln(MyFile,'            quadr(f) = -1');
      Writeln(MyFile,'            closest_node(f) = -1');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          do j1 = 1, node_number');
      Writeln(MyFile,'            if ((coord1(j1)==COORDS(1)).and.(coord2(j1)==COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 0');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            if ((coord1(j1)<=COORDS(1)).and.(coord2(j1)<=COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 1');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            if ((coord1(j1)>COORDS(1)).and.(coord2(j1)<COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 2');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            if ((coord1(j1)>=COORDS(1)).and.(coord2(j1)>=COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 3');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'            if ((coord1(j1)<COORDS(1)).and.(coord2(j1)>COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 4');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'             if (k1 == 0) then');
      Writeln(MyFile,'                   which_quadrant = 4');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             x = abs(COORDS(1)-coord1(j1))**2');
      Writeln(MyFile,'             y = abs(COORDS(2)-coord2(j1))**2');
      Writeln(MyFile,'             initial = sqrt(x+y)');
      Writeln(MyFile,'             if (which_quadrant == 0) then');
      Writeln(MyFile,'               if_coincide = 0');
      Writeln(MyFile,'               stress_at_1 = stress11(j1)');
      Writeln(MyFile,'               stress_at_2 = stress22(j1)');
      Writeln(MyFile,'               stress_at_12 = stress12(j1)');

      if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
      Writeln(MyFile,'               stress_at_3 = stress33(j1)');

      Writeln(MyFile,'             else if (which_quadrant == 1) then');
      Writeln(MyFile,'                if (quadr(1) == -1) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                else if (quadr(1) > initial) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 2) then');
      Writeln(MyFile,'                if (quadr(2) == -1) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                else if (quadr(2) > initial) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 3) then');
      Writeln(MyFile,'                if (quadr(3) == -1) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                else if (quadr(3) > initial) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 4) then');
      Writeln(MyFile,'                if (quadr(4) == -1) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                else if (quadr(4) > initial) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (if_coincide == 1) then');
      if (s3 = 0)and(s5 = 0)and(s6 = 0) then
      begin
      Writeln(MyFile,'            SIGMA(1) = stress_at_1');
      Writeln(MyFile,'            SIGMA(2) = stress_at_2');
      Writeln(MyFile,'            SIGMA(3) = stress_at_12');
      end;
      if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
      begin
      Writeln(MyFile,'            SIGMA(1) = stress_at_1');
      Writeln(MyFile,'            SIGMA(2) = stress_at_2');
      Writeln(MyFile,'            SIGMA(3) = stress_at_3');
      Writeln(MyFile,'            SIGMA(4) = stress_at_12');
      end;
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            quadr_sum = 0');
      Writeln(MyFile,'            q_k_sum = 0');
      Writeln(MyFile,'            do f = 1, 4');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                quadr_sum = quadr_sum + quadr(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 4');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                q_k(f) = quadr_sum/quadr(f)');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                q_k(f) = -1');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 4');
      Writeln(MyFile,'              if (q_k(f) /= -1) then');
      Writeln(MyFile,'                q_k_sum = q_k_sum + q_k(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            stress_avarage1 = 0');
      Writeln(MyFile,'            stress_avarage2 = 0');
      Writeln(MyFile,'            stress_avarage12 = 0');
      Writeln(MyFile,'            stress_avarage3 = 0');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      if (s3 = 0)and(s5 = 0)and(s6 = 0) then
      begin
      Writeln(MyFile,'                stress_avarage1 = stress_avarage1 + ');
      Writeln(MyFile,'     *		       stress11(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage2 = stress_avarage2 + ');
      Writeln(MyFile,'     *		       stress22(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage12 = stress_avarage12 + ');
      Writeln(MyFile,'     *		       stress12(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            SIGMA(1) = stress_avarage1 + (stress_avarage1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = stress_avarage2 + (stress_avarage2*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(3) = stress_avarage12 + (stress_avarage12*'+ScaleFactor+')');
      Writeln(MyFile,'           endif');
      end
      else
      begin
      Writeln(MyFile,'                stress_avarage1 = stress_avarage1 + ');
      Writeln(MyFile,'     *		       stress11(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage2 = stress_avarage2 + ');
      Writeln(MyFile,'     *		       stress22(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage12 = stress_avarage12 + ');
      Writeln(MyFile,'     *		       stress12(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'                stress_avarage3 = stress_avarage3 + ');
      Writeln(MyFile,'     *		       stress33(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            SIGMA(1) = stress_avarage1 + (stress_avarage1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = stress_avarage2 + (stress_avarage2*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(3) = stress_avarage3 + (stress_avarage3*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(4) = stress_avarage12 + (stress_avarage12*'+ScaleFactor+')');
      Writeln(MyFile,'           endif');
      end;
  end;
      Writeln(MyFile,'        ENDIF');
      Writeln(MyFile,'      ENDIF');
      Writeln(MyFile,'      RETURN');
      Writeln(MyFile,'      END');
  end;
  if AccumulatedStrain <> nil then
  begin
  Writeln(MyFile,'      SUBROUTINE HARDINI(ALPHA,EQPS,COORDS,NTENS,NCRDS,NOEL,NPT,');
  Writeln(MyFile,'     1 LAYER,KSPT,LREBAR,REBARN)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION ALPHA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: closest_node(8)');
  Writeln(MyFile,'      INTEGER :: i1,j1,k1,l1,f,br,if_coincide');
  Writeln(MyFile,'      INTEGER :: which_quadrant,ixat_solation');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress_avarage1,stress_avarage2,stress_avarage3');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress_at_1,stress_at_2,stress_at_3');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z,initial,q_k_sum,quadr_sum');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: quadr(8),q_k(8)')
  else
  Writeln(MyFile,'      DOUBLEPRECISION :: quadr(4),q_k(4)');

  Writeln(MyFile,'      DOUBLEPRECISION :: eps('+ inttostr(AccumulatedStrain_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(Node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(Node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(Node_length)+')');
  Writeln(MyFile,'      CHARACTER*80 REBARN');

  for k := low(AccumulatedStrain) to  high(AccumulatedStrain) do
  begin
    Writeln(MyFile,'      eps('+inttostr(k+1) + ') = ' + floattostr(AccumulatedStrain[k,0]));
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));
    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;


      Writeln(MyFile,'      node_number = '+inttostr(Node_length));

      Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
      Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
  if z_coord <> 0 then
  begin
      Writeln(MyFile,'          if_coincide = 0');
      Writeln(MyFile,'          do f = 1, 8');
      Writeln(MyFile,'            quadr(f) = -1');
      Writeln(MyFile,'            closest_node(f) = -1');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          do j1 = 1, node_number');
      Writeln(MyFile,'             if ((coord1(j1)==COORDS(1)).and.(coord2(j1)==COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)==COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 0');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)<=COORDS(1)).and.(coord2(j1)<=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 1');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>COORDS(1)).and.(coord2(j1)<COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 2');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>=COORDS(1)).and.(coord2(j1)<=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)>=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 3');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)<COORDS(1)).and.(coord2(j1)<COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)>COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 4');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)<=COORDS(1)).and.(coord2(j1)>=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 5');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>COORDS(1)).and.(coord2(j1)>COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)<COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 6');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if ((coord1(j1)>=COORDS(1)).and.(coord2(j1)>=COORDS(2))');
      Writeln(MyFile,'     *		        .and.(coord3(j1)>=COORDS(3))) then');
      Writeln(MyFile,'                   which_quadrant = 7');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             if (k1 == 0) then');
      Writeln(MyFile,'                   which_quadrant = 8');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             x = abs(COORDS(1)-coord1(j1))**2');
      Writeln(MyFile,'             y = abs(COORDS(2)-coord2(j1))**2');
      Writeln(MyFile,'             z = abs(COORDS(3)-coord3(j1))**2');
      Writeln(MyFile,'             initial = sqrt(x+y+z)');
      Writeln(MyFile,'             if (which_quadrant == 0) then');
      Writeln(MyFile,'               if_coincide = 0');
      Writeln(MyFile,'               stress_at_1 = eps(j1)');
      Writeln(MyFile,'             else if (which_quadrant == 1) then');
      Writeln(MyFile,'                if (quadr(1) == -1) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                else if (quadr(1) > initial) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 2) then');
      Writeln(MyFile,'                if (quadr(2) == -1) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                else if (quadr(2) > initial) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 3) then');
      Writeln(MyFile,'                if (quadr(3) == -1) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                else if (quadr(3) > initial) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 4) then');
      Writeln(MyFile,'                if (quadr(4) == -1) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                else if (quadr(4) > initial) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 5) then');
      Writeln(MyFile,'                if (quadr(5) == -1) then');
      Writeln(MyFile,'                  quadr(5) = initial');
      Writeln(MyFile,'                  closest_node(5) = j1');
      Writeln(MyFile,'                else if (quadr(5) > initial) then');
      Writeln(MyFile,'                  quadr(5) = initial');
      Writeln(MyFile,'                  closest_node(5) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 6) then');
      Writeln(MyFile,'                if (quadr(6) == -1) then');
      Writeln(MyFile,'                  quadr(6) = initial');
      Writeln(MyFile,'                  closest_node(6) = j1');
      Writeln(MyFile,'                else if (quadr(6) > initial) then');
      Writeln(MyFile,'                  quadr(6) = initial');
      Writeln(MyFile,'                  closest_node(6) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 7) then');
      Writeln(MyFile,'                if (quadr(7) == -1) then');
      Writeln(MyFile,'                  quadr(7) = initial');
      Writeln(MyFile,'                  closest_node(7) = j1');
      Writeln(MyFile,'                else if (quadr(7) > initial) then');
      Writeln(MyFile,'                  quadr(7) = initial');
      Writeln(MyFile,'                  closest_node(7) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 8) then');
      Writeln(MyFile,'                if (quadr(8) == -1) then');
      Writeln(MyFile,'                  quadr(8) = initial');
      Writeln(MyFile,'                  closest_node(8) = j1');
      Writeln(MyFile,'                else if (quadr(8) > initial) then');
      Writeln(MyFile,'                  quadr(8) = initial');
      Writeln(MyFile,'                  closest_node(8) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (if_coincide == 1) then');
      Writeln(MyFile,'            EQPS = stress_at_1');
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            quadr_sum = 0');
      Writeln(MyFile,'            q_k_sum = 0');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                quadr_sum = quadr_sum + quadr(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                q_k(f) = quadr_sum/quadr(f)');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                q_k(f) = -1');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (q_k(f) /= -1) then');
      Writeln(MyFile,'                q_k_sum = q_k_sum + q_k(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            stress_avarage1 = 0');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                stress_avarage1 = stress_avarage1 + ');
      Writeln(MyFile,'     *	       eps(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            eps_value = stress_avarage1 + (stress_avarage1*'+ScaleFactor+')');
      Writeln(MyFile,'            if (eps_value < 0) then');
      Writeln(MyFile,'            eps_value = 0');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            EQPS = eps_value');
      Writeln(MyFile,'           endif');
 end
 else
 begin
      Writeln(MyFile,'          if_coincide = 0');
      Writeln(MyFile,'          do f = 1, 4');
      Writeln(MyFile,'            quadr(f) = -1');
      Writeln(MyFile,'            closest_node(f) = -1');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          do j1 = 1, node_number');
      Writeln(MyFile,'            if ((coord1(j1)==COORDS(1)).and.(coord2(j1)==COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 0');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            if ((coord1(j1)<=COORDS(1)).and.(coord2(j1)<=COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 1');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            if ((coord1(j1)>COORDS(1)).and.(coord2(j1)<COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 2');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            if ((coord1(j1)>=COORDS(1)).and.(coord2(j1)>=COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 3');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'            if ((coord1(j1)<COORDS(1)).and.(coord2(j1)>COORDS(2)))then');
      Writeln(MyFile,'                   which_quadrant = 4');
      Writeln(MyFile,'                   k1 = 1');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'             if (k1 == 0) then');
      Writeln(MyFile,'                   which_quadrant = 4');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'             x = abs(COORDS(1)-coord1(j1))**2');
      Writeln(MyFile,'             y = abs(COORDS(2)-coord2(j1))**2');
      Writeln(MyFile,'             initial = sqrt(x+y)');
      Writeln(MyFile,'             if (which_quadrant == 0) then');
      Writeln(MyFile,'               if_coincide = 0');
      Writeln(MyFile,'               stress_at_1 = eps(j1)');
      Writeln(MyFile,'             else if (which_quadrant == 1) then');
      Writeln(MyFile,'                if (quadr(1) == -1) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                else if (quadr(1) > initial) then');
      Writeln(MyFile,'                  quadr(1) = initial');
      Writeln(MyFile,'                  closest_node(1) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 2) then');
      Writeln(MyFile,'                if (quadr(2) == -1) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                else if (quadr(2) > initial) then');
      Writeln(MyFile,'                  quadr(2) = initial');
      Writeln(MyFile,'                  closest_node(2) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 3) then');
      Writeln(MyFile,'                if (quadr(3) == -1) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                else if (quadr(3) > initial) then');
      Writeln(MyFile,'                  quadr(3) = initial');
      Writeln(MyFile,'                  closest_node(3) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             else if (which_quadrant == 4) then');
      Writeln(MyFile,'                if (quadr(4) == -1) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                else if (quadr(4) > initial) then');
      Writeln(MyFile,'                  quadr(4) = initial');
      Writeln(MyFile,'                  closest_node(4) = j1');
      Writeln(MyFile,'                endif');
      Writeln(MyFile,'             endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (if_coincide == 1) then');
      Writeln(MyFile,'            EQPS = stress_at_1');
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            quadr_sum = 0');
      Writeln(MyFile,'            q_k_sum = 0');
      Writeln(MyFile,'            do f = 1, 4');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                quadr_sum = quadr_sum + quadr(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 4');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                q_k(f) = quadr_sum/quadr(f)');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                q_k(f) = -1');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            do f = 1, 4');
      Writeln(MyFile,'              if (q_k(f) /= -1) then');
      Writeln(MyFile,'                q_k_sum = q_k_sum + q_k(f)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            stress_avarage1 = 0');
      Writeln(MyFile,'            stress_avarage2 = 0');
      Writeln(MyFile,'            do f = 1, 8');
      Writeln(MyFile,'              if (quadr(f) /= -1) then');
      Writeln(MyFile,'                stress_avarage1 = stress_avarage1 + ');
      Writeln(MyFile,'     *	       eps(closest_node(f))*(q_k(f)/q_k_sum)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            end do');
      Writeln(MyFile,'            eps_value = stress_avarage1 + (stress_avarage1*'+ScaleFactor+')');
      Writeln(MyFile,'            if (eps_value < 0) then');
      Writeln(MyFile,'            eps_value = 0');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            EQPS = eps_value');
      Writeln(MyFile,'           endif');
  end;
      Writeln(MyFile,'        ENDIF');
      Writeln(MyFile,'      ENDIF');
      Writeln(MyFile,'      RETURN');
      Writeln(MyFile,'      END');
  end;
close(MyFile);
end;
end;
procedure FortranDMUE (const path : string;
                       const ScaleFactor : string;
                       const Nodes : TRealRealArray;
                       const Elements : TIntegerIntegerArray;
                       const NodesInElement : TIntegerArray;
                       const Stresses : TRealRealArray;
                       const AccumulatedStrain : TrealRealArray);
var
  k,br,br_to_3,v : integer;
  str_stress11,str_stress22,str_stress33 : string;
  str_coord1,str_coord2,str_coord3 : string;
  str_element : string;
  MyFile : textfile;
  stress_length, node_length, AccumulatedStrain_length,element_length : integer;
  z_coord,s3,s5,s6,eps_value : real;
begin
if (Stresses <> nil)or(AccumulatedStrain <> nil) then
begin
z_coord := sum_array_col(Nodes,3);
s3:= sum_array_col(Stresses,2);
s5:= sum_array_col(Stresses,4);
s6:= sum_array_col(Stresses,5);
element_length := length(Elements);
stress_length := length(Stresses);
AccumulatedStrain_length := length(AccumulatedStrain);
node_length := length(Nodes);
Assignfile(MyFile,path);
ReWrite(MyFile);
  if Stresses <> nil then
  begin
  Writeln(MyFile,'      SUBROUTINE SIGINI(SIGMA,COORDS,NTENS,NCRDS,NOEL,NPT,LAYER,');
  Writeln(MyFile,'     1 KSPT,LREBAR,NAMES)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION SIGMA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: node_number,element_number,number_in_row,counter');
  Writeln(MyFile,'      INTEGER :: br, br_, br_2, i,j,k');
  Writeln(MyFile,'      INTEGER ::main_el_num,this_element_number,exeption_for_coincidance');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance,initial_distance,initial,h1,h2,h3');
  Writeln(MyFile,'      DOUBLEPRECISION :: h12,h23,h13');
  Writeln(MyFile,'      DOUBLEPRECISION :: sum_k_coef,sum_of_distances,avarage_distance');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress11('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress22('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress12('+ inttostr(stress_length)+')');
  if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress23('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress13('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(node_length)+')');

  Writeln(MyFile,'      DOUBLEPRECISION :: NodesInElement('+ inttostr(length(NodesInElement)) + ')');
  Writeln(MyFile,'      DOUBLEPRECISION :: k_coef(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance_in_element(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: nodes_in_element(21)');
  Writeln(MyFile,'      INTEGER :: elements('+ inttostr(element_length)+',21)');
  Writeln(MyFile,'      CHARACTER NAMES(2)*80');
  for k := low(Stresses) to  high(Stresses) do
  begin
    Writeln(MyFile,'      stress11('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,0]));
    Writeln(MyFile,'      stress22('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,1]));
    Writeln(MyFile,'      stress12('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,3]));

    if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
    begin
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
    if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
    begin
    Writeln(MyFile,'      stress23('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,4]));
    Writeln(MyFile,'      stress13('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,5]));
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));
    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;

  for k := low(NodesInElement) to  high(NodesInElement) do
  begin
  Writeln(MyFile,'      NodesInElement('+inttostr(k+1) + ') = ' + floattostr(NodesInElement[k]));
  end;
  for k := 0 to high(Elements) do
  begin
    for v := 0 to NodesInElement[k] do
    begin
     Writeln(MyFile,'      elements('+inttostr(k+1)+','+inttostr(v+1)+') = ' + floattostr(Elements[k,v]));
    end;
  end;

  Writeln(MyFile,'      node_number = '+inttostr(node_length));
  Writeln(MyFile,'      element_number = '+inttostr(element_length));
    Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
      Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
 if z_coord <> 0 then
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, element_number');
      Writeln(MyFile,'            distance = 0');
      Writeln(MyFile,'            br = 0');
      Writeln(MyFile,'            DO j = 1,NodesInElement(i)+1');
      Writeln(MyFile,'              if (j>1) then');
      Writeln(MyFile,'                br = br +1');
      Writeln(MyFile,'                x = abs(COORDS(1)-coord1(elements(i,j)))**2');
      Writeln(MyFile,'                y = abs(COORDS(2)-coord2(elements(i,j)))**2');
      Writeln(MyFile,'                z = abs(COORDS(3)-coord3(elements(i,j)))**2');
      Writeln(MyFile,'                initial = sqrt(x+y+z)');
      Writeln(MyFile,'                distance = distance + initial');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                this_element_number = elements(i,j)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            ENDDO');
      Writeln(MyFile,'            avarage_distance = distance/br');
      Writeln(MyFile,'            if (initial_distance > avarage_distance) then');
      Writeln(MyFile,'              initial_distance = avarage_distance');
      Writeln(MyFile,'              main_el_num = this_element_number');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          ENDDO');
      Writeln(MyFile,'          h1 = 0.0');
      Writeln(MyFile,'          h2 = 0.0');
      Writeln(MyFile,'          h3 = 0.0');
      Writeln(MyFile,'          h12 = 0.0');
      Writeln(MyFile,'          h23 = 0.0');
      Writeln(MyFile,'          h13 = 0.0');
      Writeln(MyFile,'          br_ = 0');
      Writeln(MyFile,'          do k = 1, NodesInElement(i)+1');
      Writeln(MyFile,'            if (k > 1) then');
      Writeln(MyFile,'              br_ = br_ + 1');
      Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              z = abs(COORDS(3)-coord3(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              distance_in_element(br_) = sqrt(x+y+z)');
      Writeln(MyFile,'              nodes_in_element(br_) = elements(main_el_num,k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          sum_of_distances = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            sum_of_distances = sum_of_distances + distance_in_element(k)');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          exeption_for_coincidance = 0');
      Writeln(MyFile,'          br_2 = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            if (distance_in_element(k) == 0) then');
      Writeln(MyFile,'              node_coincidance = stress11(nodes_in_element(k))');
      Writeln(MyFile,'              exeption_for_coincidance = 1');
      Writeln(MyFile,'            else');
      Writeln(MyFile,'              br_2 = br_2 + 1');
      Writeln(MyFile,'              k_coef(br_2) = sum_of_distances/distance_in_element(k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (exeption_for_coincidance == 1) then');
      Writeln(MyFile,'            SIGMA(1) = stress11(node_coincidance)');
      Writeln(MyFile,'            SIGMA(2) = stress22(node_coincidance)');
      Writeln(MyFile,'            SIGMA(3) = stress33(node_coincidance)');
      Writeln(MyFile,'            SIGMA(4) = stress12(node_coincidance)');
      Writeln(MyFile,'            SIGMA(5) = stress23(node_coincidance)');
      Writeln(MyFile,'            SIGMA(6) = stress13(node_coincidance)');
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            sum_k_coef = 0');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'              sum_k_coef = sum_k_coef + k_coef(k)');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'            h1=h1+(k_coef(k)/sum_k_coef)*stress11(nodes_in_element(k))');
      Writeln(MyFile,'            h2=h2+(k_coef(k)/sum_k_coef)*stress22(nodes_in_element(k))');
      Writeln(MyFile,'            h3=h3+(k_coef(k)/sum_k_coef)*stress33(nodes_in_element(k))');
      Writeln(MyFile,'            h12=h12+(k_coef(k)/sum_k_coef)*stress12(nodes_in_element(k))');
      Writeln(MyFile,'            h23=h23+(k_coef(k)/sum_k_coef)*stress23(nodes_in_element(k))');
      Writeln(MyFile,'            h13=h13+(k_coef(k)/sum_k_coef)*stress13(nodes_in_element(k))');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            SIGMA(1) = h1+(h1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = h2+(h2*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(3) = h3+(h3*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(4) = h12+(h12*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(5) = h13+(h13*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(6) = h23+(h23*'+ScaleFactor+')');
      Writeln(MyFile,'          endif');
 end
 else
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, element_number');
      Writeln(MyFile,'            distance = 0');
      Writeln(MyFile,'            br = 0');
      Writeln(MyFile,'            DO j = 1,NodesInElement(i)+1');
      Writeln(MyFile,'              if (j>1) then');
      Writeln(MyFile,'                br = br +1');
      Writeln(MyFile,'                x = abs(COORDS(1)-coord1(elements(i,j)))**2');
      Writeln(MyFile,'                y = abs(COORDS(2)-coord2(elements(i,j)))**2');
      Writeln(MyFile,'                initial = sqrt(x+y)');
      Writeln(MyFile,'                distance = distance + initial');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                this_element_number = elements(i,j)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            ENDDO');
      Writeln(MyFile,'            avarage_distance = distance/br');
      Writeln(MyFile,'            if (initial_distance > avarage_distance) then');
      Writeln(MyFile,'              initial_distance = avarage_distance');
      Writeln(MyFile,'              main_el_num = this_element_number');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          ENDDO');
      Writeln(MyFile,'          h1 = 0.0');
      Writeln(MyFile,'          h2 = 0.0');
      Writeln(MyFile,'          h3 = 0.0');
      Writeln(MyFile,'          h12 = 0.0');
      Writeln(MyFile,'          br_ = 0');
      Writeln(MyFile,'          do k = 1, NodesInElement(i)+1');
      Writeln(MyFile,'            if (k > 1) then');
      Writeln(MyFile,'              br_ = br_ + 1');
      Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              distance_in_element(br_) = sqrt(x+y)');
      Writeln(MyFile,'              nodes_in_element(br_) = elements(main_el_num,k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          sum_of_distances = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            sum_of_distances = sum_of_distances + distance_in_element(k)');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          exeption_for_coincidance = 0');
      Writeln(MyFile,'          br_2 = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            if (distance_in_element(k) == 0) then');
      Writeln(MyFile,'              node_coincidance = stress11(nodes_in_element(k))');
      Writeln(MyFile,'              exeption_for_coincidance = 1');
      Writeln(MyFile,'            else');
      Writeln(MyFile,'              br_2 = br_2 + 1');
      Writeln(MyFile,'              k_coef(br_2) = sum_of_distances/distance_in_element(k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (exeption_for_coincidance == 1) then');
      Writeln(MyFile,'            SIGMA(1) = stress11(node_coincidance)');
      Writeln(MyFile,'            SIGMA(2) = stress22(node_coincidance)');
      if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
      begin
      Writeln(MyFile,'            SIGMA(3) = stress33(node_coincidance)');
      Writeln(MyFile,'            SIGMA(4) = stress12(node_coincidance)');
      end;
      if (s3 = 0)and(s5 = 0)and(s6 = 0) then
      Writeln(MyFile,'            SIGMA(3) = stress12(node_coincidance)');
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            sum_k_coef = 0');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'              sum_k_coef = sum_k_coef + k_coef(k)');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'            h1=h1+(k_coef(k)/sum_k_coef)*stress11(nodes_in_element(k))');
      Writeln(MyFile,'            h2=h2+(k_coef(k)/sum_k_coef)*stress22(nodes_in_element(k))');
      if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
      begin
      Writeln(MyFile,'            h3=h3+(k_coef(k)/sum_k_coef)*stress33(nodes_in_element(k))');
      Writeln(MyFile,'            h12=h12+(k_coef(k)/sum_k_coef)*stress12(nodes_in_element(k))');
      end;
      if (s3 = 0)and(s5 = 0)and(s6 = 0) then
      Writeln(MyFile,'            h12=h12+(k_coef(k)/sum_k_coef)*stress12(nodes_in_element(k))');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            SIGMA(1) = h1+(h1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = h2+(h2*'+ScaleFactor+')');
      if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
      begin
      Writeln(MyFile,'            SIGMA(3) = h3+(h3*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(4) = h12+(h12*'+ScaleFactor+')');
      end;
      if (s3 = 0)and(s5 = 0)and(s6 = 0) then
      Writeln(MyFile,'            SIGMA(3) = h12+(h12*'+ScaleFactor+')');

      Writeln(MyFile,'          endif');
  end;
      Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  end;
  if AccumulatedStrain <> nil then
  begin
  Writeln(MyFile,'      SUBROUTINE HARDINI(ALPHA,EQPS,COORDS,NTENS,NCRDS,NOEL,NPT,');
  Writeln(MyFile,'     1 LAYER,KSPT,LREBAR,REBARN)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION ALPHA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: node_number,element_number,number_in_row,counter');
  Writeln(MyFile,'      INTEGER :: br, br_, br_2, i,j,k');
  Writeln(MyFile,'      INTEGER ::main_el_num,this_element_number,exeption_for_coincidance');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance,initial_distance,initial,h1,h2,h3');
  Writeln(MyFile,'      DOUBLEPRECISION :: h12,h23,h13');
  Writeln(MyFile,'      DOUBLEPRECISION :: sum_k_coef,sum_of_distances,avarage_distance');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z');
  Writeln(MyFile,'      DOUBLEPRECISION :: eps_value');
  Writeln(MyFile,'      DOUBLEPRECISION :: eps('+ inttostr(AccumulatedStrain_length)+')');

  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(node_length)+')');

  Writeln(MyFile,'      DOUBLEPRECISION :: NodesInElement('+ inttostr(length(NodesInElement)) + ')');
  Writeln(MyFile,'      DOUBLEPRECISION :: k_coef(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance_in_element(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: nodes_in_element(21)');
  Writeln(MyFile,'      INTEGER :: elements('+ inttostr(element_length)+',21)');
  Writeln(MyFile,'      CHARACTER*80 REBARN');
  for k := low(AccumulatedStrain) to  high(AccumulatedStrain) do
  begin
    Writeln(MyFile,'      eps('+inttostr(k+1) + ') = ' + floattostr(AccumulatedStrain[k,0]));
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));
    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;

  for k := low(NodesInElement) to  high(NodesInElement) do
  begin
  Writeln(MyFile,'      NodesInElement('+inttostr(k+1) + ') = ' + floattostr(NodesInElement[k]));
  end;
  for k := 0 to high(Elements) do
  begin
    for v := 0 to NodesInElement[k] do
    begin
     Writeln(MyFile,'      elements('+inttostr(k+1)+','+inttostr(v+1)+') = ' + floattostr(Elements[k,v]));
    end;
  end;

  Writeln(MyFile,'      node_number = '+inttostr(node_length));
  Writeln(MyFile,'      element_number = '+inttostr(element_length));
    Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
      Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
 if z_coord <> 0 then
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, element_number');
      Writeln(MyFile,'            distance = 0');
      Writeln(MyFile,'            br = 0');
      Writeln(MyFile,'            DO j = 1,NodesInElement(i)+1');
      Writeln(MyFile,'              if (j>1) then');
      Writeln(MyFile,'                br = br +1');
      Writeln(MyFile,'                x = abs(COORDS(1)-coord1(elements(i,j)))**2');
      Writeln(MyFile,'                y = abs(COORDS(2)-coord2(elements(i,j)))**2');
      Writeln(MyFile,'                z = abs(COORDS(3)-coord3(elements(i,j)))**2');
      Writeln(MyFile,'                initial = sqrt(x+y+z)');
      Writeln(MyFile,'                distance = distance + initial');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                this_element_number = elements(i,j)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            ENDDO');
      Writeln(MyFile,'            avarage_distance = distance/br');
      Writeln(MyFile,'            if (initial_distance > avarage_distance) then');
      Writeln(MyFile,'              initial_distance = avarage_distance');
      Writeln(MyFile,'              main_el_num = this_element_number');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          ENDDO');
      Writeln(MyFile,'          h1 = 0.0');
      Writeln(MyFile,'          h2 = 0.0');
      Writeln(MyFile,'          h3 = 0.0');
      Writeln(MyFile,'          br_ = 0');
      Writeln(MyFile,'          do k = 1, NodesInElement(i)+1');
      Writeln(MyFile,'            if (k > 1) then');
      Writeln(MyFile,'              br_ = br_ + 1');
      Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              z = abs(COORDS(3)-coord3(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              distance_in_element(br_) = sqrt(x+y+z)');
      Writeln(MyFile,'              nodes_in_element(br_) = elements(main_el_num,k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          sum_of_distances = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            sum_of_distances = sum_of_distances + distance_in_element(k)');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          exeption_for_coincidance = 0');
      Writeln(MyFile,'          br_2 = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            if (distance_in_element(k) == 0) then');
      Writeln(MyFile,'              node_coincidance = eps(nodes_in_element(k))');
      Writeln(MyFile,'              exeption_for_coincidance = 1');
      Writeln(MyFile,'            else');
      Writeln(MyFile,'              br_2 = br_2 + 1');
      Writeln(MyFile,'              k_coef(br_2) = sum_of_distances/distance_in_element(k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (exeption_for_coincidance == 1) then');
      Writeln(MyFile,'            EQPS = eps(node_coincidance)');
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            sum_k_coef = 0');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'              sum_k_coef = sum_k_coef + k_coef(k)');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'            h1=h1+(k_coef(k)/sum_k_coef)*eps(nodes_in_element(k))');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            eps_value = h1+(h1*'+ScaleFactor+')');
      Writeln(MyFile,'            if (eps_value<0) then');
      Writeln(MyFile,'            eps_value = 0');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            EQPS = eps_value');
      Writeln(MyFile,'          endif');
 end
 else
 begin
      Writeln(MyFile,'          initial_distance = 9999999999999999999999999999999.9');
      Writeln(MyFile,'          DO i = 1, element_number');
      Writeln(MyFile,'            distance = 0');
      Writeln(MyFile,'            br = 0');
      Writeln(MyFile,'            DO j = 1,NodesInElement(i)+1');
      Writeln(MyFile,'              if (j>1) then');
      Writeln(MyFile,'                br = br +1');
      Writeln(MyFile,'                x = abs(COORDS(1)-coord1(elements(i,j)))**2');
      Writeln(MyFile,'                y = abs(COORDS(2)-coord2(elements(i,j)))**2');
      Writeln(MyFile,'                initial = sqrt(x+y)');
      Writeln(MyFile,'                distance = distance + initial');
      Writeln(MyFile,'              else');
      Writeln(MyFile,'                this_element_number = elements(i,j)');
      Writeln(MyFile,'              endif');
      Writeln(MyFile,'            ENDDO');
      Writeln(MyFile,'            avarage_distance = distance/br');
      Writeln(MyFile,'            if (initial_distance > avarage_distance) then');
      Writeln(MyFile,'              initial_distance = avarage_distance');
      Writeln(MyFile,'              main_el_num = this_element_number');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          ENDDO');
      Writeln(MyFile,'          h1 = 0.0');
      Writeln(MyFile,'          h2 = 0.0');
      Writeln(MyFile,'          h3 = 0.0');
      Writeln(MyFile,'          br_ = 0');
      Writeln(MyFile,'          do k = 1, NodesInElement(i)+1');
      Writeln(MyFile,'            if (k > 1) then');
      Writeln(MyFile,'              br_ = br_ + 1');
      Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(main_el_num,k)))**2');
      Writeln(MyFile,'              distance_in_element(br_) = sqrt(x+y)');
      Writeln(MyFile,'              nodes_in_element(br_) = elements(main_el_num,k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          sum_of_distances = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            sum_of_distances = sum_of_distances + distance_in_element(k)');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          exeption_for_coincidance = 0');
      Writeln(MyFile,'          br_2 = 0');
      Writeln(MyFile,'          do k = 1, br_');
      Writeln(MyFile,'            if (distance_in_element(k) == 0) then');
      Writeln(MyFile,'              node_coincidance = eps(nodes_in_element(k))');
      Writeln(MyFile,'              exeption_for_coincidance = 1');
      Writeln(MyFile,'            else');
      Writeln(MyFile,'              br_2 = br_2 + 1');
      Writeln(MyFile,'              k_coef(br_2) = sum_of_distances/distance_in_element(k)');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'          enddo');
      Writeln(MyFile,'          if (exeption_for_coincidance == 1) then');
      Writeln(MyFile,'            EQPS = eps(node_coincidance)');
      Writeln(MyFile,'          else');
      Writeln(MyFile,'            sum_k_coef = 0');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'              sum_k_coef = sum_k_coef + k_coef(k)');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            do k = 1, br_2');
      Writeln(MyFile,'            h1=h1+(k_coef(k)/sum_k_coef)*eps(nodes_in_element(k))');
      Writeln(MyFile,'            enddo');
      Writeln(MyFile,'            eps_value = h1+(h1*'+ScaleFactor+')');
      Writeln(MyFile,'            if (eps_value<0) then');
      Writeln(MyFile,'            eps_value = 0');
      Writeln(MyFile,'            endif');
      Writeln(MyFile,'            EQPS = eps_value');
      Writeln(MyFile,'          endif');
  end;
      Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  end;
close(MyFile);
end;
end;
procedure FortranMUESF(const path : string;
                       const ScaleFactor : string;
                       const Nodes : TRealRealArray;
                       const Elements : TIntegerIntegerArray;
                       const NodesInElement : TIntegerArray;
                       const Stresses : TRealRealArray;
                       const AccumulatedStrain : TrealRealArray);
var
  k,br,br_to_3,v : integer;
  str_stress11,str_stress22,str_stress33 : string;
  str_coord1,str_coord2,str_coord3 : string;
  str_element : string;
  MyFile : textfile;
  stress_length, node_length, AccumulatedStrain_length,element_length : integer;
  z_coord,s3,s5,s6,eps_value : real;
begin
if (Stresses <> nil)or(AccumulatedStrain <> nil) then
begin
z_coord := sum_array_col(Nodes,3);
s3:= sum_array_col(Stresses,2);
s5:= sum_array_col(Stresses,4);
s6:= sum_array_col(Stresses,5);
element_length := length(Elements);
stress_length := length(Stresses);
AccumulatedStrain_length := length(AccumulatedStrain);
node_length := length(Nodes);
Assignfile(MyFile,path);
ReWrite(MyFile);
  if Stresses <> nil then
  begin
  Writeln(MyFile,'      SUBROUTINE SIGINI(SIGMA,COORDS,NTENS,NCRDS,NOEL,NPT,LAYER,');
  Writeln(MyFile,'     1 KSPT,LREBAR,NAMES)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION SIGMA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: node_number,element_number,number_in_row,counter');
  Writeln(MyFile,'      INTEGER :: br, br_, br_2, i,j,k,element_type');
  Writeln(MyFile,'      INTEGER ::main_el_num,this_element_number,exeption_for_coincidance');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance,initial_distance,initial,h1,h2,h3');
  Writeln(MyFile,'      DOUBLEPRECISION :: h12,h23,h13,z_coord');
  Writeln(MyFile,'      DOUBLEPRECISION :: sum_k_coef,sum_of_distances,avarage_distance');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress11('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress22('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress12('+ inttostr(stress_length)+')');
  if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
  begin
  Writeln(MyFile,'      DOUBLEPRECISION :: stress23('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress13('+ inttostr(stress_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: stress33('+ inttostr(stress_length)+')');
  end;
  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(node_length)+')');

  Writeln(MyFile,'      DOUBLEPRECISION :: NodesInElement('+ inttostr(length(NodesInElement)) + ')');
  Writeln(MyFile,'      DOUBLEPRECISION :: k_coef(21),cx(21),cy(21),cz(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance_in_element(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: nodes_in_element(21)');
  Writeln(MyFile,'      INTEGER :: elements('+ inttostr(element_length)+',21)');
  Writeln(MyFile,'      CHARACTER NAMES(2)*80');
  for k := low(Stresses) to  high(Stresses) do
  begin
    Writeln(MyFile,'      stress11('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,0]));
    Writeln(MyFile,'      stress22('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,1]));
    Writeln(MyFile,'      stress12('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,3]));

    if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
    begin
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
    if (s3 <> 0)and(s5 <> 0)and(s6 <> 0) then
    begin
    Writeln(MyFile,'      stress23('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,4]));
    Writeln(MyFile,'      stress13('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,5]));
    Writeln(MyFile,'      stress33('+inttostr(k+1) + ') = ' + floattostr(Stresses[k,2]));
    end;
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));
    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;

  for k := low(NodesInElement) to  high(NodesInElement) do
  begin
  Writeln(MyFile,'      NodesInElement('+inttostr(k+1) + ') = ' + floattostr(NodesInElement[k]));
  end;
  for k := 0 to high(Elements) do
  begin
    for v := 0 to NodesInElement[k] do
    begin
     Writeln(MyFile,'      elements('+inttostr(k+1)+','+inttostr(v+1)+') = ' + floattostr(Elements[k,v]));
    end;
  end;
  if z_coord = 0 then
  begin
  Writeln(MyFile,'      z_coord = '+ floattostr(z_coord));
  Writeln(MyFile,'      node_number = '+inttostr(node_length));
  Writeln(MyFile,'      element_number = '+inttostr(element_length));
  Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
  Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
  Writeln(MyFile,'        initial_distance = 9999999999999999999999.9');
  Writeln(MyFile,'        DO i = 1, element_number');
  Writeln(MyFile,'          distance = 0');
  Writeln(MyFile,'          br = 0');
  Writeln(MyFile,'          DO j = 1,NodesInElement(i)+1');
  Writeln(MyFile,'            if (j>1) then');
  Writeln(MyFile,'              br = br +1');
  Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(i,j)))**2');
  Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(i,j)))**2');
  Writeln(MyFile,'              initial = sqrt(x+y)');
  Writeln(MyFile,'              distance = distance + initial');
  Writeln(MyFile,'            else');
  Writeln(MyFile,'              this_element_number = elements(i,j)');
  Writeln(MyFile,'            endif');
  Writeln(MyFile,'          ENDDO');
  Writeln(MyFile,'          avarage_distance = distance/br');
  Writeln(MyFile,'          if (initial_distance > avarage_distance) then');
  Writeln(MyFile,'            initial_distance = avarage_distance');
  Writeln(MyFile,'            main_el_num = this_element_number ');
  Writeln(MyFile,'          endif');
  Writeln(MyFile,'        ENDDO');

  Writeln(MyFile,'       element_type = NodesInElement(main_el_num)');

  Writeln(MyFile,'      if ((element_type == 3).or.(element_type == 6)) then');
  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');


  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');

  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');

  Writeln(MyFile,'       det = ((cx2-cx1)*(cy3-cy1)-(cx3-cx1)*(cy2-cy1))');
  Writeln(MyFile,'       g = ((xn-cx1)*(cy3-cy1)-(cx3-cx1)*(yn-cy1))/det');
  Writeln(MyFile,'       h = ((cx2-cx1)*(yn-cy1)-(xn-cx1)*(cy2-cy1))/det');

  Writeln(MyFile,'        value1= (1-g-h)*stress11(elements(main_el_num,2))+');
  Writeln(MyFile,'     * g*stress11(elements(main_el_num,3))+');
  Writeln(MyFile,'     * h*stress11(elements(main_el_num,4))');

  Writeln(MyFile,'        value2= (1-g-h)*stress22(elements(main_el_num,2))+');
  Writeln(MyFile,'     * g*stress22(elements(main_el_num,3))+');
  Writeln(MyFile,'     * h*stress22(elements(main_el_num,4))');

  Writeln(MyFile,'        value12= (1-g-h)*stress12(elements(main_el_num,2))+');
  Writeln(MyFile,'     * g*stress12(elements(main_el_num,3))+');
  Writeln(MyFile,'     * h*stress12(elements(main_el_num,4))');

  if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
  begin
  Writeln(MyFile,'        value3= (1-g-h)*stress33(elements(main_el_num,2))+');
  Writeln(MyFile,'     * g*stress33(elements(main_el_num,3))+');
  Writeln(MyFile,'     * h*stress33(elements(main_el_num,4))');
  end;
  

  Writeln(MyFile,'      endif');
  Writeln(MyFile,'      if ((element_type == 4).or.(element_type == 8)) then');

  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');
  Writeln(MyFile,'      cx4 = coord1(elements(main_el_num,5))');


  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');
  Writeln(MyFile,'      cy4 = coord2(elements(main_el_num,5))');

  Writeln(MyFile,'      g=0');
  Writeln(MyFile,'      h=0');

  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');

  Writeln(MyFile,'      f1 = (1-g)*(1-h)*cx1 + (1+g)*(1-h)*cx2 + ');
  Writeln(MyFile,'     *(1+g)*(1+h)*cx3+ (1-g)*(1+h)*cx4 -4*xn');
  Writeln(MyFile,'      f2 = (1-g)*(1-h)*cy1 + (1+g)*(1-h)*cy2 +');
  Writeln(MyFile,'     *(1+g)*(1+h)*cy3+ (1-g)*(1+h)*cy4 -4*yn');


  Writeln(MyFile,'      f1g = (1-h)*(cx2-cx1)+(1+h)*(cx3-cx4)');
  Writeln(MyFile,'      f1h = (1-g)*(cx4-cx1)+(1+g)*(cx3-cx2)');

  Writeln(MyFile,'      f2g = (1-h)*(cy2-cy1)+(1+h)*(cy3-cy4)');
  Writeln(MyFile,'      f2h = (1-g)*(cy4-cy1)+(1+g)*(cy3-cy2)');

   Writeln(MyFile,'      det = f1g*f2h-f2g*f1h');
   Writeln(MyFile,'      g = g + (-f1*f2h+f2*f1h)/det');
   Writeln(MyFile,'      h = h + (f1*f2g-f2*f1g)/det');

  Writeln(MyFile,'        value1= ((1-g)*(1-h)*stress11(elements(main_el_num,2))+');
  Writeln(MyFile,'     * (1+g)*(1-h)*stress11(elements(main_el_num,3))+');
  Writeln(MyFile,'     * (1+g)*(1+h)*stress11(elements(main_el_num,4))+');
  Writeln(MyFile,'     * (1-g)*(1+h)*stress11(elements(main_el_num,5)))/4');

  Writeln(MyFile,'        value2= ((1-g)*(1-h)*stress22(elements(main_el_num,2))+');
  Writeln(MyFile,'     * (1+g)*(1-h)*stress22(elements(main_el_num,3))+');
  Writeln(MyFile,'     * (1+g)*(1+h)*stress22(elements(main_el_num,4))+');
  Writeln(MyFile,'     * (1-g)*(1+h)*stress22(elements(main_el_num,5)))/4');

  Writeln(MyFile,'        value12= ((1-g)*(1-h)*stress12(elements(main_el_num,2))+');
  Writeln(MyFile,'     * (1+g)*(1-h)*stress12(elements(main_el_num,3))+');
  Writeln(MyFile,'     * (1+g)*(1+h)*stress12(elements(main_el_num,4))+');
  Writeln(MyFile,'     * (1-g)*(1+h)*stress12(elements(main_el_num,5)))/4');

  if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
  begin
  Writeln(MyFile,'        value3= ((1-g)*(1-h)*stress33(elements(main_el_num,2))+');
  Writeln(MyFile,'     * (1+g)*(1-h)*stress33(elements(main_el_num,3))+');
  Writeln(MyFile,'     * (1+g)*(1+h)*stress33(elements(main_el_num,4))+');
  Writeln(MyFile,'     * (1-g)*(1+h)*stress33(elements(main_el_num,5)))/4');
  end;

  Writeln(MyFile,'      endif');
  if (s3 <> 0)and(s5 = 0)and(s6 = 0) then
  begin
      Writeln(MyFile,'            SIGMA(1) = value1+(value1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = value2+(value2*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(3) = value3+(value3*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(4) = value12+(value12*'+ScaleFactor+')');
  end
  else
  begin
     Writeln(MyFile,'            SIGMA(1) = value1+(value1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = value2+(value2*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(3) = value12+(value12*'+ScaleFactor+')');
  end;
  Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  end;

  if z_coord <> 0 then
  begin
  Writeln(MyFile,'      z_coord = '+ floattostr(z_coord));
  Writeln(MyFile,'      node_number = '+inttostr(node_length));
  Writeln(MyFile,'      element_number = '+inttostr(element_length));
  Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
  Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
  Writeln(MyFile,'        initial_distance = 9999999999999999999999.9');
  Writeln(MyFile,'        DO i = 1, element_number');
  Writeln(MyFile,'          distance = 0');
  Writeln(MyFile,'          br = 0');
  Writeln(MyFile,'          DO j = 1,NodesInElement(i)+1');
  Writeln(MyFile,'            if (j>1) then');
  Writeln(MyFile,'              br = br +1');
  Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(i,j)))**2');
  Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(i,j)))**2');
  Writeln(MyFile,'              z = abs(COORDS(3)-coord3(elements(i,j)))**2');
  Writeln(MyFile,'              initial = sqrt(x+y+z)');
  Writeln(MyFile,'              distance = distance + initial');
  Writeln(MyFile,'            else');
  Writeln(MyFile,'              this_element_number = elements(i,j)');
  Writeln(MyFile,'            endif');
  Writeln(MyFile,'          ENDDO');
  Writeln(MyFile,'          avarage_distance = distance/br');
  Writeln(MyFile,'          if (initial_distance > avarage_distance) then');
  Writeln(MyFile,'            initial_distance = avarage_distance');
  Writeln(MyFile,'            main_el_num = this_element_number ');
  Writeln(MyFile,'          endif');
  Writeln(MyFile,'        ENDDO');

  Writeln(MyFile,'       element_type = NodesInElement(main_el_num)');
  Writeln(MyFile,'      if ((element_type == 8).or.(element_type == 20)) then');

  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');
  Writeln(MyFile,'      cx4 = coord1(elements(main_el_num,5))');
  Writeln(MyFile,'      cx5 = coord1(elements(main_el_num,6))');
  Writeln(MyFile,'      cx6 = coord1(elements(main_el_num,7))');
  Writeln(MyFile,'      cx7 = coord1(elements(main_el_num,8))');
  Writeln(MyFile,'      cx8 = coord1(elements(main_el_num,9))');

  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');
  Writeln(MyFile,'      cy4 = coord2(elements(main_el_num,5))');
  Writeln(MyFile,'      cy5 = coord2(elements(main_el_num,6))');
  Writeln(MyFile,'      cy6 = coord2(elements(main_el_num,7))');
  Writeln(MyFile,'      cy7 = coord2(elements(main_el_num,8))');
  Writeln(MyFile,'      cy8 = coord2(elements(main_el_num,9))');

  Writeln(MyFile,'      cz1 = coord3(elements(main_el_num,2))');
  Writeln(MyFile,'      cz2 = coord3(elements(main_el_num,3))');
  Writeln(MyFile,'      cz3 = coord3(elements(main_el_num,4))');
  Writeln(MyFile,'      cz4 = coord3(elements(main_el_num,5))');
  Writeln(MyFile,'      cz5 = coord3(elements(main_el_num,6))');
  Writeln(MyFile,'      cz6 = coord3(elements(main_el_num,7))');
  Writeln(MyFile,'      cz7 = coord3(elements(main_el_num,8))');
  Writeln(MyFile,'      cz8 = coord3(elements(main_el_num,9))');

  Writeln(MyFile,'         g = 0');
  Writeln(MyFile,'	   h = 0');
  Writeln(MyFile,'	   r = 0');
  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');
  Writeln(MyFile,'	   zn = COORDS(3)');

  Writeln(MyFile,'        f1 = (-1)*((1-g)*(1-h)*(1-r)*cx1 + (1+g)*(1-h)*(1-r)*cx2 +');
  Writeln(MyFile,'     *(1+g)*(1+h)*(1-r)*cx3+(1-g)*(1+h)*(1-r)*cx4+(1-g)*(1-h)*(1+r)*cx5+');
  Writeln(MyFile,'     *(1+g)*(1-h)*(1+r)*cx6 +(1+g)*(1+h)*(1+r)*cx7+(1-g)*(1+h)*(1+r)*cx8');
  Writeln(MyFile,'     * - 8*xn)');

  Writeln(MyFile,'        f2 = (-1)*((1-g)*(1-h)*(1-r)*cy1 + (1+g)*(1-h)*(1-r)*cy2 +');
  Writeln(MyFile,'     * (1+g)*(1+h)*(1-r)*cy3+ (1-g)*(1+h)*(1-r)*cy4+ (1-g)*(1-h)*(1+r)*');
  Writeln(MyFile,'     *cy5+ (1+g)*(1-h)*(1+r)*cy6+ (1+g)*(1+h)*(1+r)*cy7+ (1-g)*(1+h)*');
  Writeln(MyFile,'     *(1+r)*cy8-8*yn)');

  Writeln(MyFile,'        f3 = (-1)*((1-g)*(1-h)*(1-r)*cz1 + (1+g)*(1-h)*(1-r)*cz2 +');
  Writeln(MyFile,'     * (1+g)*(1+h)*(1-r)*cz3+ (1-g)*(1+h)*(1-r)*cz4+ (1-g)*(1-h)*(1+r)*');
  Writeln(MyFile,'     *cz5+ (1+g)*(1-h)*(1+r)*cz6+ (1+g)*(1+h)*(1+r)*cz7+ (1-g)*(1+h)*');
  Writeln(MyFile,'     *(1+r)*cz8-8*zn)');


  Writeln(MyFile,'        f1g = (-1)*(1-h)*(1-r)*cx1 + (1)*(1-h)*(1-r)*cx2 +');
  Writeln(MyFile,'     *(1)*(1+h)*(1-r)*cx3+ (-1)*(1+h)*(1-r)*cx4+ (-1)*(1-h)*(1+r)*cx5+');
  Writeln(MyFile,'     *(1)*(1-h)*(1+r)*cx6 + (1)*(1+h)*(1+r)*cx7+ (-1)*(1+h)*(1+r)*cx8');

  Writeln(MyFile,'        f1h = (1-g)*(-1)*(1-r)*cx1 + (1+g)*(-1)*(1-r)*cx2 + (1+g)*(1)*');
  Writeln(MyFile,'     *(1-r)*cx3+ (1-g)*(1)*(1-r)*cx4+ (1-g)*(-1)*(1+r)*cx5+ (1+g)*(-1)*');
  Writeln(MyFile,'     *(1+r)*cx6+ (1+g)*(1)*(1+r)*cx7+ (1-g)*(1)*(1+r)*cx8');

  Writeln(MyFile,'        f1r = (1-g)*(1-h)*(-1)*cx1 + (1+g)*(1-h)*(-1)*cx2 +(1+g)*(1+h)*');
  Writeln(MyFile,'     *(-1)*cx3+ (1-g)*(1+h)*(-1)*cx4+ (1-g)*(1-h)*(1)*cx5+ (1+g)*(1-h)*');
  Writeln(MyFile,'     *(1)*cx6+ (1+g)*(1+h)*(1)*cx7+ (1-g)*(1+h)*(1)*cx8');

  Writeln(MyFile,'        f2g = (-1)*(1-h)*(1-r)*cy1 + (1)*(1-h)*(1-r)*cy2 +');
  Writeln(MyFile,'     *(1)*(1+h)*(1-r)*cy3+(-1)*(1+h)*(1-r)*cy4+ (-1)*(1-h)*(1+r)*');
  Writeln(MyFile,'     *cy5+ (1)*(1-h)*(1+r)*cy6+(1)*(1+h)*(1+r)*cy7+(-1)*(1+h)*(1+r)*cy8');

  Writeln(MyFile,'        f2h = (1-g)*(-1)*(1-r)*cy1 + (1+g)*(-1)*(1-r)*cy2 + (1+g)*(1)*');
  Writeln(MyFile,'     *(1-r)*cy3+ (1-g)*(1)*(1-r)*cy4+ (1-g)*(-1)*(1+r)*cy5+ (1+g)*(-1)*');
  Writeln(MyFile,'     *(1+r)*cy6+ (1+g)*(1)*(1+r)*cy7+ (1-g)*(1)*(1+r)*cy8');

  Writeln(MyFile,'        f2r = (1-g)*(1-h)*(-1)*cy1 + (1+g)*(1-h)*(-1)*cy2 +(1+g)*(1+h)*');
  Writeln(MyFile,'     *(-1)*cy3+ (1-g)*(1+h)*(-1)*cy4+ (1-g)*(1-h)*(1)*cy5+ (1+g)*(1-h)*');
  Writeln(MyFile,'     *(1)*cy6+ (1+g)*(1+h)*(1)*cy7+ (1-g)*(1+h)*(1)*cy8');

  Writeln(MyFile,'        f3g = (-1)*(1-h)*(1-r)*cz1 + (1)*(1-h)*(1-r)*cz2 + (1)*(1+h)*');
  Writeln(MyFile,'     *(1-r)*cz3+ (-1)*(1+h)*(1-r)*cz4+ (-1)*(1-h)*(1+r)*cz5+ (1)*(1-h)* ');
  Writeln(MyFile,'     *(1+r)*cz6 + (1)*(1+h)*(1+r)*cz7+ (-1)*(1+h)*(1+r)*cz8');

  Writeln(MyFile,'        f3h = (1-g)*(-1)*(1-r)*cz1 + (1+g)*(-1)*(1-r)*cz2 + (1+g)*(1)*');
  Writeln(MyFile,'     *(1-r)*cz3+ (1-g)*(1)*(1-r)*cz4+ (1-g)*(-1)*(1+r)*cz5+ (1+g)*(-1)*');
  Writeln(MyFile,'     *(1+r)*cz6+ (1+g)*(1)*(1+r)*cz7+ (1-g)*(1)*(1+r)*cz8 ');

  Writeln(MyFile,'        f3r = (1-g)*(1-h)*(-1)*cz1 + (1+g)*(1-h)*(-1)*cz2 +(1+g)*(1+h)*');
  Writeln(MyFile,'     *(-1)*cz3+ (1-g)*(1+h)*(-1)*cz4+ (1-g)*(1-h)*(1)*cz5+ (1+g)*(1-h)*');
  Writeln(MyFile,'     *(1)*cz6+ (1+g)*(1+h)*(1)*cz7+ (1-g)*(1+h)*(1)*cz8');

  Writeln(MyFile,'        det = f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*');
  Writeln(MyFile,'     *f3h+f3g*f1h*f2r-f3g*f1r*f2h ');
  Writeln(MyFile,'        g = g + (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*');
  Writeln(MyFile,'     *f1h*f2r-f3*f1r*f2h)/det');
  Writeln(MyFile,'        h = h + (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*');
  Writeln(MyFile,'     *f1*f2r-f3g*f1r*f2)/det');
  Writeln(MyFile,'        r = r + (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*');
  Writeln(MyFile,'     *f1h*f2-f3g*f1*f2h)/det');



Writeln(MyFile,'        value1= ((1-g)*(1-h)*(1-r)*stress11(elements(main_el_num,2)) +');
Writeln(MyFile,'     * (1+g)*(1-h)*(1-r)*stress11(elements(main_el_num,3))+');
Writeln(MyFile,'     * (1+g)*(1+h)*(1-r)*stress11(elements(main_el_num,4))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1-r)*stress11(elements(main_el_num,5))+');
Writeln(MyFile,'     * (1-g)*(1-h)*(1+r)*stress11(elements(main_el_num,6))+');
Writeln(MyFile,'     * (1+g)*(1-h)*(1+r)*stress11(elements(main_el_num,7))+');
Writeln(MyFile,'     * (1+g)*(1+h)*(1+r)*stress11(elements(main_el_num,8))+');
Writeln(MyFile,'     *(1-g)*(1+h)*(1+r)*stress11(elements(main_el_num,9)))/8');

Writeln(MyFile,'        value2 = ((1-g)*(1-h)*(1-r)*stress22(elements(main_el_num,2))+');
Writeln(MyFile,'     *(1+g)*(1-h)*(1-r)*stress22(elements(main_el_num,3)) + ');
Writeln(MyFile,'     * (1+g)*(1+h)*(1-r)*stress22(elements(main_el_num,4))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1-r)*stress22(elements(main_el_num,5))+');
Writeln(MyFile,'     * (1-g)*(1-h)*(1+r)*stress22(elements(main_el_num,6))+');
Writeln(MyFile,'     * (1+g)*(1-h)*(1+r)*stress22(elements(main_el_num,7))+');
Writeln(MyFile,'     * (1+g)*(1+h)*(1+r)*stress22(elements(main_el_num,8))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1+r)*stress22(elements(main_el_num,9)))/8');

Writeln(MyFile,'        value3= ((1-g)*(1-h)*(1-r)*stress33(elements(main_el_num,2)) + ');
Writeln(MyFile,'     *(1+g)*(1-h)*(1-r)*stress33(elements(main_el_num,3)) + ');
Writeln(MyFile,'     *(1+g)*(1+h)*(1-r)*stress33(elements(main_el_num,4))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1-r)*stress33(elements(main_el_num,5))+ ');
Writeln(MyFile,'     * (1-g)*(1-h)*(1+r)*stress33(elements(main_el_num,6))+');
Writeln(MyFile,'     * (1+g)*(1-h)*(1+r)*stress33(elements(main_el_num,7))+ ');
Writeln(MyFile,'     * (1+g)*(1+h)*(1+r)*stress33(elements(main_el_num,8))+ ');
Writeln(MyFile,'     * (1-g)*(1+h)*(1+r)*stress33(elements(main_el_num,9)))/8 ');

Writeln(MyFile,'        value12= ((1-g)*(1-h)*(1-r)*stress12(elements(main_el_num,2))+ ');
Writeln(MyFile,'     *(1+g)*(1-h)*(1-r)*stress12(elements(main_el_num,3)) + ');
Writeln(MyFile,'     *(1+g)*(1+h)*(1-r)*stress12(elements(main_el_num,4))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1-r)*stress12(elements(main_el_num,5))+ ');
Writeln(MyFile,'     * (1-g)*(1-h)*(1+r)*stress12(elements(main_el_num,6))+');
Writeln(MyFile,'     * (1+g)*(1-h)*(1+r)*stress12(elements(main_el_num,7))+ ');
Writeln(MyFile,'     * (1+g)*(1+h)*(1+r)*stress12(elements(main_el_num,8))+ ');
Writeln(MyFile,'     * (1-g)*(1+h)*(1+r)*stress12(elements(main_el_num,9)))/8 ');

Writeln(MyFile,'        value13= ((1-g)*(1-h)*(1-r)*stress13(elements(main_el_num,2)) + ');
Writeln(MyFile,'     *(1+g)*(1-h)*(1-r)*stress13(elements(main_el_num,3)) + ');
Writeln(MyFile,'     *(1+g)*(1+h)*(1-r)*stress13(elements(main_el_num,4))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1-r)*stress13(elements(main_el_num,5))+ ');
Writeln(MyFile,'     * (1-g)*(1-h)*(1+r)*stress13(elements(main_el_num,6))+');
Writeln(MyFile,'     * (1+g)*(1-h)*(1+r)*stress13(elements(main_el_num,7))+ ');
Writeln(MyFile,'     * (1+g)*(1+h)*(1+r)*stress13(elements(main_el_num,8))+ ');
Writeln(MyFile,'     * (1-g)*(1+h)*(1+r)*stress13(elements(main_el_num,9)))/8 ');

Writeln(MyFile,'        value23= ((1-g)*(1-h)*(1-r)*stress23(elements(main_el_num,2)) + ');
Writeln(MyFile,'     *(1+g)*(1-h)*(1-r)*stress23(elements(main_el_num,3)) + ');
Writeln(MyFile,'     *(1+g)*(1+h)*(1-r)*stress23(elements(main_el_num,4))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1-r)*stress23(elements(main_el_num,5))+ ');
Writeln(MyFile,'     * (1-g)*(1-h)*(1+r)*stress23(elements(main_el_num,6))+');
Writeln(MyFile,'     * (1+g)*(1-h)*(1+r)*stress23(elements(main_el_num,7))+ ');
Writeln(MyFile,'     * (1+g)*(1+h)*(1+r)*stress23(elements(main_el_num,8))+ ');
Writeln(MyFile,'     * (1-g)*(1+h)*(1+r)*stress23(elements(main_el_num,9)))/8 ');


Writeln(MyFile,'      endif');
Writeln(MyFile,'      if ((element_type == 4).or.(element_type == 10)) then');
Writeln(MyFile,'                cx(1) = coord1(elements(main_el_num,2))');
Writeln(MyFile,'		cx(2) = coord1(elements(main_el_num,3))');
Writeln(MyFile,'		cx(3) = coord1(elements(main_el_num,4))');
Writeln(MyFile,'		cx(4) = coord1(elements(main_el_num,5))');

Writeln(MyFile,'		cy(1) = coord2(elements(main_el_num,2))');
Writeln(MyFile,'		cy(2) = coord2(elements(main_el_num,3))');
Writeln(MyFile,'		cy(3) = coord2(elements(main_el_num,4))');
Writeln(MyFile,'		cy(4) = coord2(elements(main_el_num,5))');

Writeln(MyFile,'		cz(1) = coord3(elements(main_el_num,2))');
Writeln(MyFile,'		cz(2) = coord3(elements(main_el_num,3))');
Writeln(MyFile,'		cz(3) = coord3(elements(main_el_num,4))');
Writeln(MyFile,'		cz(4) = coord3(elements(main_el_num,5))');

Writeln(MyFile,'		xn = COORDS(1)');
Writeln(MyFile,'		yn = COORDS(2)');
Writeln(MyFile,'		zn = COORDS(3)');


Writeln(MyFile,'		det = (cx(2)-cx(1))*(cy(3)-cy(1))*(cz(4)-cz(1)) -');
Writeln(MyFile,'     *(cx(2)-cx(1))*(cy(4)-cy(1))*(cz(3)-cz(1))-(cy(2)-cy(1))*(cx(3)-');
Writeln(MyFile,'     *cx(1))*(cz(4)-cz(1))+(cy(2)-cy(1))*(cx(4)-cx(1))*(cz(3)-cz(1))+');
Writeln(MyFile,'     *(cz(2)-cz(1))*(cx(3)-cx(1))*(cy(4)-cy(1))-(cz(2)-cz(1))*(cx(4)-');
Writeln(MyFile,'     *cx(1))*(cy(3)-cy(1))');

Writeln(MyFile,'		g = ((xn-cx(1))*(cy(3)-cy(1))*(cz(4)-cz(1))-');
Writeln(MyFile,'     *(xn-cx(1))*(cy(4)-cy(1))*(cz(3)-cz(1))-(yn-cy(1))*(cx(3)-');
Writeln(MyFile,'     *cx(1))*(cz(4)-cz(1))+(yn-cy(1))*(cx(4)-cx(1))*(cz(3)-cz(1))+');
Writeln(MyFile,'     *(zn-cz(1))*(cx(3)-cx(1))*(cy(4)-cy(1))-(zn-cz(1))*(cx(4)-');
Writeln(MyFile,'     *cx(1))*(cy(3)-cy(1)))/det');

Writeln(MyFile,'		h = ((cx(2)-cx(1))*(yn-cy(1))*(cz(4)-cz(1))-(cx(2)-');
Writeln(MyFile,'     *cx(1))*(cy(4)-cy(1))*(zn-cz(1))-(cy(2)-cy(1))*(xn-cx(1))*(cz(4)-');
Writeln(MyFile,'     *cz(1))+(cy(2)-cy(1))*(cx(4)-cx(1))*(zn-cz(1))+(cz(2)-cz(1))*(xn-');
Writeln(MyFile,'     *cx(1))*(cy(4)-cy(1))-(cz(2)-cz(1))*(cx(4)-cx(1))*(yn-cy(1)))/det');

Writeln(MyFile,'		r = ((cx(2)-cx(1))*(cy(3)-cy(1))*(zn-cz(1))-(cx(2)-');
Writeln(MyFile,'     *cx(1))*(yn-cy(1))*(cz(3)-cz(1))-(cy(2)-cy(1))*(cx(3)-cx(1))*(zn-');
Writeln(MyFile,'     *cz(1))+(cy(2)-cy(1))*(xn-cx(1))*(cz(3)-cz(1))+(cz(2)-');
Writeln(MyFile,'     *cz(1))*(cx(3)-cx(1))*(yn-cy(1))-(cz(2)-cz(1))*(xn-cx(1))*(cy(3)-');
Writeln(MyFile,'     *cy(1)))/det');


Writeln(MyFile,'	value1= (1-g-h-r)*stress11(elements(main_el_num,2)) +');
Writeln(MyFile,'     * g*stress11(elements(main_el_num,3)) +');
Writeln(MyFile,'     *h*stress11(elements(main_el_num,4)) +');
Writeln(MyFile,'     *r*stress11(elements(main_el_num,5))');

Writeln(MyFile,'	value2= (1-g-h-r)*stress22(elements(main_el_num,2)) +');
Writeln(MyFile,'     *g*stress22(elements(main_el_num,3)) +');
Writeln(MyFile,'     *h*stress22(elements(main_el_num,4)) +');
Writeln(MyFile,'     *r*stress22(elements(main_el_num,5))');

Writeln(MyFile,'	value3= (1-g-h-r)*stress33(elements(main_el_num,2)) +');
Writeln(MyFile,'     *g*stress33(elements(main_el_num,3)) +');
Writeln(MyFile,'     *h*stress33(elements(main_el_num,4)) +');
Writeln(MyFile,'     *r*stress33(elements(main_el_num,5))');

Writeln(MyFile,'	value12= (1-g-h-r)*stress12(elements(main_el_num,2)) +');
Writeln(MyFile,'     *g*stress12(elements(main_el_num,3)) +');
Writeln(MyFile,'     *h*stress12(elements(main_el_num,4)) +');
Writeln(MyFile,'     *r*stress12(elements(main_el_num,5))');


Writeln(MyFile,'	value13= (1-g-h-r)*stress13(elements(main_el_num,2)) +');
Writeln(MyFile,'     *g*stress13(elements(main_el_num,3)) +');
Writeln(MyFile,'     *h*stress13(elements(main_el_num,4)) +');
Writeln(MyFile,'     *r*stress13(elements(main_el_num,5))');

Writeln(MyFile,'	value23= (1-g-h-r)*stress23(elements(main_el_num,2)) +');
Writeln(MyFile,'     *g*stress23(elements(main_el_num,3)) +');
Writeln(MyFile,'     *h*stress23(elements(main_el_num,4)) +');
Writeln(MyFile,'     *r*stress23(elements(main_el_num,5))');
Writeln(MyFile,'      endif');

  Writeln(MyFile,'      if ((element_type == 6).or.(element_type == 15)) then');
  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');
  Writeln(MyFile,'      cx4 = coord1(elements(main_el_num,5))');
  Writeln(MyFile,'      cx5 = coord1(elements(main_el_num,6))');
  Writeln(MyFile,'      cx6 = coord1(elements(main_el_num,7))');


  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');
  Writeln(MyFile,'      cy4 = coord2(elements(main_el_num,5))');
  Writeln(MyFile,'      cy5 = coord2(elements(main_el_num,6))');
  Writeln(MyFile,'      cy6 = coord2(elements(main_el_num,7))');


  Writeln(MyFile,'      cz1 = coord3(elements(main_el_num,2))');
  Writeln(MyFile,'      cz2 = coord3(elements(main_el_num,3))');
  Writeln(MyFile,'      cz3 = coord3(elements(main_el_num,4))');
  Writeln(MyFile,'      cz4 = coord3(elements(main_el_num,5))');
  Writeln(MyFile,'      cz5 = coord3(elements(main_el_num,6))');
  Writeln(MyFile,'      cz6 = coord3(elements(main_el_num,7))');
  Writeln(MyFile,'      cz7 = coord3(elements(main_el_num,8))');

  Writeln(MyFile,'      g = 0.500000000000000001');
  Writeln(MyFile,'      h = 0.50000000000021');
  Writeln(MyFile,'      r = 0.00000000000001');
  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');
  Writeln(MyFile,'	   zn = COORDS(3)');
  Writeln(MyFile,'      f1 = (-1)*((1-g-h)*(1-r)*cx1 + g*(1-r)*cx2 + h*(1-r)*cx3');
  Writeln(MyFile,'     *+(1-g-h)*(1+r)*cx4 + g*(1+r)*cx5 + h*(1+r)*cx6 - 2*xn)');
  Writeln(MyFile,'      f2 = (-1)*((1-g-h)*(1-r)*cy1 + g*(1-r)*cy2 + h*(1-r)*cy3');
  Writeln(MyFile,'     *+ (1-g-h)*(1+r)*cy4 + g*(1+r)*cy5 + h*(1+r)*cy6 - 2*yn)');
  Writeln(MyFile,'      f3 = (-1)*((1-g-h)*(1-r)*cz1 + g*(1-r)*cz2 + h*(1-r)*cz3');
  Writeln(MyFile,'     *+ (1-g-h)*(1+r)*cz4 + g*(1+r)*cz5 + h*(1+r)*cz6 - 2*zn)');


  Writeln(MyFile,'      f1g = (-1)*(1-r)*cx1 + (1-r)*cx2 +(-1)*(1+r)*cx4 + (1+r)*cx5');
  Writeln(MyFile,'      f1h = (-1)*(1-r)*cx1 + (1-r)*cx3 + (-1)*(1+r)*cx4 +(1+r)*cx6');
  Writeln(MyFile,'      f1r = (1-g-h)*(-1)*cx1 + g*(-1)*cx2 + h*(-1)*cx3 +');
  Writeln(MyFile,'     *(1-g-h)*(1)*cx4 + g*(1)*cx5 + h*(1)*cx6');

  Writeln(MyFile,'      f2g = (-1)*(1-r)*cy1 + (1-r)*cy2 +(-1)*(1+r)*cy4 + (1+r)*cy5');
  Writeln(MyFile,'      f2h = (-1)*(1-r)*cy1 + (1-r)*cy3 + (-1)*(1+r)*cy4 +(1+r)*cy6');
  Writeln(MyFile,'      f2r = (1-g-h)*(-1)*cy1 + g*(-1)*cy2 + h*(-1)*cy3 +');
  Writeln(MyFile,'     *(1-g-h)*(1)*cy4 + g*(1)*cy5 + h*(1)*cy6');

  Writeln(MyFile,'      f3g = (-1)*(1-r)*cz1 + (1-r)*cz2 +(-1)*(1+r)*cz4 + (1+r)*cz5');
  Writeln(MyFile,'      f3h = (-1)*(1-r)*cz1 + (1-r)*cz3 + (-1)*(1+r)*cz4 +(1+r)*cz6');
  Writeln(MyFile,'      f3r = (1-g-h)*(-1)*cz1 + g*(-1)*cz2 + h*(-1)*cz3 +');
  Writeln(MyFile,'     *(1-g-h)*(1)*cz4 + g*(1)*cz5 + h*(1)*cz6');

  Writeln(MyFile,'      det = f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+');
  Writeln(MyFile,'     *f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h');
  Writeln(MyFile,'      g = g + (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+');
  Writeln(MyFile,'     *f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det');
  Writeln(MyFile,'      h = h + (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+');
  Writeln(MyFile,'     *f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det');
  Writeln(MyFile,'      r = r + (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+');
  Writeln(MyFile,'     *f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det');

  Writeln(MyFile,'	value1= ((1-g-h)*(1-r)*stress11(elements(main_el_num,2)) +');
  Writeln(MyFile,'     *g*(1-r)*stress11(elements(main_el_num,3)) +');
  Writeln(MyFile,'     *h*(1-r)*stress11(elements(main_el_num,4)) +');
  Writeln(MyFile,'     *(1-g-h)*(1+r)*stress11(elements(main_el_num,5))+');
  Writeln(MyFile,'     *g*(1+r)*stress11(elements(main_el_num,6))+');
  Writeln(MyFile,'     *h*(1+r)*stress11(elements(main_el_num,7)))/2');

  Writeln(MyFile,'	value2= ((1-g-h)*(1-r)*stress22(elements(main_el_num,2)) +');
  Writeln(MyFile,'     *g*(1-r)*stress22(elements(main_el_num,3)) +');
  Writeln(MyFile,'     *h*(1-r)*stress22(elements(main_el_num,4)) +');
  Writeln(MyFile,'     *(1-g-h)*(1+r)*stress22(elements(main_el_num,5))+');
  Writeln(MyFile,'     *g*(1+r)*stress22(elements(main_el_num,6))+');
  Writeln(MyFile,'     *h*(1+r)*stress22(elements(main_el_num,7)))/2');

  Writeln(MyFile,'	value3= ((1-g-h)*(1-r)*stress33(elements(main_el_num,2)) +');
  Writeln(MyFile,'     *g*(1-r)*stress33(elements(main_el_num,3)) +');
  Writeln(MyFile,'     *h*(1-r)*stress33(elements(main_el_num,4)) +');
  Writeln(MyFile,'     *(1-g-h)*(1+r)*stress33(elements(main_el_num,5))+');
  Writeln(MyFile,'     *g*(1+r)*stress33(elements(main_el_num,6))+');
  Writeln(MyFile,'     *h*(1+r)*stress33(elements(main_el_num,7)))/2');

  Writeln(MyFile,'	value12= ((1-g-h)*(1-r)*stress12(elements(main_el_num,2)) +');
  Writeln(MyFile,'     *g*(1-r)*stress12(elements(main_el_num,3)) +');
  Writeln(MyFile,'     *h*(1-r)*stress12(elements(main_el_num,4)) +');
  Writeln(MyFile,'     *(1-g-h)*(1+r)*stress12(elements(main_el_num,5))+');
  Writeln(MyFile,'     *g*(1+r)*stress12(elements(main_el_num,6))+');
  Writeln(MyFile,'     *h*(1+r)*stress12(elements(main_el_num,7)))/2');

  Writeln(MyFile,'	value13= ((1-g-h)*(1-r)*stress13(elements(main_el_num,2)) +');
  Writeln(MyFile,'     *g*(1-r)*stress13(elements(main_el_num,3)) +');
  Writeln(MyFile,'     *h*(1-r)*stress13(elements(main_el_num,4)) +');
  Writeln(MyFile,'     *(1-g-h)*(1+r)*stress13(elements(main_el_num,5))+');
  Writeln(MyFile,'     *g*(1+r)*stress13(elements(main_el_num,6))+');
  Writeln(MyFile,'     *h*(1+r)*stress13(elements(main_el_num,7)))/2');

  Writeln(MyFile,'	value23= ((1-g-h)*(1-r)*stress23(elements(main_el_num,2)) +');
  Writeln(MyFile,'     *g*(1-r)*stress23(elements(main_el_num,3)) +');
  Writeln(MyFile,'     *h*(1-r)*stress23(elements(main_el_num,4)) +');
  Writeln(MyFile,'     *(1-g-h)*(1+r)*stress23(elements(main_el_num,5))+');
  Writeln(MyFile,'     *g*(1+r)*stress23(elements(main_el_num,6))+');
  Writeln(MyFile,'     *h*(1+r)*stress23(elements(main_el_num,7)))/2');
  Writeln(MyFile,'      endif');



      Writeln(MyFile,'            SIGMA(1) = value1+(value1*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(2) = value2+(value2*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(3) = value3+(value3*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(4) = value12+(value12*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(5) = value13+(value13*'+ScaleFactor+')');
      Writeln(MyFile,'            SIGMA(6) = value23+(value23*'+ScaleFactor+')');
      Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  end;
  if AccumulatedStrain <> nil then
  begin
  Writeln(MyFile,'      SUBROUTINE HARDINI(ALPHA,EQPS,COORDS,NTENS,NCRDS,NOEL,NPT,');
  Writeln(MyFile,'     1 LAYER,KSPT,LREBAR,REBARN)');
  Writeln(MyFile,'      INCLUDE ''ABA_PARAM.INC''');
  Writeln(MyFile,'      DIMENSION ALPHA(NTENS),COORDS(NCRDS)');
  Writeln(MyFile,'      INTEGER :: node_number,element_number,number_in_row,counter');
  Writeln(MyFile,'      INTEGER :: br, br_, br_2, i,j,k');
  Writeln(MyFile,'      INTEGER ::main_el_num,this_element_number,exeption_for_coincidance');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance,initial_distance,initial,h1,h2,h3');
  Writeln(MyFile,'      DOUBLEPRECISION :: h12,h23,h13');
  Writeln(MyFile,'      DOUBLEPRECISION :: sum_k_coef,sum_of_distances,avarage_distance');
  Writeln(MyFile,'      DOUBLEPRECISION :: x,y,z');
  Writeln(MyFile,'      DOUBLEPRECISION :: eps_value');
  Writeln(MyFile,'      DOUBLEPRECISION :: eps('+ inttostr(AccumulatedStrain_length)+')');

  Writeln(MyFile,'      DOUBLEPRECISION :: coord1('+ inttostr(node_length)+')');
  Writeln(MyFile,'      DOUBLEPRECISION :: coord2('+ inttostr(node_length)+')');
  if z_coord <> 0 then
  Writeln(MyFile,'      DOUBLEPRECISION :: coord3('+ inttostr(node_length)+')');

  Writeln(MyFile,'      DOUBLEPRECISION :: NodesInElement('+ inttostr(length(NodesInElement)) + ')');
  Writeln(MyFile,'      DOUBLEPRECISION :: k_coef(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: distance_in_element(21)');
  Writeln(MyFile,'      DOUBLEPRECISION :: nodes_in_element(21)');
  Writeln(MyFile,'      INTEGER :: elements('+ inttostr(element_length)+',21)');
  Writeln(MyFile,'      CHARACTER*80 REBARN');
  for k := low(AccumulatedStrain) to  high(AccumulatedStrain) do
  begin
    Writeln(MyFile,'      eps('+inttostr(k+1) + ') = ' + floattostr(AccumulatedStrain[k,0]));
  end;
  for k := low(Nodes) to  high(Nodes) do
  begin
    Writeln(MyFile,'      coord1('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,1]));
    Writeln(MyFile,'      coord2('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,2]));
    if z_coord <> 0 then
    Writeln(MyFile,'      coord3('+inttostr(k+1) + ') = ' + floattostr(Nodes[k,3]));
  end;

  for k := low(NodesInElement) to  high(NodesInElement) do
  begin
  Writeln(MyFile,'      NodesInElement('+inttostr(k+1) + ') = ' + floattostr(NodesInElement[k]));
  end;
  for k := 0 to high(Elements) do
  begin
    for v := 0 to NodesInElement[k] do
    begin
     Writeln(MyFile,'      elements('+inttostr(k+1)+','+inttostr(v+1)+') = ' + floattostr(Elements[k,v]));
    end;
  end;
  if z_coord = 0 then
  begin
  Writeln(MyFile,'      z_coord = '+ floattostr(z_coord));
  Writeln(MyFile,'      node_number = '+inttostr(node_length));
  Writeln(MyFile,'      element_number = '+inttostr(element_length));
  Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
  Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
  Writeln(MyFile,'        initial_distance = 9999999999999999999999.9');
  Writeln(MyFile,'        DO i = 1, element_number');
  Writeln(MyFile,'          distance = 0');
  Writeln(MyFile,'          br = 0');
  Writeln(MyFile,'          DO j = 1,NodesInElement(i)+1');
  Writeln(MyFile,'            if (j>1) then');
  Writeln(MyFile,'              br = br +1');
  Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(i,j)))**2');
  Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(i,j)))**2');
  Writeln(MyFile,'              initial = sqrt(x+y)');
  Writeln(MyFile,'              distance = distance + initial');
  Writeln(MyFile,'            else');
  Writeln(MyFile,'              this_element_number = elements(i,j)');
  Writeln(MyFile,'            endif');
  Writeln(MyFile,'          ENDDO');
  Writeln(MyFile,'          avarage_distance = distance/br');
  Writeln(MyFile,'          if (initial_distance > avarage_distance) then');
  Writeln(MyFile,'            initial_distance = avarage_distance');
  Writeln(MyFile,'            main_el_num = this_element_number ');
  Writeln(MyFile,'          endif');
  Writeln(MyFile,'        ENDDO');

  Writeln(MyFile,'       element_type = NodesInElement(main_el_num)');

  Writeln(MyFile,'      if ((element_type == 3).or.(element_type == 6)) then');
  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');


  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');

  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');

  Writeln(MyFile,'       det = ((cx2-cx1)*(cy3-cy1)-(cx3-cx1)*(cy2-cy1))');
  Writeln(MyFile,'       g = ((xn-cx1)*(cy3-cy1)-(cx3-cx1)*(yn-cy1))/det');
  Writeln(MyFile,'       h = ((cx2-cx1)*(yn-cy1)-(xn-cx1)*(cy2-cy1))/det');

  Writeln(MyFile,'       value1= (1-g-h)*eps(elements(main_el_num,2))+');
  Writeln(MyFile,'     * g*stress11(eps(main_el_num,3))+');
  Writeln(MyFile,'     * h*stress11(eps(main_el_num,4))');



  Writeln(MyFile,'      endif');
  Writeln(MyFile,'      if ((element_type == 4).or.(element_type == 8)) then');

  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');
  Writeln(MyFile,'      cx4 = coord1(elements(main_el_num,5))');


  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');
  Writeln(MyFile,'      cy4 = coord2(elements(main_el_num,5))');

  Writeln(MyFile,'      g=0');
  Writeln(MyFile,'      h=0');

  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');

  Writeln(MyFile,'      f1 = (1-g)*(1-h)*cx1 + (1+g)*(1-h)*cx2 + ');
  Writeln(MyFile,'     *(1+g)*(1+h)*cx3+ (1-g)*(1+h)*cx4 -4*xn');
  Writeln(MyFile,'      f2 = (1-g)*(1-h)*cy1 + (1+g)*(1-h)*cy2 +');
  Writeln(MyFile,'     *(1+g)*(1+h)*cy3+ (1-g)*(1+h)*cy4 -4*yn');


  Writeln(MyFile,'      f1g = (1-h)*(cx2-cx1)+(1+h)*(cx3-cx4)');
  Writeln(MyFile,'      f1h = (1-g)*(cx4-cx1)+(1+g)*(cx3-cx2)');

  Writeln(MyFile,'      f2g = (1-h)*(cy2-cy1)+(1+h)*(cy3-cy4)');
  Writeln(MyFile,'      f2h = (1-g)*(cy4-cy1)+(1+g)*(cy3-cy2)');

   Writeln(MyFile,'      det = f1g*f2h-f2g*f1h');
   Writeln(MyFile,'      g = g + (-f1*f2h+f2*f1h)/det');
   Writeln(MyFile,'      h = h + (f1*f2g-f2*f1g)/det');

  Writeln(MyFile,'        value1= ((1-g)*(1-h)*eps(elements(main_el_num,2))+');
  Writeln(MyFile,'     * (1+g)*(1-h)*eps(elements(main_el_num,3))+');
  Writeln(MyFile,'     * (1+g)*(1+h)*eps(elements(main_el_num,4))+');
  Writeln(MyFile,'     * (1-g)*(1+h)*eps(elements(main_el_num,5)))/4');


  Writeln(MyFile,'      endif');

  Writeln(MyFile,'            EQPS = value1+(value1*'+ScaleFactor+')');

  end;
  Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  end;

  if z_coord <> 0 then
  begin
  Writeln(MyFile,'      z_coord = '+ floattostr(z_coord));
  Writeln(MyFile,'      node_number = '+inttostr(node_length));
  Writeln(MyFile,'      element_number = '+inttostr(element_length));
  Writeln(MyFile,'      IF (NOEL < 9999999999999) THEN');
  Writeln(MyFile,'        IF (NPT < 9999999999) THEN');
  Writeln(MyFile,'        initial_distance = 9999999999999999999999.9');
  Writeln(MyFile,'        DO i = 1, element_number');
  Writeln(MyFile,'          distance = 0');
  Writeln(MyFile,'          br = 0');
  Writeln(MyFile,'          DO j = 1,NodesInElement(i)+1');
  Writeln(MyFile,'            if (j>1) then');
  Writeln(MyFile,'              br = br +1');
  Writeln(MyFile,'              x = abs(COORDS(1)-coord1(elements(i,j)))**2');
  Writeln(MyFile,'              y = abs(COORDS(2)-coord2(elements(i,j)))**2');
  Writeln(MyFile,'              z = abs(COORDS(3)-coord3(elements(i,j)))**2');
  Writeln(MyFile,'              initial = sqrt(x+y+z)');
  Writeln(MyFile,'              distance = distance + initial');
  Writeln(MyFile,'            else');
  Writeln(MyFile,'              this_element_number = elements(i,j)');
  Writeln(MyFile,'            endif');
  Writeln(MyFile,'          ENDDO');
  Writeln(MyFile,'          avarage_distance = distance/br');
  Writeln(MyFile,'          if (initial_distance > avarage_distance) then');
  Writeln(MyFile,'            initial_distance = avarage_distance');
  Writeln(MyFile,'            main_el_num = this_element_number ');
  Writeln(MyFile,'          endif');
  Writeln(MyFile,'        ENDDO');

  Writeln(MyFile,'       element_type = NodesInElement(main_el_num)');
  Writeln(MyFile,'      if ((element_type == 8).or.(element_type == 20)) then');

  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');
  Writeln(MyFile,'      cx4 = coord1(elements(main_el_num,5))');
  Writeln(MyFile,'      cx5 = coord1(elements(main_el_num,6))');
  Writeln(MyFile,'      cx6 = coord1(elements(main_el_num,7))');
  Writeln(MyFile,'      cx7 = coord1(elements(main_el_num,8))');
  Writeln(MyFile,'      cx8 = coord1(elements(main_el_num,9))');

  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');
  Writeln(MyFile,'      cy4 = coord2(elements(main_el_num,5))');
  Writeln(MyFile,'      cy5 = coord2(elements(main_el_num,6))');
  Writeln(MyFile,'      cy6 = coord2(elements(main_el_num,7))');
  Writeln(MyFile,'      cy7 = coord2(elements(main_el_num,8))');
  Writeln(MyFile,'      cy8 = coord2(elements(main_el_num,9))');

  Writeln(MyFile,'      cz1 = coord3(elements(main_el_num,2))');
  Writeln(MyFile,'      cz2 = coord3(elements(main_el_num,3))');
  Writeln(MyFile,'      cz3 = coord3(elements(main_el_num,4))');
  Writeln(MyFile,'      cz4 = coord3(elements(main_el_num,5))');
  Writeln(MyFile,'      cz5 = coord3(elements(main_el_num,6))');
  Writeln(MyFile,'      cz6 = coord3(elements(main_el_num,7))');
  Writeln(MyFile,'      cz7 = coord3(elements(main_el_num,8))');
  Writeln(MyFile,'      cz8 = coord3(elements(main_el_num,9))');

  Writeln(MyFile,'         g = 0');
  Writeln(MyFile,'	   h = 0');
  Writeln(MyFile,'	   r = 0');
  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');
  Writeln(MyFile,'	   zn = COORDS(3)');

  Writeln(MyFile,'        f1 = (-1)*((1-g)*(1-h)*(1-r)*cx1 + (1+g)*(1-h)*(1-r)*cx2 +');
  Writeln(MyFile,'     *(1+g)*(1+h)*(1-r)*cx3+(1-g)*(1+h)*(1-r)*cx4+(1-g)*(1-h)*(1+r)*cx5+');
  Writeln(MyFile,'     *(1+g)*(1-h)*(1+r)*cx6 +(1+g)*(1+h)*(1+r)*cx7+(1-g)*(1+h)*(1+r)*cx8');
  Writeln(MyFile,'     * - 8*xn)');

  Writeln(MyFile,'        f2 = (-1)*((1-g)*(1-h)*(1-r)*cy1 + (1+g)*(1-h)*(1-r)*cy2 +');
  Writeln(MyFile,'     * (1+g)*(1+h)*(1-r)*cy3+ (1-g)*(1+h)*(1-r)*cy4+ (1-g)*(1-h)*(1+r)*');
  Writeln(MyFile,'     *cy5+ (1+g)*(1-h)*(1+r)*cy6+ (1+g)*(1+h)*(1+r)*cy7+ (1-g)*(1+h)*');
  Writeln(MyFile,'     *(1+r)*cy8-8*yn)');

  Writeln(MyFile,'        f3 = (-1)*((1-g)*(1-h)*(1-r)*cz1 + (1+g)*(1-h)*(1-r)*cz2 +');
  Writeln(MyFile,'     * (1+g)*(1+h)*(1-r)*cz3+ (1-g)*(1+h)*(1-r)*cz4+ (1-g)*(1-h)*(1+r)*');
  Writeln(MyFile,'     *cz5+ (1+g)*(1-h)*(1+r)*cz6+ (1+g)*(1+h)*(1+r)*cz7+ (1-g)*(1+h)*');
  Writeln(MyFile,'     *(1+r)*cz8-8*zn)');


  Writeln(MyFile,'        f1g = (-1)*(1-h)*(1-r)*cx1 + (1)*(1-h)*(1-r)*cx2 +');
  Writeln(MyFile,'     *(1)*(1+h)*(1-r)*cx3+ (-1)*(1+h)*(1-r)*cx4+ (-1)*(1-h)*(1+r)*cx5+');
  Writeln(MyFile,'     *(1)*(1-h)*(1+r)*cx6 + (1)*(1+h)*(1+r)*cx7+ (-1)*(1+h)*(1+r)*cx8');

  Writeln(MyFile,'        f1h = (1-g)*(-1)*(1-r)*cx1 + (1+g)*(-1)*(1-r)*cx2 + (1+g)*(1)*');
  Writeln(MyFile,'     *(1-r)*cx3+ (1-g)*(1)*(1-r)*cx4+ (1-g)*(-1)*(1+r)*cx5+ (1+g)*(-1)*');
  Writeln(MyFile,'     *(1+r)*cx6+ (1+g)*(1)*(1+r)*cx7+ (1-g)*(1)*(1+r)*cx8');

  Writeln(MyFile,'        f1r = (1-g)*(1-h)*(-1)*cx1 + (1+g)*(1-h)*(-1)*cx2 +(1+g)*(1+h)*');
  Writeln(MyFile,'     *(-1)*cx3+ (1-g)*(1+h)*(-1)*cx4+ (1-g)*(1-h)*(1)*cx5+ (1+g)*(1-h)*');
  Writeln(MyFile,'     *(1)*cx6+ (1+g)*(1+h)*(1)*cx7+ (1-g)*(1+h)*(1)*cx8');

  Writeln(MyFile,'        f2g = (-1)*(1-h)*(1-r)*cy1 + (1)*(1-h)*(1-r)*cy2 +');
  Writeln(MyFile,'     *(1)*(1+h)*(1-r)*cy3+(-1)*(1+h)*(1-r)*cy4+ (-1)*(1-h)*(1+r)*');
  Writeln(MyFile,'     *cy5+ (1)*(1-h)*(1+r)*cy6+(1)*(1+h)*(1+r)*cy7+(-1)*(1+h)*(1+r)*cy8');

  Writeln(MyFile,'        f2h = (1-g)*(-1)*(1-r)*cy1 + (1+g)*(-1)*(1-r)*cy2 + (1+g)*(1)*');
  Writeln(MyFile,'     *(1-r)*cy3+ (1-g)*(1)*(1-r)*cy4+ (1-g)*(-1)*(1+r)*cy5+ (1+g)*(-1)*');
  Writeln(MyFile,'     *(1+r)*cy6+ (1+g)*(1)*(1+r)*cy7+ (1-g)*(1)*(1+r)*cy8');

  Writeln(MyFile,'        f2r = (1-g)*(1-h)*(-1)*cy1 + (1+g)*(1-h)*(-1)*cy2 +(1+g)*(1+h)*');
  Writeln(MyFile,'     *(-1)*cy3+ (1-g)*(1+h)*(-1)*cy4+ (1-g)*(1-h)*(1)*cy5+ (1+g)*(1-h)*');
  Writeln(MyFile,'     *(1)*cy6+ (1+g)*(1+h)*(1)*cy7+ (1-g)*(1+h)*(1)*cy8');

  Writeln(MyFile,'        f3g = (-1)*(1-h)*(1-r)*cz1 + (1)*(1-h)*(1-r)*cz2 + (1)*(1+h)*');
  Writeln(MyFile,'     *(1-r)*cz3+ (-1)*(1+h)*(1-r)*cz4+ (-1)*(1-h)*(1+r)*cz5+ (1)*(1-h)* ');
  Writeln(MyFile,'     *(1+r)*cz6 + (1)*(1+h)*(1+r)*cz7+ (-1)*(1+h)*(1+r)*cz8');

  Writeln(MyFile,'        f3h = (1-g)*(-1)*(1-r)*cz1 + (1+g)*(-1)*(1-r)*cz2 + (1+g)*(1)*');
  Writeln(MyFile,'     *(1-r)*cz3+ (1-g)*(1)*(1-r)*cz4+ (1-g)*(-1)*(1+r)*cz5+ (1+g)*(-1)*');
  Writeln(MyFile,'     *(1+r)*cz6+ (1+g)*(1)*(1+r)*cz7+ (1-g)*(1)*(1+r)*cz8 ');

  Writeln(MyFile,'        f3r = (1-g)*(1-h)*(-1)*cz1 + (1+g)*(1-h)*(-1)*cz2 +(1+g)*(1+h)*');
  Writeln(MyFile,'     *(-1)*cz3+ (1-g)*(1+h)*(-1)*cz4+ (1-g)*(1-h)*(1)*cz5+ (1+g)*(1-h)*');
  Writeln(MyFile,'     *(1)*cz6+ (1+g)*(1+h)*(1)*cz7+ (1-g)*(1+h)*(1)*cz8');

  Writeln(MyFile,'        det = f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*');
  Writeln(MyFile,'     *f3h+f3g*f1h*f2r-f3g*f1r*f2h ');
  Writeln(MyFile,'        g = g + (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*');
  Writeln(MyFile,'     *f1h*f2r-f3*f1r*f2h)/det');
  Writeln(MyFile,'        h = h + (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*');
  Writeln(MyFile,'     *f1*f2r-f3g*f1r*f2)/det');
  Writeln(MyFile,'        r = r + (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*');
  Writeln(MyFile,'     *f1h*f2-f3g*f1*f2h)/det');



Writeln(MyFile,'        value1= ((1-g)*(1-h)*(1-r)*eps(elements(main_el_num,2)) +');
Writeln(MyFile,'     * (1+g)*(1-h)*(1-r)*eps(elements(main_el_num,3))+');
Writeln(MyFile,'     * (1+g)*(1+h)*(1-r)*eps(elements(main_el_num,4))+');
Writeln(MyFile,'     * (1-g)*(1+h)*(1-r)*eps(elements(main_el_num,5))+');
Writeln(MyFile,'     * (1-g)*(1-h)*(1+r)*eps(elements(main_el_num,6))+');
Writeln(MyFile,'     * (1+g)*(1-h)*(1+r)*eps(elements(main_el_num,7))+');
Writeln(MyFile,'     * (1+g)*(1+h)*(1+r)*eps(elements(main_el_num,8))+');
Writeln(MyFile,'     *(1-g)*(1+h)*(1+r)*eps(elements(main_el_num,9)))/8');


Writeln(MyFile,'      endif');
Writeln(MyFile,'      if ((element_type == 4).or.(element_type == 10)) then');
Writeln(MyFile,'                cx(1) = coord1(elements(main_el_num,2))');
Writeln(MyFile,'		cx(2) = coord1(elements(main_el_num,3))');
Writeln(MyFile,'		cx(3) = coord1(elements(main_el_num,4))');
Writeln(MyFile,'		cx(4) = coord1(elements(main_el_num,5))');

Writeln(MyFile,'		cy(1) = coord2(elements(main_el_num,2))');
Writeln(MyFile,'		cy(2) = coord2(elements(main_el_num,3))');
Writeln(MyFile,'		cy(3) = coord2(elements(main_el_num,4))');
Writeln(MyFile,'		cy(4) = coord2(elements(main_el_num,5))');

Writeln(MyFile,'		cz(1) = coord3(elements(main_el_num,2))');
Writeln(MyFile,'		cz(2) = coord3(elements(main_el_num,3))');
Writeln(MyFile,'		cz(3) = coord3(elements(main_el_num,4))');
Writeln(MyFile,'		cz(4) = coord3(elements(main_el_num,5))');

Writeln(MyFile,'		xn = COORDS(1)');
Writeln(MyFile,'		yn = COORDS(2)');
Writeln(MyFile,'		zn = COORDS(3)');


Writeln(MyFile,'		det = (cx(2)-cx(1))*(cy(3)-cy(1))*(cz(4)-cz(1)) -');
Writeln(MyFile,'     *(cx(2)-cx(1))*(cy(4)-cy(1))*(cz(3)-cz(1))-(cy(2)-cy(1))*(cx(3)-');
Writeln(MyFile,'     *cx(1))*(cz(4)-cz(1))+(cy(2)-cy(1))*(cx(4)-cx(1))*(cz(3)-cz(1))+');
Writeln(MyFile,'     *(cz(2)-cz(1))*(cx(3)-cx(1))*(cy(4)-cy(1))-(cz(2)-cz(1))*(cx(4)-');
Writeln(MyFile,'     *cx(1))*(cy(3)-cy(1))');

Writeln(MyFile,'		g = ((xn-cx(1))*(cy(3)-cy(1))*(cz(4)-cz(1))-');
Writeln(MyFile,'     *(xn-cx(1))*(cy(4)-cy(1))*(cz(3)-cz(1))-(yn-cy(1))*(cx(3)-');
Writeln(MyFile,'     *cx(1))*(cz(4)-cz(1))+(yn-cy(1))*(cx(4)-cx(1))*(cz(3)-cz(1))+');
Writeln(MyFile,'     *(zn-cz(1))*(cx(3)-cx(1))*(cy(4)-cy(1))-(zn-cz(1))*(cx(4)-');
Writeln(MyFile,'     *cx(1))*(cy(3)-cy(1)))/det');

Writeln(MyFile,'		h = ((cx(2)-cx(1))*(yn-cy(1))*(cz(4)-cz(1))-(cx(2)-');
Writeln(MyFile,'     *cx(1))*(cy(4)-cy(1))*(zn-cz(1))-(cy(2)-cy(1))*(xn-cx(1))*(cz(4)-');
Writeln(MyFile,'     *cz(1))+(cy(2)-cy(1))*(cx(4)-cx(1))*(zn-cz(1))+(cz(2)-cz(1))*(xn-');
Writeln(MyFile,'     *cx(1))*(cy(4)-cy(1))-(cz(2)-cz(1))*(cx(4)-cx(1))*(yn-cy(1)))/det');

Writeln(MyFile,'		r = ((cx(2)-cx(1))*(cy(3)-cy(1))*(zn-cz(1))-(cx(2)-');
Writeln(MyFile,'     *cx(1))*(yn-cy(1))*(cz(3)-cz(1))-(cy(2)-cy(1))*(cx(3)-cx(1))*(zn-');
Writeln(MyFile,'     *cz(1))+(cy(2)-cy(1))*(xn-cx(1))*(cz(3)-cz(1))+(cz(2)-');
Writeln(MyFile,'     *cz(1))*(cx(3)-cx(1))*(yn-cy(1))-(cz(2)-cz(1))*(xn-cx(1))*(cy(3)-');
Writeln(MyFile,'     *cy(1)))/det');


Writeln(MyFile,'	value1= (1-g-h-r)*eps(elements(main_el_num,2)) +');
Writeln(MyFile,'     * g*eps(elements(main_el_num,3)) +');
Writeln(MyFile,'     *h*eps(elements(main_el_num,4)) +');
Writeln(MyFile,'     *r*eps(elements(main_el_num,5))');
Writeln(MyFile,'      endif');

  Writeln(MyFile,'      if ((element_type == 6).or.(element_type == 15)) then');
  Writeln(MyFile,'      cx1 = coord1(elements(main_el_num,2))');
  Writeln(MyFile,'      cx2 = coord1(elements(main_el_num,3))');
  Writeln(MyFile,'      cx3 = coord1(elements(main_el_num,4))');
  Writeln(MyFile,'      cx4 = coord1(elements(main_el_num,5))');
  Writeln(MyFile,'      cx5 = coord1(elements(main_el_num,6))');
  Writeln(MyFile,'      cx6 = coord1(elements(main_el_num,7))');


  Writeln(MyFile,'      cy1 = coord2(elements(main_el_num,2))');
  Writeln(MyFile,'      cy2 = coord2(elements(main_el_num,3))');
  Writeln(MyFile,'      cy3 = coord2(elements(main_el_num,4))');
  Writeln(MyFile,'      cy4 = coord2(elements(main_el_num,5))');
  Writeln(MyFile,'      cy5 = coord2(elements(main_el_num,6))');
  Writeln(MyFile,'      cy6 = coord2(elements(main_el_num,7))');


  Writeln(MyFile,'      cz1 = coord3(elements(main_el_num,2))');
  Writeln(MyFile,'      cz2 = coord3(elements(main_el_num,3))');
  Writeln(MyFile,'      cz3 = coord3(elements(main_el_num,4))');
  Writeln(MyFile,'      cz4 = coord3(elements(main_el_num,5))');
  Writeln(MyFile,'      cz5 = coord3(elements(main_el_num,6))');
  Writeln(MyFile,'      cz6 = coord3(elements(main_el_num,7))');

  Writeln(MyFile,'      g = 0.500000000000000001');
  Writeln(MyFile,'      h = 0.50000000000021');
  Writeln(MyFile,'      r = 0.00000000000001');
  Writeln(MyFile,'	   xn = COORDS(1)');
  Writeln(MyFile,'	   yn = COORDS(2)');
  Writeln(MyFile,'	   zn = COORDS(3)');
  Writeln(MyFile,'      f1 = (-1)*((1-g-h)*(1-r)*cx1 + g*(1-r)*cx2 + h*(1-r)*cx3');
  Writeln(MyFile,'     *+(1-g-h)*(1+r)*cx4 + g*(1+r)*cx5 + h*(1+r)*cx6 - 2*xn)');
  Writeln(MyFile,'      f2 = (-1)*((1-g-h)*(1-r)*cy1 + g*(1-r)*cy2 + h*(1-r)*cy3');
  Writeln(MyFile,'     *+ (1-g-h)*(1+r)*cy4 + g*(1+r)*cy5 + h*(1+r)*cy6 - 2*yn)');
  Writeln(MyFile,'      f3 = (-1)*((1-g-h)*(1-r)*cz1 + g*(1-r)*cz2 + h*(1-r)*cz3');
  Writeln(MyFile,'     *+ (1-g-h)*(1+r)*cz4 + g*(1+r)*cz5 + h*(1+r)*cz6 - 2*zn)');


  Writeln(MyFile,'      f1g = (-1)*(1-r)*cx1 + (1-r)*cx2 +(-1)*(1+r)*cx4 + (1+r)*cx5');
  Writeln(MyFile,'      f1h = (-1)*(1-r)*cx1 + (1-r)*cx3 + (-1)*(1+r)*cx4 +(1+r)*cx6');
  Writeln(MyFile,'      f1r = (1-g-h)*(-1)*cx1 + g*(-1)*cx2 + h*(-1)*cx3 +');
  Writeln(MyFile,'     *(1-g-h)*(1)*cx4 + g*(1)*cx5 + h*(1)*cx6');

  Writeln(MyFile,'      f2g = (-1)*(1-r)*cy1 + (1-r)*cy2 +(-1)*(1+r)*cy4 + (1+r)*cy5');
  Writeln(MyFile,'      f2h = (-1)*(1-r)*cy1 + (1-r)*cy3 + (-1)*(1+r)*cy4 +(1+r)*cy6');
  Writeln(MyFile,'      f2r = (1-g-h)*(-1)*cy1 + g*(-1)*cy2 + h*(-1)*cy3 +');
  Writeln(MyFile,'     *(1-g-h)*(1)*cy4 + g*(1)*cy5 + h*(1)*cy6');

  Writeln(MyFile,'      f3g = (-1)*(1-r)*cz1 + (1-r)*cz2 +(-1)*(1+r)*cz4 + (1+r)*cz5');
  Writeln(MyFile,'      f3h = (-1)*(1-r)*cz1 + (1-r)*cz3 + (-1)*(1+r)*cz4 +(1+r)*cz6');
  Writeln(MyFile,'      f3r = (1-g-h)*(-1)*cz1 + g*(-1)*cz2 + h*(-1)*cz3 +');
  Writeln(MyFile,'     *(1-g-h)*(1)*cz4 + g*(1)*cz5 + h*(1)*cz6');

  Writeln(MyFile,'      det = f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+');
  Writeln(MyFile,'     *f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h');
  Writeln(MyFile,'      g = g + (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+');
  Writeln(MyFile,'     *f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det');
  Writeln(MyFile,'      h = h + (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+');
  Writeln(MyFile,'     *f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det');
  Writeln(MyFile,'      r = r + (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+');
  Writeln(MyFile,'     *f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det');

  Writeln(MyFile,'	value1= ((1-g-h)*(1-r)*eps(elements(main_el_num,2)) +');
  Writeln(MyFile,'     *g*(1-r)*eps(elements(main_el_num,3)) +');
  Writeln(MyFile,'     *h*(1-r)*eps(elements(main_el_num,4)) +');
  Writeln(MyFile,'     *(1-g-h)*(1+r)*eps(elements(main_el_num,5))+');
  Writeln(MyFile,'     *g*(1+r)*eps(elements(main_el_num,6))+');
  Writeln(MyFile,'     *h*(1+r)*eps(elements(main_el_num,7)))/2');

  Writeln(MyFile,'      endif');



      Writeln(MyFile,'            EQPS = value1+(value1*'+ScaleFactor+')');

      Writeln(MyFile,'        ENDIF');
    Writeln(MyFile,'      ENDIF');
  Writeln(MyFile,'      RETURN');
  Writeln(MyFile,'      END');
  end;

end;
close(MyFile);
end;
end;

procedure CreateAnsysFiles(const filename: string;
                           const Nodes : TRealRealArray;
                           const NodesInIntegration :  TRealRealArray;
                           const Elements: TIntegerIntegerArray;
                           const NodesInElement : TIntegerArray;
                           const Stresses : TRealRealArray;
                           const Displacements : TRealRealArray;
                           const TotalStrains : TRealRealArray;
                           const PlasticStrains : TRealRealArray;
                           const AccumulatedStrains : TRealRealArray);
var
i,br,element_number1 : integer;
element_number2 : real;
MyFile : TextFile;
begin
if Stresses <> nil then
begin
  Element_number1 := 0;
  Assignfile(MyFile,filename + '_v10.ist');
  ReWrite(MyFile);
   for i := low(Stresses) to high(Stresses) do
   begin
     if i = 0 then
     begin
     element_number2 := NodesInIntegration[i,0];
     WriteLn(MyFile,'eis,  '+ floattostr(NodesInIntegration[i,0]));
     end
     else
     begin
       if element_number2 <> NodesInIntegration[i,0] then
       begin
         element_number2 :=  NodesInIntegration[i,0];
         element_number1 := 0;
         WriteLn(MyFile,'eis,  '+ floattostr(NodesInIntegration[i,0]));
       end;
       
     end;

     Element_number1 := element_number1 + 1;

     WriteLn(MyFile,floattostr(Stresses[i,0])+', '+floattostr(Stresses[i,1])+', '+floattostr(Stresses[i,2])+', '+floattostr(Stresses[i,3])+', '+floattostr(Stresses[i,4])+', '+floattostr(Stresses[i,5]));
   end;
  Close(MyFile);
  Element_number1 := 0;
  Assignfile(MyFile,filename + '.ist');
  ReWrite(MyFile);
   for i := low(Stresses) to high(Stresses) do
   begin
     if i = 0 then
     begin
     element_number2 := NodesInIntegration[i,0];
     end
     else
     begin
       if element_number2 <> NodesInIntegration[i,0] then
       begin
         element_number2 :=  NodesInIntegration[i,0];
         element_number1 := 0;
       end;

     end;

     Element_number1 := element_number1 + 1;

     WriteLn(MyFile,Floattostr(NodesInIntegration[i,0])+','+inttostr(element_number1)+',1,1,'+floattostr(Stresses[i,0])+', '+floattostr(Stresses[i,1])+', '+floattostr(Stresses[i,2])+', '+floattostr(Stresses[i,3])+', '+floattostr(Stresses[i,4])+', '+floattostr(Stresses[i,5]));
   end;
  Close(MyFile);

  Assignfile(MyFile,filename + '.txt');
  ReWrite(MyFile);
   for i := low(Nodes) to high(Nodes) do
   begin

     WriteLn(MyFile,'NMODIF,'+Floattostr(Nodes[i,0])+','+floattostr(Nodes[i,1]+Displacements[i,0])+','+floattostr(Nodes[i,2]+Displacements[i,1])+','+floattostr(Nodes[i,3]+Displacements[i,2]));
   end;
  Close(MyFile);
end;
end;
{
 memo.Lines.Add('!************************** Mapped and transferred stresses using FEDES*********************');
  br := 0;
  br_el := 1;
  for i := low(form1.x_coord_2) to high(form1.x_coord_2) do
  begin
    br := br + 1;
    if br=1 then
    begin
    memo.Lines.Add('!      Sx         Sy           Sz           Sxy         Syz         Sxz');
    memo.Lines.Add('eis,  '+ inttostr(br_el+41464)+',1');
    end;
    if br <= 1 then
    begin
       memo.Lines.Add(floattostr(form1.stress11_2[i])+', '+floattostr(form1.stress22_2[i])+', '+floattostr(form1.stress33_2[i])+', '+floattostr(form1.stress12_2[i])+', '+floattostr(form1.stress23_2[i])+', '+floattostr(form1.stress13_2[i]));
    end
    else
    begin
      br := 1;
      br_el := br_el + 1;
      memo.Lines.Add('!      Sx         Sy           Sz           Sxy         Syz         Sxz');
      memo.Lines.Add('eis,  '+ inttostr(br_el+41464)+',1');
      memo.Lines.Add(floattostr(form1.stress11_2[i])+', '+floattostr(form1.stress22_2[i])+', '+floattostr(form1.stress33_2[i])+', '+floattostr(form1.stress12_2[i])+', '+floattostr(form1.stress23_2[i])+', '+floattostr(form1.stress13_2[i]));

    end;

  end;

end;
procedure create_ansys_isstress_file1(memo : TMemo;s_factor : string);
var
i,br,br_el : integer;
begin
 memo.Lines.Add('!************************** Mapped and transferred stresses using FEDES*********************');
  br := 0;
  br_el := 1;
  for i := low(form1.x_coord_2) to high(form1.x_coord_2) do
  begin
    br := br + 1;
    if br <= 1 then
    begin
       memo.Lines.Add(inttostr(br_el+41464)+','+inttostr(br)+',1,1,'+floattostr(form1.stress11_2[i])+', '+floattostr(form1.stress22_2[i])+', '+floattostr(form1.stress33_2[i])+', '+floattostr(form1.stress12_2[i])+', '+floattostr(form1.stress23_2[i])+', '+floattostr(form1.stress13_2[i]));
    end;
    if br=1 then
    
    begin
     br_el := br_el + 1;
     br := 0;
    end;
  end;


end;
}
procedure CreateFortranAbaqusFile(const filename1 : string;
                                  const filename2: string;
                                  const Nodes : TRealRealArray;
                                  const Displacements : TRealRealArray;
                                  const Stresses : TRealRealArray;
                                  const AccumulatedStrain : TRealRealArray);
var
i,AnzTokens,step : integer;
file_content,MyFile : textfile;
c,part_name: string;
A,A1 : TShortStringArray;
action,br : integer;
pl_st : real;
br_node : integer;
s3,s5,s6 : real;
begin
br_node := 0;
br := 0;
part_name:='';
step := 0 ;
Assignfile(file_content,filename1);
Reset(file_content);
Assignfile(MyFile,filename2+'.inp');
ReWrite(myFile);
      while not eof(file_content) do
      begin
      br := br + 1;
      readln(file_content,c);
      if (pos('*',lowercase(c)) > 0) then
      action := 1;
      if (pos('*node',lowercase(c)) = 1) then
      begin
      br_node := br_node+1;
      action := 2;
      br := 0;
      WriteLn(myFile,c);
      end;

      if (action=2)and (br=0)and(br_node=1)then
      for i := 0 to high(Nodes) do
      WriteLn(myFile,floattostr(Nodes[i,0])+','+floattostr(Nodes[i,1]+Displacements[i,0])+','+floattostr(Nodes[i,2]+Displacements[i,1])+','+floattostr(Nodes[i,3]+Displacements[i,2]));

      if (pos('*step',lowercase(c)) > 0) and (step = 0) then
      begin
                step := 1;
                WriteLn(myFile,'**========= Initial conditions by FEDES ==========');
                if Stresses <> nil then
                begin
                 WriteLn(myFile,'*INITIAL CONDITION,TYPE=STRESS,USER');
                end;

                if AccumulatedStrain <> nil then
                begin
                        WriteLn(myFile,'*INITIAL CONDITION,TYPE=HARDENING,USER');
                end;

                 WriteLn(myFile,'**========End of the initial stresses ==========');
      end;
      if action=1 then
      WriteLn(myFile,c);
      end;
Close(MyFile);
Close(file_content);
end;

procedure CreateAbaqusFile(const filename1: string;
                           const filename2: string;
                           const Nodes :  TRealRealArray;
                           const Elements : TIntegerIntegerArray;
                           const Stresses : TRealRealArray;
                           const Displacements : TRealRealArray;
                           const TotalStrains : TRealRealArray;
                           const PlasticStrains : TRealRealArray;
                           const AccumulatedStrains : TRealRealArray);
var
i,AnzTokens,step : integer;
file_content,MyFile : textfile;
c,part_name: string;
A,A1 : TShortStringArray;
action,br : integer;
pl_st : real;
br_node : integer;
s3,s5,s6 : real;
begin
br_node := 0;
br := 0;
part_name:='';
step := 0 ;
Assignfile(file_content,filename1);
Reset(file_content);
Assignfile(MyFile,filename2+'.inp');
ReWrite(myFile);
      while not eof(file_content) do
      begin
      br := br + 1;
      readln(file_content,c);
        if (pos('*instance',lowercase(c)) > 0) then
        begin
        AnzTokens := explode(A,',',trim(c));
        AnzTokens := explode(A1,'=',trim(A[1]));
        part_name := trim(A1[1])+'.';
        //part_name := 'Part-2.';
        A := nil;
        A1 := nil;
        end;

      if (pos('*',lowercase(c)) > 0) then
      action := 1;
      if (pos('*node',lowercase(c)) = 1) then
      begin
      br_node := br_node+1;
      action := 2;
      br := 0;
      WriteLn(myFile,c);
      end;

      if (action=2)and (br=0)and(br_node=1)then
      for i := 0 to high(Nodes) do
      WriteLn(myFile,floattostr(Nodes[i,0])+','+floattostr(Nodes[i,1]+Displacements[i,0])+','+floattostr(Nodes[i,2]+Displacements[i,1])+','+floattostr(Nodes[i,3]+Displacements[i,2]));

      if (pos('*step',lowercase(c)) > 0) and (step = 0) then
      begin
                step := 1;
                WriteLn(myFile,'**========= Initial conditions by FEDES ==========');
                if Stresses <> nil then
                begin
                        s3 := sum_array_col(stresses,2);
                        s5 := sum_array_col(stresses,4);
                        s6 := sum_array_col(stresses,5);
                        WriteLn(myFile,'*INITIAL CONDITION,TYPE=STRESS');
                        for i := low(Stresses) to high(Stresses) do
                        begin
                        if (s3<>0)and(s5<>0)and(s6<>0) then
                        WriteLn(myFile,part_name+inttostr(Elements[i,0])+','+floattostr(Stresses[i,0])+','+floattostr(Stresses[i,1])+','+floattostr(Stresses[i,2])+','+floattostr(Stresses[i,3])+','+floattostr(Stresses[i,5])+','+floattostr(Stresses[i,4])) ;
                        if (s3=0)and(s5=0)and(s6=0) then
                        WriteLn(myFile,part_name+inttostr(Elements[i,0])+','+floattostr(Stresses[i,0])+','+floattostr(Stresses[i,1])+','+floattostr(Stresses[i,3])) ;
                        if (s3<>0)and(s5=0)and(s6=0) then
                        WriteLn(myFile,part_name+inttostr(Elements[i,0])+','+floattostr(Stresses[i,0])+','+floattostr(Stresses[i,1])+','+floattostr(Stresses[i,2])+','+floattostr(Stresses[i,3])) ;
                        end;
                end;

                if AccumulatedStrains <> nil then
                begin
                        WriteLn(myFile,'*INITIAL CONDITION,TYPE=HARDENING');
                        for i := low(AccumulatedStrains) to high(AccumulatedStrains) do
                        begin
                                if AccumulatedStrains[i,0] < 0 then
                                pl_st:= 0
                                else pl_st := AccumulatedStrains[i,0];

                        WriteLn(myFile,part_name+inttostr(Elements[i,0])+','+floattostr(pl_st)) ;
                        end;
                end;

                if PlasticStrains <> nil then
                begin
                        s3 := sum_array_col(PlasticStrains,3);
                        s5 := sum_array_col(PlasticStrains,4);
                        s6 := sum_array_col(PlasticStrains,5);
                        WriteLn(myFile,'*INITIAL CONDITION,TYPE=PLASTIC STRAIN');
                        for i := low(PlasticStrains) to high(PlasticStrains) do
                        begin
                        if (s3<>0)and(s5<>0)and(s6<>0) then
                        WriteLn(myFile,part_name+inttostr(Elements[i,0])+','+floattostr(PlasticStrains[i,0])+','+floattostr(PlasticStrains[i,1])+','+floattostr(PlasticStrains[i,2])+','+floattostr(PlasticStrains[i,3])+','+floattostr(PlasticStrains[i,5])+','+floattostr(PlasticStrains[i,4]));
                        if (s3=0)and(s5=0)and(s6=0) then
                        WriteLn(myFile,part_name+inttostr(Elements[i,0])+','+floattostr(PlasticStrains[i,0])+','+floattostr(PlasticStrains[i,1])+','+floattostr(PlasticStrains[i,3]));
                        if (s3<>0)and(s5=0)and(s6=0) then
                        WriteLn(myFile,part_name+inttostr(Elements[i,0])+','+floattostr(PlasticStrains[i,0])+','+floattostr(PlasticStrains[i,1])+','+floattostr(PlasticStrains[i,2])+','+floattostr(PlasticStrains[i,3]));
                        end;
                end;
                 WriteLn(myFile,'**========End of the initial stresses ==========');
      end;
      if action=1 then
      WriteLn(myFile,c);
      end;
Close(MyFile);
Close(file_content);
end;

procedure CreateDeformFile(const filename1: string;
                            const filename2: string;
                            const Nodes : TRealRealArray;
                            const Elements: TIntegerIntegerArray;
                            const NodesInElement : TIntegerArray;
                            const Stresses : TRealRealArray;
                            const Displacements : TRealRealArray;
                            const TotalStrains : TRealRealArray;
                            const PlasticStrains : TRealRealArray;
                            const AccumulatedStrains : TRealRealArray);
var
i: integer;
file_content_,MyFile : textfile;
c: string;
begin

Assignfile(file_content_,filename1);
Reset(File_content_);
      Assignfile(MyFile,filename2+'.key');
      ReWrite(MyFile);
      while not eof(file_content_) do
        begin
          readln(file_content_,c);

          if (pos('STRESS',c) =1) and (Stresses<>nil) then
          begin
             WriteLn(myFile,format('%s%8d%8d%16.8e',['STRESS',1,length(Stresses),0.0]));
             for i := low(Stresses) to high(Stresses) do
             begin
              WriteLn(myFile,format('%8d%16.8e%16.8e%16.8e%16.8e%16.8e',[Elements[i,0],Stresses[i,0],Stresses[i,1],Stresses[i,2],Stresses[i,3],Stresses[i,4]]));
              WriteLn(myFile,format('%24.8e',[Stresses[i,5]]));
             end;
          end
          else if (pos('STNCMP',c) =1) and (TotalStrains<>nil) then
          begin
             WriteLn(myFile,format('%s%8d%8d%8d%16.8e',['STNCMP',1, length(TotalStrains),6,0.0]));
             for i := low(TotalStrains) to high(TotalStrains) do
             begin
              WriteLn(myFile,format('%8d%16.8e%16.8e%16.8e%16.8e%16.8e',[Elements[i,0],TotalStrains[i,0],TotalStrains[i,1],TotalStrains[i,2],TotalStrains[i,3],TotalStrains[i,4]]));
              WriteLn(myFile,format('%24.8e',[TotalStrains[i,5]]));
             end;
          end
          else if (pos('STRAIN',c) =1) and (AccumulatedStrains<>nil) then
          begin
             WriteLn(myFile,format('%s%8d%8d%16.8e',['STNCMP',1, length(AccumulatedStrains),0.0]));
             for i := low(AccumulatedStrains) to high(AccumulatedStrains) do
             begin
              WriteLn(myFile,format('%8d%16.8e',[Elements[i,0],AccumulatedStrains[i,0]]));
             end;
          end
          else if (pos('DRZ',c) =1) and (Displacements<>nil) then
          begin
          WriteLn(myFile,format('%-8s%6d%8d%16.8e',['DRZ',1,length(Nodes),0.0]));
             for i := low(Nodes) to high(Nodes) do
             WriteLn(myFile,format('%8d%16.8e%16.8e%16.8e',[trunc(Nodes[i,0]),Displacements[i,0],Displacements[i,1],Displacements[i,2]]));
          end
          else
                begin
                 WriteLn(myFile,c);
                end;

        end;
Close(file_content_);
end;
procedure CreateMorpheoFile(const filename1: string;
                            const filename2: string;
                            const Nodes : TRealRealArray;
                            const Elements: TIntegerIntegerArray;
                            const NodesInElement : TIntegerArray;
                            const Stresses : TRealRealArray;
                            const Displacements : TRealRealArray;
                            const TotalStrains : TRealRealArray;
                            const PlasticStrains : TRealRealArray;
                            const AccumulatedStrains : TRealRealArray);
var
i : integer;
file_content_,MyFile : textfile;
c: string;
Stress_bool, AccumulatedStrain_bool, Displacement_bool : boolean;
begin
Stress_bool := Stresses <> nil;
AccumulatedStrain_bool := AccumulatedStrains <> nil;
Displacement_bool := Displacements <> nil;
Assignfile(file_content_,filename1);
Reset(File_content_);
      Assignfile(MyFile,filename2+'.vtu');
      ReWrite(MyFile);
      while not eof(file_content_) do
        begin
          readln(file_content_,c);
          if (pos('<Piece',c) > 0) and (pos('NumberOfPoints',c) > 0) then
          begin
             WriteLn(MyFile,c);
             if Displacement_bool then
             begin
             WriteLn(MyFile,'<PointData>');
             WriteLn(MyFile,'<DataArray type="Float64" Name="Displacement" NumberOfComponents="3" format="ascii" >');
             for i := low(Displacements) to high(Displacements) do
             WriteLn(MyFile,' '+floattostrf(Displacements[i,0],ffExponent,11,2)+' '+floattostrf(Displacements[i,1],ffExponent,11,2)+' '+floattostrf(Displacements[i,2],ffExponent,11,2));
             WriteLn(MyFile,'</DataArray>');
             WriteLn(MyFile,'</PointData>');
             end;
             
             if (Stress_bool) or (AccumulatedStrain_bool)then
             begin
             WriteLn(MyFile,'<CellData>');
                 if (Stress_bool) then
                 begin
                  WriteLn(MyFile,'<DataArray type="Float64" Name="stress" NumberOfComponents="9" format="ascii" >');
                  for i := low(Stresses) to high(Stresses) do
                  WriteLn(MyFile,' '+floattostrf(Stresses[i,0],ffExponent,11,2)+' '+floattostrf(Stresses[i,3],ffExponent,11,2)+' '+floattostrf(Stresses[i,5],ffExponent,11,2)+' '+floattostrf(Stresses[i,3],ffExponent,11,2)+' '+floattostrf(Stresses[i,1],ffExponent,11,2)+' '+floattostrf(Stresses[i,4],ffExponent,11,2)+' '+floattostrf(stresses[i,5],ffExponent,11,2)+' '+floattostrf(Stresses[i,4],ffExponent,11,2)+' '+floattostrf(Stresses[i,2],ffExponent,11,2));

                  WriteLn(MyFile,'</DataArray>');
                 end;
                 if (AccumulatedStrain_bool) then
                 begin
                  WriteLn(MyFile,'<DataArray type="Float64" Name="accumulated_plastic_strain" NumberOfComponents="1" format="ascii" >');
                  for i := low(AccumulatedStrains) to high(AccumulatedStrains) do
                  WriteLn(MyFile,' '+floattostrf(AccumulatedStrains[i,0],ffExponent,11,2));
                  WriteLn(MyFile,'</DataArray>');
                 end;
             WriteLn(MyFile,'</CellData>');
             end;
          end
          else
          WriteLn(MyFile,c);

        end;
        Close(MyFile);
Close(file_content_);
end;
{
procedure create_deform_key_file(const s1,s2,s3,s12,s23,s13 : array of real;memo : TMemo;str_ : string);


end;
procedure create_morpheo_nodal_stress (memo : Tmemo; str_ : string);
var
i : integer;
file_content_ : textfile;
c: string;
begin
Assignfile(file_content_,str_);
Reset(File_content_);
      while not eof(file_content_) do
        begin
          readln(file_content_,c);
          if (pos('<Piece',c) > 0) and (pos('NumberOfPoints',c) > 0) then
          begin
          memo.Lines.Add(c);
             memo.Lines.Add('<PointData Tensors="stress" >');
             memo.Lines.Add('<DataArray type="Float64" Name="stress" NumberOfComponents="9" format="ascii" >');
             for i := low(form1.stress11_2) to high(form1.stress11_2) do
             begin
             memo.Lines.Add(' '+floattostr(form1.stress11_2[i])+' '+floattostr(form1.stress12_2[i])+' '+floattostr(form1.stress13_2[i])+' '+floattostr(form1.stress12_2[i])+' '+floattostr(form1.stress22_2[i])+' '+floattostr(form1.stress23_2[i])+' '+floattostr(form1.stress13_2[i])+' '+floattostr(form1.stress23_2[i])+' '+floattostr(form1.stress33_2[i]));
             end;
          memo.Lines.Add('</DataArray>');
          memo.Lines.Add('</PointData>');
          end
          else
          memo.Lines.Add(c);

        end;
Close(file_content_);
end;
procedure create_morpheo_element_stress (const s1,s2,s3,s12,s23,s13 : array of real;memo : Tmemo; str_ : string);

procedure create_marc_output_file (const s1,s2,s3 : array of real;memo:Tmemo;str_ : string);
var
i,action,j : integer;
file_content_ : textfile;
c: string;
begin
action := 0;
Assignfile(file_content_,str_);
Reset(File_content_);
while not eof(file_content_) do
        begin
          readln(file_content_,c);
          if (pos('=beg=52300',c) > 0) then
          begin
          action := 1;
          memo.Lines.Add('=beg=52300 (Element Integration Point Values)');
          end;
          if (pos('=end=',c) > 0) then
          action := 0;
          if (action=1) and (pos('=beg=52300',c) > 0) then
          begin
            for i := low(s1) to high(s1) do
            for j := 0 to high(form1.elements_2[0])-1 do
            begin
            memo.Lines.Add('0 0 '+floattostr(s1[i])+' '+floattostr(s2[i])+' '+floattostr(s3[i])+' 0');
            memo.Lines.Add('0 0 ');
            end;
          end
          else if action=0 then
            memo.Lines.Add(c);
        end;
Close(file_content_);
end;
}
procedure createXML1(const filename: string;
                    const Nodes : TRealRealArray;
                    const Elements: TIntegerIntegerArray;
                    const NodesInElement : TIntegerArray;
                    const Stresses : TRealRealArray;
                    const Displacements : TRealRealArray;
                    const TotalStrains : TRealRealArray;
                    const PlasticStrains : TRealRealArray;
                    const AccumulatedStrains : TRealRealArray);
var
i,j,num,node_in_el,br, num_di : integer;
str : string;
s1,s2,s3 : real;
myFile : TextFile;
z_coord : real;
begin
 num := 0;
 str := '';

  AssignFile(myFile, filename + '.vtu');
  ReWrite(myFile);

 WriteLn(myFile,'<?xml version="1.0"?>');
 WriteLn(myFile,'<VTKFile type="UnstructuredGrid" version="0.1" byte_order="LittleEndian" >');
 WriteLn(myFile,'<UnstructuredGrid>');
 WriteLn(myFile,'<Piece NumberOfPoints="'+ inttostr(length(Nodes)) +'" NumberOfCells="'+ inttostr(length(Elements)) +'" >');
 //if length(MainForm.stress11_2)= length(MainForm.x_coord_2) then
 //begin
 if (Displacements <> nil) and (Stresses <> nil) or (PlasticStrains <> nil) or (TotalStrains <> nil) or (AccumulatedStrains <> nil)  then
 begin
 WriteLn(myFile,'<PointData Tensors="Vector" >');
 if Displacements <> nil then
 begin
 WriteLn(myFile,'<DataArray type="Float64" Name="displacement" NumberOfComponents="3" format="ascii" >');
    for i := low(Displacements) to high(Displacements) do
    WriteLn(myFile,floattostr(Displacements[i,0])+' '+floattostr(Displacements[i,1])+' '+floattostr(Displacements[i,2]));
 WriteLn(myFile,'</DataArray>');
 end;

 if Stresses <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="Stress" NumberOfComponents="6" format="ascii" >');
        for i := low(Stresses) to high(Stresses) do
        WriteLn(myFile,floattostr(Stresses[i,0])+' '+floattostr(Stresses[i,1])+' '+floattostr(Stresses[i,2])+' '+floattostr(Stresses[i,3])+' '+floattostr(Stresses[i,4])+' '+floattostr(Stresses[i,5]));
        WriteLn(myFile,'</DataArray>');
   end;
   if TotalStrains <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="TotalStrain" NumberOfComponents="6" format="ascii" >');
        for i := low(TotalStrains) to high(TotalStrains) do
        WriteLn(myFile,floattostr(TotalStrains[i,0])+' '+floattostr(TotalStrains[i,1])+' '+floattostr(TotalStrains[i,2])+' '+floattostr(TotalStrains[i,3])+' '+floattostr(TotalStrains[i,4])+' '+floattostr(TotalStrains[i,5]));
        WriteLn(myFile,'</DataArray>');
   end;
   if PlasticStrains <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="PlasticStrain" NumberOfComponents="6" format="ascii" >');
        for i := low(PlasticStrains) to high(PlasticStrains) do
        WriteLn(myFile,floattostr(PlasticStrains[i,0])+' '+floattostr(PlasticStrains[i,1])+' '+floattostr(PlasticStrains[i,2])+' '+floattostr(PlasticStrains[i,3])+' '+floattostr(PlasticStrains[i,4])+' '+floattostr(PlasticStrains[i,5]));
        WriteLn(myFile,'</DataArray>');
   end;
   if AccumulatedStrains <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="AccumulatedStrain" NumberOfComponents="1" format="ascii" >');
        for i := low(AccumulatedStrains) to high(AccumulatedStrains) do
        WriteLn(myFile,floattostrf(AccumulatedStrains[i,0],ffExponent, 8, 2));
        WriteLn(myFile,'</DataArray>');
   end;
  WriteLn(myFile,'</PointData>');
 end;

 WriteLn(myFile,'<Cells>');
 WriteLn(myFile,'<DataArray type="UInt32" Name="connectivity" NumberOfComponents="1" format="ascii" >');
 for i := 0 to High(Elements) do
 begin
    for j := 0 to NodesInElement[i] do
    begin
    if j>0 then
    begin
        str := str + inttostr(Elements[i,j]-1)+' '
    end;
    end;
    WriteLn(myFile,str);
    str := '';
 end;
  WriteLn(myFile,'</DataArray>');

  WriteLn(myFile,'<DataArray type="UInt32" Name="offsets" NumberOfComponents="1" format="ascii" >');

 for i := 0 to High(Elements) do
 begin
     num := num + NodesInElement[i];
     WriteLn(myFile,inttostr(num));
 end;
  WriteLn(myFile,'</DataArray>');
  z_coord := sum_array_col(Nodes,3);
  WriteLn(myFile,'<DataArray type="UInt8" Name="types" NumberOfComponents="1" format="ascii" >');
  for i := 0 to High(Elements) do
  begin
  node_in_el := NodesInElement[i];
    if node_in_el = 8 then
        if z_coord<>0 then
        WriteLn(myFile,'12')
        else
        WriteLn(myFile,'23');
    if (node_in_el=4)  then
        if z_coord <> 0 then
        WriteLn(myFile,'10')
        else
        WriteLn(myFile,'9');
    if node_in_el=6 then
        if z_coord <> 0 then
        WriteLn(myFile,'13')
        else
        WriteLn(myFile,'22');
    if node_in_el=3 then
    WriteLn(myFile,'5');
    if node_in_el=10 then
    WriteLn(myFile,'24');
    if node_in_el=15 then
    WriteLn(myFile,'13');
    if node_in_el=20 then
    WriteLn(myFile,'25');
  end;
  WriteLn(myFile,'</DataArray>');

 WriteLn(myFile,'</Cells>');

 WriteLn(myFile,'<Points>');
WriteLn(myFile,'<DataArray type="Float64" Name="coordinates" NumberOfComponents="3" format="ascii" >');
 for i := low(Nodes) to high(Nodes) do
 WriteLn(myFile,floattostr(Nodes[i,1])+' '+floattostr(Nodes[i,2])+' '+floattostr(Nodes[i,3]));
  WriteLn(myFile,'</DataArray>');
 WriteLn(myFile,'</Points>');

 WriteLn(myFile,'</Piece>');
 WriteLn(myFile,'</UnstructuredGrid>');
 WriteLn(myFile,'</VTKFile>');
 CloseFile(myFile);
  end;
procedure createXML2(const filename: string;
                    const Nodes : TRealRealArray;
                    const Elements: TIntegerIntegerArray;
                    const NodesInElement : TIntegerArray;
                    const Stresses : TRealRealArray;
                    const Displacements : TRealRealArray;
                    const TotalStrains : TRealRealArray;
                    const PlasticStrains : TRealRealArray;
                    const AccumulatedStrains : TRealRealArray);
var
i,j,num,node_in_el,br, num_di : integer;
str : string;
s1,s2,s3 : real;
myFile : TextFile;
z_coord : real;
begin
 num := 0;
 str := '';

  AssignFile(myFile, filename + '.vtu');
  ReWrite(myFile);

 WriteLn(myFile,'<?xml version="1.0"?>');
 WriteLn(myFile,'<VTKFile type="UnstructuredGrid" version="0.1" byte_order="LittleEndian" >');
 WriteLn(myFile,'<UnstructuredGrid>');
 WriteLn(myFile,'<Piece NumberOfPoints="'+ inttostr(length(Nodes)) +'" NumberOfCells="'+ inttostr(length(Elements)) +'" >');
 //if length(MainForm.stress11_2)= length(MainForm.x_coord_2) then
 //begin
 if Displacements <> nil then
 begin
 WriteLn(myFile,'<PointData Tensors="Vector" >');
 WriteLn(myFile,'<DataArray type="Float64" Name="displacement" NumberOfComponents="3" format="ascii" >');
    for i := low(Displacements) to high(Displacements) do
    WriteLn(myFile,floattostr(Displacements[i,0])+' '+floattostr(Displacements[i,1])+' '+floattostr(Displacements[i,2]));
 WriteLn(myFile,'</DataArray>');
 WriteLn(myFile,'</PointData>');
 end;

 if (Stresses <> nil) or (PlasticStrains <> nil) or (TotalStrains <> nil) or (AccumulatedStrains <> nil) then
 begin
 WriteLn(myFile,'<CellData Tensors="stress" >');
   if Stresses <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="Stress" NumberOfComponents="6" format="ascii" >');
        for i := low(Stresses) to high(Stresses) do
        WriteLn(myFile,floattostr(Stresses[i,0])+' '+floattostr(Stresses[i,1])+' '+floattostr(Stresses[i,2])+' '+floattostr(Stresses[i,3])+' '+floattostr(Stresses[i,4])+' '+floattostr(Stresses[i,5]));
        WriteLn(myFile,'</DataArray>');
   end;
   if TotalStrains <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="TotalStrain" NumberOfComponents="6" format="ascii" >');
        for i := low(TotalStrains) to high(TotalStrains) do
        WriteLn(myFile,floattostr(TotalStrains[i,0])+' '+floattostr(TotalStrains[i,1])+' '+floattostr(TotalStrains[i,2])+' '+floattostr(TotalStrains[i,3])+' '+floattostr(TotalStrains[i,4])+' '+floattostr(TotalStrains[i,5]));
        WriteLn(myFile,'</DataArray>');
   end;
   if PlasticStrains <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="PlasticStrain" NumberOfComponents="6" format="ascii" >');
        for i := low(PlasticStrains) to high(PlasticStrains) do
        WriteLn(myFile,floattostr(PlasticStrains[i,0])+' '+floattostr(PlasticStrains[i,1])+' '+floattostr(PlasticStrains[i,2])+' '+floattostr(PlasticStrains[i,3])+' '+floattostr(PlasticStrains[i,4])+' '+floattostr(PlasticStrains[i,5]));
        WriteLn(myFile,'</DataArray>');
   end;
   if AccumulatedStrains <> nil then
   begin
        WriteLn(myFile,'<DataArray type="Float64" Name="AccumulatedStrain" NumberOfComponents="1" format="ascii" >');
        for i := low(AccumulatedStrains) to high(AccumulatedStrains) do
        WriteLn(myFile,floattostrf(AccumulatedStrains[i,0],ffExponent, 8, 2));
        WriteLn(myFile,'</DataArray>');
   end;
 WriteLn(myFile,'</CellData>');
 end;
 //end;
 WriteLn(myFile,'<Cells>');
 WriteLn(myFile,'<DataArray type="UInt32" Name="connectivity" NumberOfComponents="1" format="ascii" >');
 for i := 0 to High(Elements) do
 begin
    for j := 0 to NodesInElement[i] do
    begin
    if j>0 then
    begin
        str := str + inttostr(Elements[i,j]-1)+' '
    end;
    end;
    WriteLn(myFile,str);
    str := '';
 end;
  WriteLn(myFile,'</DataArray>');
  z_coord := sum_array_col(Nodes,3);
  WriteLn(myFile,'<DataArray type="UInt32" Name="offsets" NumberOfComponents="1" format="ascii" >');

 for i := 0 to High(Elements) do
 begin
     num := num + NodesInElement[i];
     WriteLn(myFile,inttostr(num));
 end;
  WriteLn(myFile,'</DataArray>');

  WriteLn(myFile,'<DataArray type="UInt8" Name="types" NumberOfComponents="1" format="ascii" >');
  for i := 0 to High(Elements) do
  begin
  node_in_el := NodesInElement[i];
    if node_in_el = 8 then
        if z_coord<>0 then
        WriteLn(myFile,'12')
        else
        WriteLn(myFile,'23');
    if (node_in_el=4)  then
        if z_coord <> 0 then
        WriteLn(myFile,'10')
        else
        WriteLn(myFile,'9');
    if node_in_el=6 then
        if z_coord <> 0 then
        WriteLn(myFile,'13')
        else
        WriteLn(myFile,'22');
    if node_in_el=3 then
    WriteLn(myFile,'5');
    if node_in_el=10 then
    WriteLn(myFile,'24');
    if node_in_el=15 then
    WriteLn(myFile,'13');
    if node_in_el=20 then
    WriteLn(myFile,'25');
  end;
  WriteLn(myFile,'</DataArray>');

 WriteLn(myFile,'</Cells>');

 WriteLn(myFile,'<Points>');
WriteLn(myFile,'<DataArray type="Float64" Name="coordinates" NumberOfComponents="3" format="ascii" >');
 for i := low(Nodes) to high(Nodes) do
 WriteLn(myFile,floattostr(Nodes[i,1])+' '+floattostr(Nodes[i,2])+' '+floattostr(Nodes[i,3]));
  WriteLn(myFile,'</DataArray>');
 WriteLn(myFile,'</Points>');

 WriteLn(myFile,'</Piece>');
 WriteLn(myFile,'</UnstructuredGrid>');
 WriteLn(myFile,'</VTKFile>');
 CloseFile(myFile);
  end;

end.
