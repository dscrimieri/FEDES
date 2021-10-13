program Unit1;

{$mode objfpc}{$H+}

uses 
{cthreads,} Classes, SysUtils, Dialogs, type_of_model, data, Menus, DOM, interpolations, Grid;

var 
  model1input: string;
  model1output: string;
  model2input: string;
  xml1output: string;
  xml2output: string;
  model: integer;
  indexnodes, indexelems: boolean;
  XMLDocument1: TXMLDocument;

  { First model }
  Elements1 : TIntegerIntegerArray;
  Nodes1 : TRealRealArray;
  Elements1Idx: GridIndex;
  Nodes1Idx: GridIndex;
  Displacements1 : TRealRealArray;
  Stress1 : TRealRealArray;
  TotalStrain1: TRealRealArray;
  PlasticStrain1 : TRealRealArray;
  AccumulatedStrain1 : TRealRealArray;
  { Second model }
  Elements2 : TIntegerIntegerArray;
  Nodes2 : TRealRealArray;
  Displacements2 : TRealRealArray;
  Stress2 : TRealRealArray;
  TotalStrain2: TRealRealArray;
  PlasticStrain2 : TRealRealArray;
  AccumulatedStrain2 : TRealRealArray;

  Nodes2Integration : TRealRealArray;
  NodesInElement1 : TIntegerArray;
  NodesInElement2 : TIntegerArray;

  TS1, TS2: TTimeStamp;

{$I libfedes.inc}

procedure calculateNPM;
begin
  NPMP(1,
       1,
       1,
       1,
       1,
       nodes1,
       nodes2,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             false,
       Displacements2,      true,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);

{
  convert_coordinates(Nodes2Integration,
                      Nodes2,
                      Elements2);

  NPMP(1,
       1,
       1,
       1,
       1,
       Nodes1,
       Nodes2Integration,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
}
end;

procedure calculateNPMG;
begin
  NPMPG(1,
       1,
       1,
       1,
       1,
       Nodes1Idx,
       Nodes1,
       Nodes2,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             false,
       Displacements2,      true,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);

  convert_coordinates(Nodes2Integration,
                      Nodes2,
                      Elements2);

  NPMPG(1,
       1,
       1,
       1,
       1,
       Nodes1Idx,
       Nodes1,
       Nodes2Integration,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
end;

procedure calculateDMUFP;
begin
  DMUFPP(1,
         1,
         1,
         1,
         1,
         nodes1,
         nodes2,
         Stress1,
         Displacements1,
         TotalStrain1,
         PlasticStrain1,
         AccumulatedStrain1,
         Stress2,             false,
         Displacements2,      true,
         TotalStrain2 ,       false,
         PlasticStrain2 ,     false,
         AccumulatedStrain2,  false);

{
  convert_coordinates(Nodes2Integration,
                      Nodes2,
                      Elements2);

  DMUFPP(1,
       1,
       1,
       1,
       1,
       Nodes1,
       Nodes2Integration,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
}
end;

procedure calculateDMUFPG;
begin
  DMUFPPG(1,
         1,
         1,
         1,
         1,
         Nodes1Idx,
         nodes1,
         nodes2,
         Stress1,
         Displacements1,
         TotalStrain1,
         PlasticStrain1,
         AccumulatedStrain1,
         Stress2,             false,
         Displacements2,      true,
         TotalStrain2 ,       false,
         PlasticStrain2 ,     false,
         AccumulatedStrain2,  false);

{
  convert_coordinates(Nodes2Integration,
                      Nodes2,
                      Elements2);

  DMUFPPG(1,
       1,
       1,
       1,
       1,
       Nodes1Idx,
       Nodes1,
       Nodes2Integration,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
}
end;

procedure calculateMUESF;
begin
  obtain_nodes_in_element(Elements1,NodesInElement1);
  MUESFP(1,
         1,
         1,
         1,
         1,
         nodes1,
         nodes2,
         Elements1,
         NodesInElement1,
         Stress1,
         Displacements1,
         TotalStrain1,
         PlasticStrain1,
         AccumulatedStrain1,
         Stress2,             false,
         Displacements2,      true,
         TotalStrain2 ,       false,
         PlasticStrain2 ,     false,
         AccumulatedStrain2,  false);

{
  convert_coordinates(Nodes2Integration,
                      Nodes2,
                      Elements2);

  MUESFP(1,
       1,
       1,
       1,
       1,
       Nodes1,
       Nodes2Integration,
       Elements1,
       NodesInElement1,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
}
end;

procedure calculateMUESFG;
begin
  obtain_nodes_in_element(Elements1,NodesInElement1);
  MUESFPG(1,
	 1,
	 1,
	 1,
	 1,
	 nodes1,
	 nodes2,
	 Elements1,
	 Elements1Idx,
	 NodesInElement1,
	 Stress1,
	 Displacements1,
	 TotalStrain1,
	 PlasticStrain1,
	 AccumulatedStrain1,
	 Stress2,             false,
	 Displacements2,      true,
	 TotalStrain2 ,       false,
	 PlasticStrain2 ,     false,
	 AccumulatedStrain2,  false);

{
  convert_coordinates(Nodes2Integration,
		      Nodes2,
		      Elements2);

  MUESFPG(1,
       1,
       1,
       1,
       1,
       Nodes1,
       Nodes2Integration,
       Elements1,
       Elements1Idx,
       NodesInElement1,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
}
end;

procedure calculateDMUE;
begin
  obtain_nodes_in_element(Elements1,NodesInElement1);
  DMUEP(1,
	 1,
	 1,
	 1,
	 1,
	 nodes1,
	 nodes2,
	 Elements1,
	 NodesInElement1,
	 Stress1,
	 Displacements1,
	 TotalStrain1,
	 PlasticStrain1,
	 AccumulatedStrain1,
	 Stress2,             false,
	 Displacements2,      true,
	 TotalStrain2 ,       false,
	 PlasticStrain2 ,     false,
	 AccumulatedStrain2,  false);

{
  convert_coordinates(Nodes2Integration,
		      Nodes2,
		      Elements2);

  DMUEP(1,
       1,
       1,
       1,
       1,
       Nodes1,
       Nodes2Integration,
       Elements1,
       NodesInElement1,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
}
end;

procedure calculateDMUEG;
begin
  obtain_nodes_in_element(Elements1,NodesInElement1);
  DMUEPG(1,
	 1,
	 1,
	 1,
	 1,
	 nodes1,
	 nodes2,
	 Elements1,
         Elements1Idx,
	 NodesInElement1,
	 Stress1,
	 Displacements1,
	 TotalStrain1,
	 PlasticStrain1,
	 AccumulatedStrain1,
	 Stress2,             false,
	 Displacements2,      true,
	 TotalStrain2 ,       false,
	 PlasticStrain2 ,     false,
	 AccumulatedStrain2,  false);

{
  convert_coordinates(Nodes2Integration,
		      Nodes2,
		      Elements2);

  DMUEPG(1,
       1,
       1,
       1,
       1,
       Nodes1,
       Nodes2Integration,
       Elements1,
       Elements1Idx,
       NodesInElement1,
       Stress1,
       Displacements1,
       TotalStrain1,
       PlasticStrain1,
       AccumulatedStrain1,
       Stress2,             true,
       Displacements2,      false,
       TotalStrain2 ,       false,
       PlasticStrain2 ,     false,
       AccumulatedStrain2,  false);
}
end;

procedure analyse(Nodes: TRealRealArray);
var
  maxX, minX, maxY, minY, maxZ, minZ: real;
  rangeX, rangeY, rangeZ: real;
  i: integer;
begin
  WriteLn(high(Nodes), ' nodes');
  maxX := Nodes[0,1];
  minX := Nodes[0,1];
  maxY := Nodes[0,2];
  minY := Nodes[0,2];
  maxZ := Nodes[0,3];
  minZ := Nodes[0,3];
  for i := 0 to high(Nodes) do
    begin
      if Nodes[i,1] > maxX then
	maxX := Nodes[i,1]
      else if Nodes[i,1] < minX then
	minX := Nodes[i,1];

      if Nodes[i,2] > maxY then
	maxY := Nodes[i,2]
      else if Nodes[i,2] < minY then
	minY := Nodes[i,2];

      if Nodes[i,3] > maxZ then
	maxZ := Nodes[i,3]
      else if Nodes[i,3] < minZ then
	minZ := Nodes[i,3];
    end;
  rangeX := maxX - minX;
  rangeY := maxY - minY;
  rangeZ := maxZ - minZ;
  WriteLn('max x = ', maxX, ', min x = ', minX, ', max y = ', maxY, ', min y = ', minY, ', max z = ', maxZ, ', min z = ', minZ);
  WriteLn('range x = ', rangeX, ', range y = ', rangeY, ', range z = ', rangeZ);
end;

procedure read;
begin
  writeln('* Reading 1...');
  if (model = 1) then
    ansys_input_read_lis(model1input, Nodes1, Elements1)
  else if (model = 2) then
    abaqus_input_read(model1input, Nodes1, Elements1)
  //marc_input_output_read(model1input, Nodes1, Elements1, Displacements1);
  else if (model = 3) then
    morpheo_input_output_read(XMLDocument1,
                                 model1input,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 TotalStrain1,
                                 AccumulatedStrain1);

  if indexnodes then
    begin
      writeln('* Creating index on nodes...');
      Writeln('* Start: ', DateTimeToStr(Now));
      TS1:=DateTimeToTimeStamp(Now);
      CreateNodeGridIndex(Nodes1, Nodes1Idx);
      TS2:=DateTimeToTimeStamp(Now);
      Writeln('* End: ', DateTimeToStr(Now));
      Writeln('* MSecs: ', TS2.Time - TS1.Time);
    end;

  if indexelems then
    begin
      obtain_nodes_in_element(Elements1,NodesInElement1);
      writeln('* Creating index on elements...');
      Writeln('* Start: ', DateTimeToStr(Now));
      TS1:=DateTimeToTimeStamp(Now);
      CreateElementGridIndex(Elements1, Nodes1, NodesInElement1, Elements1Idx);
      TS2:=DateTimeToTimeStamp(Now);
      Writeln('* End: ', DateTimeToStr(Now));
      Writeln('* MSecs: ', TS2.Time - TS1.Time);
    end;

  writeln('* Reading 2...');
  if (model = 1) then
    ansys_output_read(model1output, Length(nodes1), Displacements1, TotalStrain1, Stress1)
  else if (model = 2) then
    abaqus_output_read(model1output, Length(nodes1), Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1);
  //marc_stress_output_read(model1output, Stress1);
  
  writeln('* Reading 3...');
  abaqus_input_read(model2input, Nodes2, Elements2);

  analyse(nodes1);
  analyse(nodes2);
end;

procedure save(outfile: string);
begin
  obtain_nodes_in_element(Elements1,NodesInElement1);
  createXML1(xml1output,
             Nodes1,
             Elements1,
             NodesInElement1,
             Stress1,
             Displacements1,
             TotalStrain1,
             PlasticStrain1,
             AccumulatedStrain1);
  obtain_nodes_in_element(Elements2,NodesInElement2);
  createXML2(outfile,
             Nodes2,
             Elements2,
             NodesInElement2,
             Stress2,
             Displacements2,
             TotalStrain2,
             PlasticStrain2,
             AccumulatedStrain2);
end;

procedure calculate;
var
  outfile: string;

begin
{
  writeln('* Calculating NPM...');  
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);
  calculateNPM;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.npm';
  save(outfile);
}

{
  writeln('* Calculating NPMG...');
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);
  calculateNPMG;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.npmg';
  save(outfile);
}

{
  writeln('* Calculating DMUFP...');  
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);  
  calculateDMUFP;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.dmufp';
  save(outfile);
}

  writeln('* Calculating DMUFPG...');
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);  
  calculateDMUFPG;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.dmufpg';
  save(outfile);

{
  writeln('* Calculating MUESF...');  
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);
  calculateMUESF;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.muesf';
  save(outfile);
}

{
  writeln('* Calculating MUESFG...');  
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);
  calculateMUESFG;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.muesfg';
  save(outfile);
}

{
  writeln('* Calculating DMUE...');  
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);
  calculateDMUE;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.dmue';
  save(outfile);
}

{
  writeln('* Calculating DMUEG...');  
  Writeln('* Start: ', DateTimeToStr(Now));
  TS1:=DateTimeToTimeStamp(Now);
  calculateDMUEG;
  TS2:=DateTimeToTimeStamp(Now);
  Writeln('* End: ', DateTimeToStr(Now));
  Writeln('* MSecs: ', TS2.Time - TS1.Time);
  outfile := xml2output + '.dmueg';
  save(outfile);
}
end;

begin
  model := 1;
  indexnodes := true;
  indexelems := false;

  if (model = 1) then
    begin
      model1input := '../Examples-FEDES/Example1-Vane-big/Model1_Input-Ansys.txt';
      model1output := '../Examples-FEDES/Example1-Vane-big/Model1_output-Ansys.txt';
      model2input := '../Examples-FEDES/Example1-Vane-big/Model2-Input-Abaqus.inp';
    end
  else if (model = 2) then
    begin
      model1input := '../Examples-FEDES/Example-3D-medium/model1-input-Abaqus.inp';
      model1output := '../Examples-FEDES/Example-3D-medium/model1-output-Abaqus.dat';
      model2input := '../Examples-FEDES/Example-3D-medium/Model-input-Abaqus.inp';
    end
  else if (model = 3) then
    begin
      model1input := '../Examples-FEDES/Example1-ManufacturingProcessChain-2ndLoop/Process1-HeatTreatment-XML-format.vtu';
      model2input := '../Examples-FEDES/Example1-ManufacturingProcessChain-2ndLoop/Process2-ShotPeening-Abaqus.inp';
    end;

  //model1input := '../Examples-FEDES/Example-3D-beam-small/Model1-Input-Marc.t19';  
  //model1output :=  '../Examples-FEDES/Example-3D-beam-small/Model1-output-Marc.70';
  //model2input := '../Examples-FEDES/Example-3D-beam-small/Model2-Input-Abaqus.inp';

  //model1input := '/home/daniele/shukri/FEDES/Geometry-3/model-1.inp';  
  //model1output := '/home/daniele/shukri/FEDES/Geometry-3/model-1.dat';
  //model2input := '/home/daniele/shukri/FEDES/Geometry-3/Model.inp';

  //model1input := '/home/daniele/shukri/FEDES/Geometry-1/wedge1.inp';
  //model1output := '/home/daniele/shukri/FEDES/Geometry-1/wedge1.dat';
  //model2input := '/home/daniele/shukri/FEDES/Geometry-1/wedge2.inp';

  //model1input := '/home/daniele/fedes/Examples-FEDES/Example2/piston-hex.inp';
  //model1output := '/home/daniele/fedes/Examples-FEDES/Example2/piston-hex.dat';
  //model2input := '/home/daniele/fedes/Examples-FEDES/Example2/piston-tet.inp';

  xml1output := '../model1';
  xml2output := '../model2';

  writeln('* Reading...');
  read;

{
  writeln('* Num of threads: ', 1);
  writeln(stderr, '* Num of threads: ', 1);
  SetNumOfThreads(1);
  calculate;
  writeln('* Num of threads: ', 2);
  writeln(stderr, '* Num of threads: ', 2);
  SetNumOfThreads(2);
  calculate;
  writeln('* Num of threads: ', 4);
  writeln(stderr, '* Num of threads: ', 4);
  SetNumOfThreads(4);
  calculate;
}
  writeln('* Num of threads: ', 8);
  writeln(stderr, '* Num of threads: ', 8);
  SetNumOfThreads(8);
  calculate;
end.
