unit interpolations;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface
uses SysUtils,math,type_of_model,data,grid,dialogs,MTProcs;

procedure SetNumOfThreads(NumOfThreads: integer);

procedure MUESFP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

procedure MUESFPG(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const Elements1Idx: GridIndex;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

procedure NPMP(const ScaleFactorStress: real;
               const ScaleFactorDisplacements: real;
               const ScaleFactorTotalStrain: real;
               const ScaleFactorPlasticStrain: real;
               const ScaleFactorAccumulatedStrain: real;
               const nodes1: TRealRealArray;
               const nodes2: TRealRealArray;
               const Stress1: TRealRealArray;
               const Displacements1: TRealRealArray;
               const TotalStrain1: TRealRealArray;
               const PlasticStrain1: TRealRealArray;
               const AccumulatedStrain1: TRealRealArray;
               var Stress2: TRealRealArray;            const StressMapping: boolean;
               var Displacements2: TRealRealArray;     const DisplacementMapping: boolean;
               var TotalStrain2: TRealRealArray;       const TotalStrainMapping: boolean;
               var PlasticStrain2: TRealRealArray;     const PlasticStrainMapping: boolean;
               var AccumulatedStrain2: TRealRealArray; const AccumulatedStrainMapping: boolean);

procedure NPMPG(const ScaleFactorStress: real;
               const ScaleFactorDisplacements: real;
               const ScaleFactorTotalStrain: real;
               const ScaleFactorPlasticStrain: real;
               const ScaleFactorAccumulatedStrain: real;
               const Nodes1Idx: GridIndex;
               const Nodes1: TRealRealArray;
               const Nodes2: TRealRealArray;
               const Stress1: TRealRealArray;
               const Displacements1: TRealRealArray;
               const TotalStrain1: TRealRealArray;
               const PlasticStrain1: TRealRealArray;
               const AccumulatedStrain1: TRealRealArray;
               var Stress2: TRealRealArray;            const StressMapping: boolean;
               var Displacements2: TRealRealArray;     const DisplacementMapping: boolean;
               var TotalStrain2: TRealRealArray;       const TotalStrainMapping: boolean;
               var PlasticStrain2: TRealRealArray;     const PlasticStrainMapping: boolean;
               var AccumulatedStrain2: TRealRealArray; const AccumulatedStrainMapping: boolean);

procedure DMUFPP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

procedure DMUFPPG(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const Nodes1Idx: GridIndex;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

procedure  DMUEP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

procedure  DMUEPG(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const Elements1Idx: GridIndex;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

 procedure DMUFP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

 procedure NPM(  const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

 procedure DMUE (const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);
 
procedure MUESF(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

 //========================= ABAQUS Explicit ==================================================
 procedure convert_coordinates(var nodes2 : TRealRealArray;
                              const nodes1 : TRealRealArray;
                              const elements1: TIntegerIntegerArray);
 procedure obtain_nodes_in_element(const Elements : TIntegerIntegerArray; var NodesInElement : TIntegerArray);
 //procedure convert_stresses(var s2_11,s2_22,s2_33,s2_12,s2_23,s2_13:TRealArray; const s1_11,s1_22,s1_33,s1_12,s1_23,s1_13: array of real;const elements1: TIntegerIntegerArray);

implementation

procedure SetNumOfThreads(NumOfThreads: integer);
begin
  ProcThreadPool.MaxThreadCount := NumOfThreads;
end;

procedure MUESFCopyResults(
  const ScaleFactorStress: real;
  const ScaleFactorDisplacements: real;
  const ScaleFactorTotalStrain: real;
  const ScaleFactorPlasticStrain: real;
  const ScaleFactorAccumulatedStrain: real;
  const nodes1:TRealRealArray;
  const nodes2:TRealRealArray;
  const Elements1: TIntegerIntegerArray;
  const NodesInElement: array of integer;
  const Stress1: TRealRealArray;
  const Displacements1: TRealRealArray;
  const TotalStrain1: TRealRealArray;
  const PlasticStrain1: TRealRealArray;
  const AccumulatedStrain1: TRealRealArray;
  var Stress2: TRealRealArray;
  const StressMapping: boolean;
  var Displacements2: TRealRealArray;
  const DisplacementMapping: boolean;
  var TotalStrain2: TRealRealArray;
  const TotalStrainMapping: boolean;
  var PlasticStrain2: TRealRealArray;
  const PlasticStrainMapping: boolean;
  var AccumulatedStrain2: TRealRealArray;
  const AccumulatedStrainMapping: boolean;
  sum_z_coord: real;
  main_element_number: integer;
  k: integer;
  g, h, r: real);

var
  StressValue, TotalStrainValue, PlasticStrainValue: array[0..5] of real;
  DisplacementsValue: array[0..2] of real;
  AccumulatedStrainValue: real;
  a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, ghr: real;
  v: integer;

begin
  //------------------------------ Linear triangular elements -----------------------------------------------
  if (sum_z_coord=0) and (NodesInElement[main_element_number] = 3)then
    begin
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := (1-g-h)*Stress1[elements1[main_element_number,1]-1,v] + g*
                                Stress1[
                                elements1[main_element_number,2]-1,v] + h*Stress1[elements1[
                                main_element_number,3]-1,v];
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := (1-g-h)*TotalStrain1[elements1[main_element_number,1]-1,v]
                                     + g*
                                     TotalStrain1[elements1[main_element_number-1,2],v] + h*
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v];
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := (1-g-h)*PlasticStrain1[elements1[main_element_number,1]-1
                                       ,v] + g*
                                       PlasticStrain1[elements1[main_element_number,2]-1,v] + h*
                                       PlasticStrain1[elements1[main_element_number,3]-1,v];
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := (1-g-h)*Displacements1[elements1[main_element_number,1]-1,v
                                     ] + g*
                                     Displacements1[elements1[main_element_number,2]-1,v] + h*
                                     Displacements1[elements1[main_element_number,3]-1,v];
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := (1-g-h)*AccumulatedStrain1[elements1[main_element_number,1]-
                                    1,0] + g
                                    *AccumulatedStrain1[elements1[main_element_number,2]-1,0] +
                                    h*
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,0];
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end
    //------------------------------ Quadratic triangular elements -----------------------------------------------
  else if (sum_z_coord=0) and (NodesInElement[main_element_number] = 6)then
    begin
      a1 := 2*(0.5-g-h)*(1-g-h);
      a2 := 2*g*(g-0.5);
      a3 := 2*h*(h-0.5);
      a4 := 4*g*(1-g-h);
      a5 := 4*g*h;
      a6 := 4*h*(1-g-h);
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := a1*Stress1[elements1[main_element_number,1]-1,v] + a2*
                                Stress1[
                                elements1[
                                main_element_number,2]-1,v] + a3*Stress1[elements1[
                                main_element_number,3]-
                                1,v] + a4*Stress1[elements1[main_element_number,4]-1,v] +
                                a5*
                                Stress1[
                                elements1[main_element_number,5]-1,v]+ a6*Stress1[elements1
                                [
                                main_element_number,6]-1,v];
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := a1*TotalStrain1[elements1[main_element_number,1]-1,v]
                                     + a2*
                                     TotalStrain1[elements1[main_element_number-1,2],v] +
                                     a3*
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v]+ a4*TotalStrain1
                                     [
                                     elements1[
                                     main_element_number,4]-1,v]+ a5*TotalStrain1[elements1
                                     [
                                     main_element_number,5]-1,v]+ a6*TotalStrain1[elements1
                                     [
                                     main_element_number,6]-1,v];
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := a1*PlasticStrain1[elements1[main_element_number,1]-1
                                       ,v] +
                                       a2*
                                       PlasticStrain1[elements1[main_element_number,2]-1,v]
                                       + a3
                                       *
                                       PlasticStrain1[elements1[main_element_number,3]-1,v]
                                       + a4*
                                       PlasticStrain1[elements1[main_element_number,4]-1,v]
                                       + a5*
                                       PlasticStrain1[elements1[main_element_number,5]-1,v]
                                       + a6*
                                       PlasticStrain1[elements1[main_element_number,6]-1,v]
              ;
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := a1*Displacements1[elements1[main_element_number,1]-1,v
                                     ] +
                                     a2*
                                     Displacements1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     Displacements1[elements1[main_element_number,3]-1,v]+
                                     a4*
                                     Displacements1[elements1[main_element_number,4]-1,v]+
                                     a5*
                                     Displacements1[elements1[main_element_number,5]-1,v]+
                                     a6*
                                     Displacements1[elements1[main_element_number,6]-1,v];
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := a1*AccumulatedStrain1[elements1[main_element_number,1]-
                                    1,0]
                                    + a2*
                                    AccumulatedStrain1[elements1[main_element_number,2]-1,0
                                    ] +
                                    a3*
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,0
                                    ]+ a4
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,4]-1,0
                                    ]+ a5
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,5]-1,0
                                    ]+ a6
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,6]-1,0
                                    ];
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end
  //------------------------------ Linear quadrileteral elements --------------------------------------
  else if (sum_z_coord=0) and (NodesInElement[main_element_number] = 4)then
    begin
      a1 := (1-g)*(1-h);
      a2 := (1+g)*(1-h);
      a3 := (1+g)*(1+h);
      a4 := (1-g)*(1+h);
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := (a1*Stress1[elements1[main_element_number,1]-1,v] + a2*
                                Stress1[
                                elements1[
                                main_element_number,2]-1,v] + a3*Stress1[elements1[
                                main_element_number,3]-
                                1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v])/4;
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := (a1*TotalStrain1[elements1[main_element_number,1]-1,v]
                                     + a2
                                     *
                                     TotalStrain1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v]+ a4*TotalStrain1
                                     [
                                     elements1[
                                     main_element_number,4]-1,v])/4;
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := (a1*PlasticStrain1[elements1[main_element_number,1]-
                                       1,v]
                                       + a2*
                                       PlasticStrain1[elements1[main_element_number,2]-1,v]
                                       + a3
                                       *
                                       PlasticStrain1[elements1[main_element_number,3]-1,v]
                                       + a4*
                                       PlasticStrain1[elements1[main_element_number,4]-1,v]
                                       )/4;
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := (a1*Displacements1[elements1[main_element_number,1]-1,
                                     v] +
                                     a2*
                                     Displacements1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     Displacements1[elements1[main_element_number,3]-1,v]+
                                     a4*
                                     Displacements1[elements1[main_element_number,4]-1,v])/
                                     4;
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := (a1*AccumulatedStrain1[elements1[main_element_number,1]
                                    -1,0]
                                    + a2*
                                    AccumulatedStrain1[elements1[main_element_number,2]-1,0
                                    ] +
                                    a3*
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,0
                                    ]+ a4
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,4]-1,0
                                    ])/4;
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end
  //------------------------------ Quadratic quadrileteral elements --------------------------------------
  else if (sum_z_coord=0) and (NodesInElement[main_element_number] = 8)then
    begin
      a1 := (1-g)*(1-h)*(1+g+h);
      a2 := (1+g)*(1-h)*(1-g+h);
      a3 := (1+g)*(1+h)*(1-g-h);
      a4 := (1-g)*(1+h)*(1+g-h);
      a5 := (1-g)*(1+g)*(1-h);
      a6 := (1-h)*(1+h)*(1+g);
      a7 := (1-g)*(1+g)*(1+h);
      a8 := (1-h)*(1+h)*(1-g);
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := -0.25*(a1*Stress1[elements1[main_element_number,1]-1,v] +
                                a2*
                                Stress1[
                                elements1[main_element_number,2]-1,v] + a3*Stress1[
                                elements1[
                                main_element_number,3]-1,v]+ a4*Stress1[elements1[
                                main_element_number,4]-1
                                ,v]) + 0.5*(a5*Stress1[elements1[main_element_number,5]-1,v
                                ] +
                                a6*Stress1[
                                elements1[main_element_number,6]-1,v] + a7*Stress1[
                                elements1[
                                main_element_number,7]-1,v]+ a8*Stress1[elements1[
                                main_element_number,8]-1
                                ,v]);
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := -0.25*(a1*TotalStrain1[elements1[main_element_number,1
                                     ]-1,v
                                     ] + a2*
                                     TotalStrain1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v]+ a4*TotalStrain1
                                     [
                                     elements1[
                                     main_element_number,4]-1,v]) + 0.5*(a5*TotalStrain1[
                                     elements1[
                                     main_element_number,5]-1,v] + a6*TotalStrain1[
                                     elements1[
                                     main_element_number,6]-1,v] + a7*TotalStrain1[
                                     elements1[
                                     main_element_number,7]-1,v]+ a8*TotalStrain1[elements1
                                     [
                                     main_element_number,8]-1,v]);
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := -0.25*(a1*PlasticStrain1[elements1[
                                       main_element_number,1]
                                       -1,v] + a2
                                       *PlasticStrain1[elements1[main_element_number,2]-1,v
                                       ] +
                                       a3*
                                       PlasticStrain1[elements1[main_element_number,3]-1,v]
                                       + a4*
                                       PlasticStrain1[elements1[main_element_number,4]-1,v]
                                       )+ 0.5*(a5*
                                       PlasticStrain1[elements1[main_element_number,5]-1,v]
                                       + a6
                                       *
                                       PlasticStrain1[elements1[main_element_number,6]-1,v]
                                       + a7
                                       *
                                       PlasticStrain1[elements1[main_element_number,7]-1,v]
                                       + a8*
                                       PlasticStrain1[elements1[main_element_number,8]-1,v]
                                       );
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := -0.25*(a1*Displacements1[elements1[main_element_number
                                     ,1]-1
                                     ,v] + a2*
                                     Displacements1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     Displacements1[elements1[main_element_number,3]-1,v]+
                                     a4*
                                     Displacements1[elements1[main_element_number,4]-1,v])+
                                     0.5*
                                     (a5*
                                     Displacements1[elements1[main_element_number,5]-1,v] +
                                     a6*
                                     Displacements1[elements1[main_element_number,6]-1,v] +
                                     a7*
                                     Displacements1[elements1[main_element_number,7]-1,v]+
                                     a8*
                                     Displacements1[elements1[main_element_number,8]-1,v]);
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := -0.25*(a1*AccumulatedStrain1[elements1[
                                    main_element_number,1
                                    ]-1,0] +
                                    a2*AccumulatedStrain1[elements1[main_element_number,2]-
                                    1,0]
                                    + a3*
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,0
                                    ]+ a4
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,4]-1,0
                                    ])+ 0.5*(a5*
                                    AccumulatedStrain1[elements1[main_element_number,5]-1,0
                                    ] +
                                    a6*
                                    AccumulatedStrain1[elements1[main_element_number,6]-1,0
                                    ] +
                                    a7*
                                    AccumulatedStrain1[elements1[main_element_number,7]-1,0
                                    ]+ a8
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,8]-1,0
                                    ]);
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end
  //------------------------------ Tet linear elements --------------------------
  else if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 4)then
    begin
      ghr := (1-g-h-r);
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := ghr*Stress1[elements1[main_element_number,1]-1,v] + g*
                                stress1[
                                elements1[
                                main_element_number,2]-1,v] + h*stress1[elements1[
                                main_element_number,3]-1
                                ,v] + r*stress1[elements1[main_element_number,4]-1,v];
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := ghr*TotalStrain1[elements1[main_element_number,1]-1,v]
                                     + g*
                                     TotalStrain1[elements1[main_element_number,2]-1,v] + h
                                     *
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v] + r*TotalStrain1
                                     [
                                     elements1[
                                     main_element_number,4]-1,v];
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := ghr*PlasticStrain1[elements1[main_element_number,1]-
                                       1,v]
                                       + g*
                                       PlasticStrain1[elements1[main_element_number,2]-1,v]
                                       + h*
                                       PlasticStrain1[elements1[main_element_number-1,3],v]
                                       + r*
                                       PlasticStrain1[elements1[main_element_number,4]-1,v]
              ;
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := ghr*Displacements1[elements1[main_element_number,1]-1,
                                     v] +
                                     g*
                                     Displacements1[elements1[main_element_number,2]-1,v] +
                                     h*
                                     Displacements1[elements1[main_element_number,3]-1,v] +
                                     r*
                                     Displacements1[elements1[main_element_number,4]-1,v];
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := ghr*AccumulatedStrain1[elements1[main_element_number,1]
                                    -1,0]
                                    + g*
                                    AccumulatedStrain1[elements1[main_element_number,2]-1,0
                                    ] + h
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,0
                                    ] + r
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,4]-1,0
                                    ];
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end
  //------------------------------ Tet quadratic elements --------------------------
  else if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 10)then
      begin
        ghr := 1-g-h-r;
        a1 := (2*ghr-1)*ghr;
        a2 := (2*g-1)*g;
        a3 := (2*h-1)*h;
        a4 := (2*r-1)*r;
        a5 := 4*ghr*g;
        a6 := 4*g*h;
        a7 := 4*ghr*h;
        a8 := 4*ghr*r;
        a9 := 4*g*r;
        a10 := 4*h*r;
        for v := 0 to 5 do
          begin
            if StressMapping then
              begin
                StressValue[v] := a1*Stress1[elements1[main_element_number,1]-1,v] + a2*
                                  stress1[
                                  elements1[
                                  main_element_number,2]-1,v] + a3*stress1[elements1[
                                  main_element_number,3]-
                                  1,v] + a4*stress1[elements1[main_element_number,4]-1,v] +
                                  a5*
                                  stress1[
                                  elements1[main_element_number,5]-1,v] + a6*stress1[
                                  elements1[
                                  main_element_number,6]-1,v]+ a7*stress1[elements1[
                                  main_element_number,7]-1
                                  ,v]+ a8*stress1[elements1[main_element_number,8]-1,v]+ a9*
                                  stress1[
                                  elements1[main_element_number,9]-1,v]+ a10*stress1[
                                  elements1[
                                  main_element_number,10]-1,v];
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
              end;
            if TotalStrainMapping then
              begin
                TotalStrainValue[v] := a1*TotalStrain1[elements1[main_element_number,1]-1,v]
                                       + a2*
                                       TotalStrain1[elements1[main_element_number,2]-1,v] +
                                       a3*
                                       TotalStrain1[
                                       elements1[main_element_number,3]-1,v] + a4*
                                       TotalStrain1[
                                       elements1[
                                       main_element_number,4]-1,v]+ a5*TotalStrain1[elements1
                                       [
                                       main_element_number,5]-1,v]+ a6*TotalStrain1[elements1
                                       [
                                       main_element_number,6]-1,v]+ a7*TotalStrain1[elements1
                                       [
                                       main_element_number,7]-1,v]+ a8*TotalStrain1[elements1
                                       [
                                       main_element_number,8]-1,v]+ a9*TotalStrain1[elements1
                                       [
                                       main_element_number,9]-1,v]+ a10*TotalStrain1[
                                       elements1[
                                       main_element_number,10]-1,v];
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
              end;
            if PlasticStrainMapping then
              begin
                PlasticStrainValue[v] := a1*PlasticStrain1[elements1[main_element_number,1]-1
                                         ,v] +
                                         a2*
                                         PlasticStrain1[elements1[main_element_number,2]-1,v]
                                         + a3
                                         *
                                         PlasticStrain1[elements1[main_element_number-1,3],v]
                                         + a4
                                         *
                                         PlasticStrain1[elements1[main_element_number,4]-1,v]
                                         + a5*
                                         PlasticStrain1[elements1[main_element_number,5]-1,v]
                                         + a6*
                                         PlasticStrain1[elements1[main_element_number,6]-1,v]
                                         + a7*
                                         PlasticStrain1[elements1[main_element_number,7]-1,v]
                                         + a8*
                                         PlasticStrain1[elements1[main_element_number,8]-1,v]
                                         + a9*
                                         PlasticStrain1[elements1[main_element_number,9]-1,v]
                                         + a10
                                         *
                                         PlasticStrain1[elements1[main_element_number,10]-1,v
                                         ];
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
              end;
          end;
        if DisplacementMapping then
          for v := 0 to 2 do
            begin
              DisplacementsValue[v] := a1*Displacements1[elements1[main_element_number,1]-1,v
                                       ] +
                                       a2*
                                       Displacements1[elements1[main_element_number,2]-1,v] +
                                       a3*
                                       Displacements1[elements1[main_element_number,3]-1,v] +
                                       a4*
                                       Displacements1[elements1[main_element_number,4]-1,v] +
                                       a5*
                                       Displacements1[elements1[main_element_number,5]-1,v]+
                                       a6*
                                       Displacements1[elements1[main_element_number,6]-1,v] +
                                       a7*
                                       Displacements1[elements1[main_element_number,7]-1,v]+
                                       a8*
                                       Displacements1[elements1[main_element_number,8]-1,v] +
                                       a9*
                                       Displacements1[elements1[main_element_number,9]-1,v] +
                                       a10*
                                       Displacements1[elements1[main_element_number,10]-1,v];
              Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
            end;
        if AccumulatedStrainMapping then
          begin
            AccumulatedStrainValue := a1*AccumulatedStrain1[elements1[main_element_number,1]-
                                      1,0]
                                      + a2*
                                      AccumulatedStrain1[elements1[main_element_number,2]-1,0
                                      ] +
                                      a3*
                                      AccumulatedStrain1[elements1[main_element_number,3]-1,0
                                      ] +
                                      a4*
                                      AccumulatedStrain1[elements1[main_element_number,4]-1,0
                                      ]+ a5
                                      *
                                      AccumulatedStrain1[elements1[main_element_number,5]-1,0
                                      ] +
                                      a6*
                                      AccumulatedStrain1[elements1[main_element_number,6]-1,0
                                      ]+ a7
                                      *
                                      AccumulatedStrain1[elements1[main_element_number,7]-1,0
                                      ]+ a8
                                      *
                                      AccumulatedStrain1[elements1[main_element_number,8]-1,0
                                      ]+ a9
                                      *
                                      AccumulatedStrain1[elements1[main_element_number,9]-1,0
                                      ]+
                                      a10*
                                      AccumulatedStrain1[elements1[main_element_number,10]-1,
                                      0];
            AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
          end;
      end
  //------------------------------ Wedge linear and quadratic elements --------------------------
  else if (sum_z_coord<>0) and ((NodesInElement[main_element_number] = 6) or (NodesInElement[
           main_element_number] = 15)) then
    begin
      a1 := (1-g-h)*(1-r);
      a2 := g*(1-r);
      a3 := h*(1-r);
      a4 := (1-g-h)*(1+r);
      a5 := g*(1+r);
      a6 := h*(1+r);
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := (a1*Stress1[elements1[main_element_number,1]-1,v] + a2*
                                Stress1[
                                elements1[
                                main_element_number,2]-1,v] + a3*Stress1[elements1[
                                main_element_number,3]-
                                1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v]+ a5*
                                Stress1[
                                elements1[main_element_number,5]-1,v]+ a6*Stress1[elements1
                                [
                                main_element_number,6]-1,v])/2;
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := (a1*TotalStrain1[elements1[main_element_number,1]-1,v]
                                     + a2
                                     *
                                     TotalStrain1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v]+ a4*TotalStrain1
                                     [
                                     elements1[
                                     main_element_number,4]-1,v]+ a5*TotalStrain1[elements1
                                     [
                                     main_element_number,5]-1,v]+ a6*TotalStrain1[elements1
                                     [
                                     main_element_number,6]-1,v])/2;
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := (a1*PlasticStrain1[elements1[main_element_number,1]-
                                       1,v]
                                       + a2*
                                       PlasticStrain1[elements1[main_element_number,2]-1,v]
                                       + a3
                                       *
                                       PlasticStrain1[elements1[main_element_number,3]-1,v]
                                       + a4*
                                       PlasticStrain1[elements1[main_element_number,4]-1,v]
                                       + a5*
                                       PlasticStrain1[elements1[main_element_number,5]-1,v]
                                       + a6*
                                       PlasticStrain1[elements1[main_element_number,6]-1,v]
                                       )/2;
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := (a1*Displacements1[elements1[main_element_number,1]-1,
                                     v] +
                                     a2*
                                     Displacements1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     Displacements1[elements1[main_element_number,3]-1,v]+
                                     a4*
                                     Displacements1[elements1[main_element_number,4]-1,v]+
                                     a5*
                                     Displacements1[elements1[main_element_number,5]-1,v]+
                                     a6*
                                     Displacements1[elements1[main_element_number,6]-1,v])/
                                     2;
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := (a1*AccumulatedStrain1[elements1[main_element_number,1]
                                    -1,0]
                                    + a2*
                                    AccumulatedStrain1[elements1[main_element_number,2]-1,0
                                    ] +
                                    a3*
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,0
                                    ]+ a4
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,4]-1,0
                                    ]+ a5
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,5]-1,0
                                    ]+ a6
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,6]-1,0
                                    ])/2;
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end
    //------------------------------ Hex linear elements --------------------------
  else if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 8)then
    begin
      a1 := (1-g)*(1-h)*(1-r);
      a2 := (1+g)*(1-h)*(1-r);
      a3 := (1+g)*(1+h)*(1-r);
      a4 := (1-g)*(1+h)*(1-r);
      a5 := (1-g)*(1-h)*(1+r);
      a6 := (1+g)*(1-h)*(1+r);
      a7 := (1+g)*(1+h)*(1+r);
      a8 := (1-g)*(1+h)*(1+r);
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := (a1*Stress1[elements1[main_element_number,1]-1,v] + a2*
                                Stress1[
                                elements1[
                                main_element_number,2]-1,v] + a3*Stress1[elements1[
                                main_element_number,3]-
                                1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v]+ a5*
                                Stress1[
                                elements1[main_element_number,5]-1,v]+ a6*Stress1[elements1
                                [
                                main_element_number,6]-1,v]+ a7*Stress1[elements1[
                                main_element_number,7]-1
                                ,v]+ a8*Stress1[elements1[main_element_number,8]-1,v])/8;
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := (a1*TotalStrain1[elements1[main_element_number,1]-1,v]
                                     + a2
                                     *
                                     TotalStrain1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v]+ a4*TotalStrain1
                                     [
                                     elements1[
                                     main_element_number,4]-1,v]+ a5*TotalStrain1[elements1
                                     [
                                     main_element_number,5]-1,v]+ a6*TotalStrain1[elements1
                                     [
                                     main_element_number,6]-1,v]+ a7*TotalStrain1[elements1
                                     [
                                     main_element_number,7]-1,v]+ a8*TotalStrain1[elements1
                                     [
                                     main_element_number,8]-1,v])/8;
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := (a1*PlasticStrain1[elements1[main_element_number,1]-
                                       1,v]
                                       + a2*
                                       PlasticStrain1[elements1[main_element_number,2]-1,v]
                                       + a3
                                       *
                                       PlasticStrain1[elements1[main_element_number,3]-1,v]
                                       + a4*
                                       PlasticStrain1[elements1[main_element_number,4]-1,v]
                                       + a5*
                                       PlasticStrain1[elements1[main_element_number,5]-1,v]
                                       + a6*
                                       PlasticStrain1[elements1[main_element_number,6]-1,v]
                                       + a7*
                                       PlasticStrain1[elements1[main_element_number,7]-1,v]
                                       + a8*
                                       PlasticStrain1[elements1[main_element_number,8]-1,v]
                                       )/8;
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := (a1*Displacements1[elements1[main_element_number,1]-1,
                                     v] +
                                     a2*
                                     Displacements1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     Displacements1[elements1[main_element_number,3]-1,v]+
                                     a4*
                                     Displacements1[elements1[main_element_number,4]-1,v]+
                                     a5*
                                     Displacements1[elements1[main_element_number,5]-1,v]+
                                     a6*
                                     Displacements1[elements1[main_element_number,6]-1,v]+
                                     a7*
                                     Displacements1[elements1[main_element_number,7]-1,v]+
                                     a8*
                                     Displacements1[elements1[main_element_number,8]-1,v])/
                                     8;
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := (a1*AccumulatedStrain1[elements1[main_element_number,1]
                                    -1,0]
                                    + a2*
                                    AccumulatedStrain1[elements1[main_element_number,2]-1,0
                                    ] +
                                    a3*
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,0
                                    ]+ a4
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,4]-1,0
                                    ]+ a5
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,5]-1,0
                                    ]+ a6
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,6]-1,0
                                    ]+ a7
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,7]-1,0
                                    ]+ a8
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,8]-1,0
                                    ])/8;
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end
  //------------------------------ Hex quadratic elements --------------------------
  else if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 20)then
    begin
      a1 := (1-g)*(1-h)*(1-r)*(2+g+h+r);
      a2 := (1+g)*(1-h)*(1-r)*(2-g+h+r);
      a3 := (1+g)*(1+h)*(1-r)*(2-g-h+r);
      a4 := (1-g)*(1+h)*(1-r)*(2+g-h+r);
      a5 := (1-g)*(1-h)*(1+r)*(2+g+h-r);
      a6 := (1+g)*(1-h)*(1+r)*(2-g+h-r);
      a7 := (1+g)*(1+h)*(1+r)*(2-g-h-r);
      a8 := (1-g)*(1+h)*(1+r)*(2+g-h-r);
      a9 := (1-g)*(1+g)*(1-h)*(1-r);
      a10 := (1-h)*(1+h)*(1+g)*(1-r);
      a11 := (1-g)*(1+g)*(1+h)*(1-r);
      a12 := (1-h)*(1+h)*(1-g)*(1-r);
      a13 := (1-g)*(1+g)*(1-h)*(1+r);
      a14 := (1-h)*(1+h)*(1+g)*(1+r);
      a15 := (1-g)*(1+g)*(1+h)*(1+r);
      a16 := (1-h)*(1+h)*(1-g)*(1+r);
      a17 := (1-r)*(1+r)*(1-g)*(1-h);
      a18 := (1-r)*(1+r)*(1+g)*(1-h);
      a19 := (1-r)*(1+r)*(1+g)*(1+h);
      a20 := (1-r)*(1+r)*(1-g)*(1+h);
      for v := 0 to 5 do
        begin
          if StressMapping then
            begin
              StressValue[v] := -(a1*Stress1[elements1[main_element_number,1]-1,v] + a2*
                                Stress1[
                                elements1[
                                main_element_number,2]-1,v] + a3*Stress1[elements1[
                                main_element_number,3]-
                                1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v] + a5
                                *
                                Stress1[
                                elements1[main_element_number,5]-1,v] + a6*Stress1[
                                elements1[
                                main_element_number,6]-1,v] + a7*Stress1[elements1[
                                main_element_number,7]-
                                1,v] + a8*Stress1[elements1[main_element_number,8]-1,v])/8
                                +
                                (a9*Stress1[elements1[main_element_number,9]-1,v] + a10*
                                Stress1[
                                elements1[
                                main_element_number,10]-1,v] + a11*Stress1[elements1[
                                main_element_number,
                                11]-1,v] + a12*Stress1[elements1[main_element_number,12]-1,
                                v] +
                                a13*
                                Stress1[elements1[main_element_number,13]-1,v] + a14*
                                Stress1[
                                elements1[
                                main_element_number,14]-1,v] + a15*Stress1[elements1[
                                main_element_number,
                                15]-1,v] + a16*Stress1[elements1[main_element_number,16]-1,
                                v] +
                                a17*
                                Stress1[elements1[main_element_number,17]-1,v] + a18*
                                Stress1[
                                elements1[
                                main_element_number,18]-1,v] + a19*Stress1[elements1[
                                main_element_number,
                                19]-1,v] + a20*Stress1[elements1[main_element_number,20]-1,
                                v])/4
              ;
              Stress2[k,v] := StressValue[v]*ScaleFactorStress;
            end;
          if TotalStrainMapping then
            begin
              TotalStrainValue[v] := -(a1*TotalStrain1[elements1[main_element_number,1]-1,v
                                     ] +
                                     a2*
                                     TotalStrain1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     TotalStrain1[
                                     elements1[main_element_number,3]-1,v]+ a4*TotalStrain1
                                     [
                                     elements1[
                                     main_element_number,4]-1,v] + a5*TotalStrain1[
                                     elements1[
                                     main_element_number,5]-1,v] + a6*TotalStrain1[
                                     elements1[
                                     main_element_number,6]-1,v] + a7*TotalStrain1[
                                     elements1[
                                     main_element_number,7]-1,v] + a8*TotalStrain1[
                                     elements1[
                                     main_element_number,8]-1,v])/8 +
                                     (a9*TotalStrain1[elements1[main_element_number,9]-1,v]
                                     +
                                     a10*
                                     TotalStrain1[elements1[main_element_number,10]-1,v] +
                                     a11*
                                     TotalStrain1[elements1[main_element_number,11]-1,v] +
                                     a12*
                                     TotalStrain1[elements1[main_element_number,12]-1,v] +
                                     a13*
                                     TotalStrain1[elements1[main_element_number,13]-1,v] +
                                     a14*
                                     TotalStrain1[elements1[main_element_number,14]-1,v] +
                                     a15*
                                     TotalStrain1[elements1[main_element_number,15]-1,v] +
                                     a16*
                                     TotalStrain1[elements1[main_element_number,16]-1,v] +
                                     a17*
                                     TotalStrain1[elements1[main_element_number,17]-1,v] +
                                     a18*
                                     TotalStrain1[elements1[main_element_number,18]-1,v] +
                                     a19*
                                     TotalStrain1[elements1[main_element_number,19]-1,v] +
                                     a20*
                                     TotalStrain1[elements1[main_element_number,20]-1,v])/4
              ;
              TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
            end;
          if PlasticStrainMapping then
            begin
              PlasticStrainValue[v] := -(a1*PlasticStrain1[elements1[main_element_number,1]
                                       -1,v]
                                       + a2*
                                       PlasticStrain1[elements1[main_element_number,2]-1,v]
                                       + a3
                                       *
                                       PlasticStrain1[elements1[main_element_number,3]-1,v]
                                       + a4*
                                       PlasticStrain1[elements1[main_element_number,4]-1,v]
                                       + a5
                                       *
                                       PlasticStrain1[elements1[main_element_number,5]-1,v]
                                       + a6
                                       *
                                       PlasticStrain1[elements1[main_element_number,6]-1,v]
                                       + a7
                                       *
                                       PlasticStrain1[elements1[main_element_number,7]-1,v]
                                       + a8
                                       *
                                       PlasticStrain1[elements1[main_element_number,8]-1,v]
                                       )/8 +
                                       (a9*PlasticStrain1[elements1[main_element_number,9]-
                                       1,v]
                                       + a10*
                                       PlasticStrain1[elements1[main_element_number,10]-1,v
                                       ] +
                                       a11*
                                       PlasticStrain1[elements1[main_element_number,11]-1,v
                                       ] +
                                       a12*
                                       PlasticStrain1[elements1[main_element_number,12]-1,v
                                       ] +
                                       a13*
                                       PlasticStrain1[elements1[main_element_number,13]-1,v
                                       ] +
                                       a14*
                                       PlasticStrain1[elements1[main_element_number,14]-1,v
                                       ] +
                                       a15*
                                       TotalStrain1[elements1[main_element_number,15]-1,v]
                                       + a16
                                       *
                                       PlasticStrain1[elements1[main_element_number,16]-1,v
                                       ] +
                                       a17*
                                       PlasticStrain1[elements1[main_element_number,17]-1,v
                                       ] +
                                       a18*
                                       PlasticStrain1[elements1[main_element_number,18]-1,v
                                       ] +
                                       a19*
                                       PlasticStrain1[elements1[main_element_number,19]-1,v
                                       ] +
                                       a20*
                                       PlasticStrain1[elements1[main_element_number,20]-1,v
                                       ])/4;
              PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
            end;
        end;
      if DisplacementMapping then
        for v := 0 to 2 do
          begin
            DisplacementsValue[v] := -(a1*Displacements1[elements1[main_element_number,1]-1
                                     ,v] +
                                     a2*
                                     Displacements1[elements1[main_element_number,2]-1,v] +
                                     a3*
                                     Displacements1[elements1[main_element_number,3]-1,v]+
                                     a4*
                                     Displacements1[elements1[main_element_number,4]-1,v] +
                                     a5*
                                     Displacements1[elements1[main_element_number,5]-1,v] +
                                     a6*
                                     Displacements1[elements1[main_element_number,6]-1,v] +
                                     a7*
                                     Displacements1[elements1[main_element_number,7]-1,v] +
                                     a8*
                                     Displacements1[elements1[main_element_number,8]-1,v])/
                                     8 +
                                     (a9*Displacements1[elements1[main_element_number,9]-1,
                                     v] +
                                     a10*
                                     Displacements1[elements1[main_element_number,10]-1,v]
                                     + a11
                                     *
                                     Displacements1[elements1[main_element_number,11]-1,v]
                                     + a12
                                     *
                                     Displacements1[elements1[main_element_number,12]-1,v]
                                     + a13
                                     *
                                     Displacements1[elements1[main_element_number,13]-1,v]
                                     + a14
                                     *
                                     Displacements1[elements1[main_element_number,14]-1,v]
                                     + a15
                                     *
                                     Displacements1[elements1[main_element_number,15]-1,v]
                                     + a16
                                     *
                                     Displacements1[elements1[main_element_number,16]-1,v]
                                     + a17
                                     *
                                     Displacements1[elements1[main_element_number,17]-1,v]
                                     + a18
                                     *
                                     Displacements1[elements1[main_element_number,18]-1,v]
                                     + a19
                                     *
                                     Displacements1[elements1[main_element_number,19]-1,v]
                                     + a20
                                     *
                                     Displacements1[elements1[main_element_number,20]-1,v])
                                     /4;
            Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping then
        begin
          AccumulatedStrainValue := -(a1*AccumulatedStrain1[elements1[main_element_number,1
                                    ]-1,v
                                    ] + a2*
                                    AccumulatedStrain1[elements1[main_element_number,2]-1,v
                                    ] +
                                    a3*
                                    AccumulatedStrain1[elements1[main_element_number,3]-1,v
                                    ]+ a4
                                    *
                                    AccumulatedStrain1[elements1[main_element_number,4]-1,v
                                    ] +
                                    a5*
                                    AccumulatedStrain1[elements1[main_element_number,5]-1,v
                                    ] +
                                    a6*
                                    AccumulatedStrain1[elements1[main_element_number,6]-1,v
                                    ] +
                                    a7*
                                    AccumulatedStrain1[elements1[main_element_number,7]-1,v
                                    ] +
                                    a8*
                                    AccumulatedStrain1[elements1[main_element_number,8]-1,v
                                    ])/8
                                    +
                                    (a9*AccumulatedStrain1[elements1[main_element_number,9]
                                    -1,v]
                                    + a10*
                                    AccumulatedStrain1[elements1[main_element_number,10]-1,
                                    v] +
                                    a11*
                                    AccumulatedStrain1[elements1[main_element_number,11]-1,
                                    v] +
                                    a12*
                                    AccumulatedStrain1[elements1[main_element_number,12]-1,
                                    v] +
                                    a13*
                                    AccumulatedStrain1[elements1[main_element_number,13]-1,
                                    v] +
                                    a14*
                                    AccumulatedStrain1[elements1[main_element_number,14]-1,
                                    v] +
                                    a15*
                                    AccumulatedStrain1[elements1[main_element_number,15]-1,
                                    v] +
                                    a16*
                                    AccumulatedStrain1[elements1[main_element_number,16]-1,
                                    v] +
                                    a17*
                                    AccumulatedStrain1[elements1[main_element_number,17]-1,
                                    v] +
                                    a18*
                                    AccumulatedStrain1[elements1[main_element_number,18]-1,
                                    v] +
                                    a19*
                                    AccumulatedStrain1[elements1[main_element_number,19]-1,
                                    v] +
                                    a20*
                                    AccumulatedStrain1[elements1[main_element_number,20]-1,
                                    v])/4
          ;
          AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
    end;
end;

procedure MUESFCheckContainment(
  K: Node;
  I: Element;
  sum_z_coord: real;
  const NodesInElement: array of integer;
  const Nodes1: TRealRealArray;
  const Nodes2: TRealRealArray;
  const elements1: TIntegerIntegerArray;
  h1, h2, g1, g2, gg2, g3, g4, gg4, hh2, h3, h4, hh4, r3, r4, rr4, r5, g5, gg5, h5, hh5, rr5, g_h_r1, g_h_r3: real;
  var g, h, r: real;
  var condition: boolean;
  var main_element_number: integer);

var
  xn,yn,zn,det : real;
  cx,cy,cz : array [0..3] of real;
  cx1,cx2,cx3,cx4,cx5,cx6,cx7,cx8 : real;
  cy1,cy2,cy3,cy4,cy5,cy6,cy7,cy8 : real;
  cz1,cz2,cz3,cz4,cz5,cz6,cz7,cz8 : real;
  f1,f2,f3 : real;
  f1g,f1h,f1r,f2g,f2h,f2r,f3g,f3h,f3r: real;
  cx1cx0, cy2cy0 , cz3cz0 ,cy3cy0,cz2cz0 ,cy1cy0 ,cx2cx0 ,cx3cx0 ,cz1cz0 ,xncx0 ,yncy0 , zncz0: real;
  
begin
  //--------------------- Triangular linear and quadratic element -------------------------
  if (sum_z_coord=0) and ((NodesInElement[i] = 3)or(NodesInElement[i] = 6)) then
    begin
      cx[0] := Nodes1[elements1[i,1]-1,1];
      cx[1] := Nodes1[elements1[i,2]-1,1];
      cx[2] := Nodes1[elements1[i,3]-1,1];
      cy[0] := Nodes1[elements1[i,1]-1,2];
      cy[1] := Nodes1[elements1[i,2]-1,2];
      cy[2] := Nodes1[elements1[i,3]-1,2];
      xn := Nodes2[k,1];
      yn := Nodes2[k,2];
      det := ((cx[1]-cx[0])*(cy[2]-cy[0])-(cx[2]-cx[0])*(cy[1]-cy[0]));
      g := ((xn-cx[0])*(cy[2]-cy[0])-(cx[2]-cx[0])*(yn-cy[0]))/det;
      h := ((cx[1]-cx[0])*(yn-cy[0])-(xn-cx[0])*(cy[1]-cy[0]))/det;
      if (g>g1)and(h>h1)and(g+h<g_h_r1) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Quadrileteral linear and quadratic element -------------------------
  else if (sum_z_coord=0) and ((NodesInElement[i] = 4)or(NodesInElement[i] = 8)) then
    begin
      cx1 := Nodes1[elements1[i,1]-1,1];
      cx2 := Nodes1[elements1[i,2]-1,1];
      cx3 := Nodes1[elements1[i,3]-1,1];
      cx4 := Nodes1[elements1[i,4]-1,1];
      cy1 := Nodes1[elements1[i,1]-1,2];
      cy2 := Nodes1[elements1[i,2]-1,2];
      cy3 := Nodes1[elements1[i,3]-1,2];
      cy4 := Nodes1[elements1[i,4]-1,2];
      f1 := - cx1 - cx2 - cx3 - cx4 + 4*Nodes2[k,1];
      f2 := - cy1 - cy2 - cy3 - cy4 + 4*Nodes2[k,2];
      f1g := -cx1 + cx2 + cx3 - cx4;
      f1h := -cx1 - cx2 + cx3 + cx4;
      f2g := -cy1 + cy2 + cy3 - cy4;
      f2h := -cy1 - cy2 + cy3 + cy4;
      Det := f1g*f2h-f1h*f2g;
      g := (f1*f2h-f1h*f2)/Det;
      h := (f1g*f2-f1*f2g)/Det;
      if (g>g2)and(g<gg2)and(h>h2)and(h<hh2)then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Tet linear and quadratic element -------------------------
  else if (sum_z_coord<>0) and ((NodesInElement[i] = 4)or(NodesInElement[i] = 10)) then
    begin
      cx[0] := Nodes1[elements1[i,1]-1,1];
      cx[1] := Nodes1[elements1[i,2]-1,1];
      cx[2] := Nodes1[elements1[i,3]-1,1];
      cx[3] := Nodes1[elements1[i,4]-1,1];
      cy[0] := Nodes1[elements1[i,1]-1,2];
      cy[1] := Nodes1[elements1[i,2]-1,2];
      cy[2] := Nodes1[elements1[i,3]-1,2];
      cy[3] := Nodes1[elements1[i,4]-1,2];
      cz[0] := Nodes1[elements1[i,1]-1,3];
      cz[1] := Nodes1[elements1[i,2]-1,3];
      cz[2] := Nodes1[elements1[i,3]-1,3];
      cz[3] := Nodes1[elements1[i,4]-1,3];
      xn := Nodes2[k,1];
      yn := Nodes2[k,2];
      zn := Nodes2[k,3];
      cx1cx0 :=  cx[1]-cx[0];
      cy2cy0 :=  cy[2]-cy[0];
      cz3cz0 :=  cz[3]-cz[0];
      cy3cy0 :=  cy[3]-cy[0];
      cz2cz0 :=  cz[2]-cz[0];
      cy1cy0 := cy[1]-cy[0];
      cx2cx0 := cx[2]-cx[0];
      cx3cx0 := cx[3]-cx[0];
      cz1cz0 := cz[1]-cz[0];
      xncx0  := xn-cx[0];
      yncy0  := yn-cy[0];
      zncz0  := zn-cz[0];
      det := cx1cx0*cy2cy0*cz3cz0 - cx1cx0*cy3cy0*cz2cz0 - cy1cy0*cx2cx0*cz3cz0 +
             cy1cy0*
             cx3cx0*
             cz2cz0 + cz1cz0*cx2cx0*cy3cy0 - cz1cz0*cx3cx0*cy2cy0;
      g := (xncx0*cy2cy0*cz3cz0 - xncx0*cy3cy0*cz2cz0 - yncy0*cx2cx0*cz3cz0 + yncy0*
           cx3cx0
           *cz2cz0
           + zncz0*cx2cx0*cy3cy0 - zncz0*cx3cx0*cy2cy0)/det;
      h := (cx1cx0*yncy0*cz3cz0 - cx1cx0*cy3cy0*zncz0 - cy1cy0*xncx0*cz3cz0 + cy1cy0*
           cx3cx0*zncz0
           + cz1cz0*xncx0*cy3cy0 - cz1cz0*cx3cx0*yncy0)/det;
      r := (cx1cx0*cy2cy0*zncz0 - cx1cx0*yncy0*cz2cz0 - cy1cy0*cx2cx0*zncz0 + cy1cy0*
           xncx0
           *cz2cz0
           + cz1cz0*cx2cx0*yncy0 - cz1cz0*xncx0*cy2cy0)/det;
      if (g>g3)and(h>h3)and(r>r3)and(g+h+r<g_h_r3) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Wedge linear and quadratic element -------------------------
  else if (sum_z_coord<>0) and ((NodesInElement[i] = 6)or(NodesInElement[i] = 15)) then
    begin
      cx1 := Nodes1[elements1[i,1]-1,1];
      cx2 := Nodes1[elements1[i,2]-1,1];
      cx3 := Nodes1[elements1[i,3]-1,1];
      cx4 := Nodes1[elements1[i,4]-1,1];
      cx5 := Nodes1[elements1[i,5]-1,1];
      cx6 := Nodes1[elements1[i,6]-1,1];
      cy1 := Nodes1[elements1[i,1]-1,2];
      cy2 := Nodes1[elements1[i,2]-1,2];
      cy3 := Nodes1[elements1[i,3]-1,2];
      cy4 := Nodes1[elements1[i,4]-1,2];
      cy5 := Nodes1[elements1[i,5]-1,2];
      cy6 := Nodes1[elements1[i,6]-1,2];
      cz1 := Nodes1[elements1[i,1]-1,3];
      cz2 := Nodes1[elements1[i,2]-1,3];
      cz3 := Nodes1[elements1[i,3]-1,3];
      cz4 := Nodes1[elements1[i,4]-1,3];
      cz5 := Nodes1[elements1[i,5]-1,3];
      cz6 := Nodes1[elements1[i,6]-1,3];
      f1 := -(0.25*(cx2 + cx3) +  0.75*(cx5 + cx6) - 2*Nodes2[k,1]);
      f2 := -(0.25*(cy2 + cy3) +  0.75*(cy5 + cy6) - 2*Nodes2[k,2]);
      f3 := -(0.25*(cz2 + cz3) +  0.75*(cz5 + cz6) - 2*Nodes2[k,3]);
      f1g := -cx1 + cx2 - cx4 + cx5;
      f1h := -cx1 + cx3 - cx4 + cx6;
      f1r :=  0.5*(- cx2 - cx3 + cx5 + cx6);
      f2g := -cy1 + cy2 - cy4 + cy5;
      f2h := -cy1 + cy3 - cy4 + cy6;
      f2r := 0.5*(-cy2 - cy3 + cy5 + cy6);
      f3g := -cz1 + cz2 - cz4 + cz5;
      f3h := -cz1 + cz3 - cz4 + cz6;
      f3r := 0.5*(-cz2 - cz3 +  cz5 + cz6);
      det := f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h;
      g :=  (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det;
      h :=  (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det;
      r :=  (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det;
      if (g>g4)and(g<gg4)and(h>h4)and(h<hh4)and(r>r4)and(r<rr4) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Wedge linear and quadratic element -------------------------
  else if (sum_z_coord<>0) and ((NodesInElement[i] = 8)or(NodesInElement[i] = 20)) then
    begin
      cx1 := Nodes1[elements1[i,1]-1,1];
      cx2 := Nodes1[elements1[i,2]-1,1];
      cx3 := Nodes1[elements1[i,3]-1,1];
      cx4 := Nodes1[elements1[i,4]-1,1];
      cx5 := Nodes1[elements1[i,5]-1,1];
      cx6 := Nodes1[elements1[i,6]-1,1];
      cx7 := Nodes1[elements1[i,7]-1,1];
      cx8 := Nodes1[elements1[i,8]-1,1];
      cy1 := Nodes1[elements1[i,1]-1,2];
      cy2 := Nodes1[elements1[i,2]-1,2];
      cy3 := Nodes1[elements1[i,3]-1,2];
      cy4 := Nodes1[elements1[i,4]-1,2];
      cy5 := Nodes1[elements1[i,5]-1,2];
      cy6 := Nodes1[elements1[i,6]-1,2];
      cy7 := Nodes1[elements1[i,7]-1,2];
      cy8 := Nodes1[elements1[i,8]-1,2];
      cz1 := Nodes1[elements1[i,1]-1,3];
      cz2 := Nodes1[elements1[i,2]-1,3];
      cz3 := Nodes1[elements1[i,3]-1,3];
      cz4 := Nodes1[elements1[i,4]-1,3];
      cz5 := Nodes1[elements1[i,5]-1,3];
      cz6 := Nodes1[elements1[i,6]-1,3];
      cz7 := Nodes1[elements1[i,7]-1,3];
      cz8 := Nodes1[elements1[i,8]-1,3];
      f1 := -cx1 - cx2 - cx3- cx4- cx5-cx6 - cx7- cx8 + 8*Nodes2[k,1];
      f2 := -cy1 - cy2 - cy3- cy4- cy5- cy6- cy7- cy8 + 8*Nodes2[k,2];
      f3 := -cz1 - cz2 - cz3- cz4- cz5- cz6- cz7- cz8 + 8*Nodes2[k,3];
      f1g := -cx1 + cx2 + cx3 - cx4 - cx5 + cx6 + cx7 - cx8;
      f1h := -cx1 - cx2 + cx3 + cx4 - cx5 - cx6 + cx7 + cx8;
      f1r := -cx1 - cx2 - cx3 - cx4 + cx5 + cx6 + cx7 + cx8;
      f2g := -cy1 + cy2 + cy3 - cy4 - cy5 + cy6 + cy7 - cy8;
      f2h := -cy1 - cy2 + cy3 + cy4 - cy5 - cy6 + cy7 + cy8;
      f2r := -cy1 - cy2 - cy3 - cy4 + cy5 + cy6 + cy7 + cy8;
      f3g := -cz1 + cz2 + cz3 - cz4 - cz5 + cz6 + cz7 - cz8;
      f3h := -cz1 - cz2 + cz3 + cz4 - cz5 - cz6 + cz7 + cz8;
      f3r := -cz1 - cz2 - cz3 - cz4 + cz5 + cz6 + cz7 + cz8;
      det := f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h;
      g :=  (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det;
      h :=  (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det;
      r := (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det;
      if (g>g5)and(g<gg5)and(h>h5)and(h<hh5)and(r>r5)and(r<rr5) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end;
end;

procedure MUESFPG(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const Elements1Idx: GridIndex;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

var 
  sum_z_coord : real;
  BlockSize: PtrInt;
  offsets, reclevels: array of integer;
  l: integer;

procedure MUESFPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);
var 
  k: integer;
  main_element_number : integer;  
  g1,g2,g3,g4,g5 : real;
  h1,h2,h3,h4,h5 : real;
  r3,r4,r5 : real;
  gg2,gg4,gg5 : real;
  hh2, hh4, hh5 : real;
  rr4, rr5 : real;
  g_h_r1,g_h_r3 : real;
  g,h,r: real;
  condition : boolean;
  BlockStart, BlockEnd: PtrInt;
  rec: integer;
  { examinedBuckets: array of boolean; }

{
  cx,cy,cz : array [0..3] of real;
  xn,yn,zn,det : real;
  cx1,cx2,cx3,cx4,cx5,cx6,cx7,cx8 : real;
  cy1,cy2,cy3,cy4,cy5,cy6,cy7,cy8 : real;
  cz1,cz2,cz3,cz4,cz5,cz6,cz7,cz8 : real;
  f1g,f1h,f1r,f2g,f2h,f2r,f3g,f3h,f3r: real;
  f1,f2,f3 : real;
  cx1cx0, cy2cy0 , cz3cz0 ,cy3cy0,cz2cz0 ,cy1cy0 ,cx2cx0 ,cx3cx0 ,cz1cz0 ,xncx0 ,yncy0 , zncz0: real;

procedure CheckContainment(K: Node; I: Element);
begin
  //--------------------- Triangular linear and quadratic element -------------------------
  if (sum_z_coord=0) and ((NodesInElement[i] = 3)or(NodesInElement[i] = 6)) then
    begin
      cx[0] := Nodes1[elements1[i,1]-1,1];
      cx[1] := Nodes1[elements1[i,2]-1,1];
      cx[2] := Nodes1[elements1[i,3]-1,1];
      cy[0] := Nodes1[elements1[i,1]-1,2];
      cy[1] := Nodes1[elements1[i,2]-1,2];
      cy[2] := Nodes1[elements1[i,3]-1,2];
      xn := Nodes2[k,1];
      yn := Nodes2[k,2];
      det := ((cx[1]-cx[0])*(cy[2]-cy[0])-(cx[2]-cx[0])*(cy[1]-cy[0]));
      g := ((xn-cx[0])*(cy[2]-cy[0])-(cx[2]-cx[0])*(yn-cy[0]))/det;
      h := ((cx[1]-cx[0])*(yn-cy[0])-(xn-cx[0])*(cy[1]-cy[0]))/det;
      if (g>g1)and(h>h1)and(g+h<g_h_r1) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Quadrileteral linear and quadratic element -------------------------
  else if (sum_z_coord=0) and ((NodesInElement[i] = 4)or(NodesInElement[i] = 8)) then
    begin
      cx1 := Nodes1[elements1[i,1]-1,1];
      cx2 := Nodes1[elements1[i,2]-1,1];
      cx3 := Nodes1[elements1[i,3]-1,1];
      cx4 := Nodes1[elements1[i,4]-1,1];
      cy1 := Nodes1[elements1[i,1]-1,2];
      cy2 := Nodes1[elements1[i,2]-1,2];
      cy3 := Nodes1[elements1[i,3]-1,2];
      cy4 := Nodes1[elements1[i,4]-1,2];
      f1 := - cx1 - cx2 - cx3 - cx4 + 4*Nodes2[k,1];
      f2 := - cy1 - cy2 - cy3 - cy4 + 4*Nodes2[k,2];
      f1g := -cx1 + cx2 + cx3 - cx4;
      f1h := -cx1 - cx2 + cx3 + cx4;
      f2g := -cy1 + cy2 + cy3 - cy4;
      f2h := -cy1 - cy2 + cy3 + cy4;
      Det := f1g*f2h-f1h*f2g;
      g := (f1*f2h-f1h*f2)/Det;
      h := (f1g*f2-f1*f2g)/Det;
      if (g>g2)and(g<gg2)and(h>h2)and(h<hh2)then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Tet linear and quadratic element -------------------------
  else if (sum_z_coord<>0) and ((NodesInElement[i] = 4)or(NodesInElement[i] = 10)) then
    begin
      cx[0] := Nodes1[elements1[i,1]-1,1];
      cx[1] := Nodes1[elements1[i,2]-1,1];
      cx[2] := Nodes1[elements1[i,3]-1,1];
      cx[3] := Nodes1[elements1[i,4]-1,1];
      cy[0] := Nodes1[elements1[i,1]-1,2];
      cy[1] := Nodes1[elements1[i,2]-1,2];
      cy[2] := Nodes1[elements1[i,3]-1,2];
      cy[3] := Nodes1[elements1[i,4]-1,2];
      cz[0] := Nodes1[elements1[i,1]-1,3];
      cz[1] := Nodes1[elements1[i,2]-1,3];
      cz[2] := Nodes1[elements1[i,3]-1,3];
      cz[3] := Nodes1[elements1[i,4]-1,3];
      xn := Nodes2[k,1];
      yn := Nodes2[k,2];
      zn := Nodes2[k,3];
      cx1cx0 :=  cx[1]-cx[0];
      cy2cy0 :=  cy[2]-cy[0];
      cz3cz0 :=  cz[3]-cz[0];
      cy3cy0 :=  cy[3]-cy[0];
      cz2cz0 :=  cz[2]-cz[0];
      cy1cy0 := cy[1]-cy[0];
      cx2cx0 := cx[2]-cx[0];
      cx3cx0 := cx[3]-cx[0];
      cz1cz0 := cz[1]-cz[0];
      xncx0  := xn-cx[0];
      yncy0  := yn-cy[0];
      zncz0  := zn-cz[0];
      det := cx1cx0*cy2cy0*cz3cz0 - cx1cx0*cy3cy0*cz2cz0 - cy1cy0*cx2cx0*cz3cz0 +
             cy1cy0*
             cx3cx0*
             cz2cz0 + cz1cz0*cx2cx0*cy3cy0 - cz1cz0*cx3cx0*cy2cy0;
      g := (xncx0*cy2cy0*cz3cz0 - xncx0*cy3cy0*cz2cz0 - yncy0*cx2cx0*cz3cz0 + yncy0*
           cx3cx0
           *cz2cz0
           + zncz0*cx2cx0*cy3cy0 - zncz0*cx3cx0*cy2cy0)/det;
      h := (cx1cx0*yncy0*cz3cz0 - cx1cx0*cy3cy0*zncz0 - cy1cy0*xncx0*cz3cz0 + cy1cy0*
           cx3cx0*zncz0
           + cz1cz0*xncx0*cy3cy0 - cz1cz0*cx3cx0*yncy0)/det;
      r := (cx1cx0*cy2cy0*zncz0 - cx1cx0*yncy0*cz2cz0 - cy1cy0*cx2cx0*zncz0 + cy1cy0*
           xncx0
           *cz2cz0
           + cz1cz0*cx2cx0*yncy0 - cz1cz0*xncx0*cy2cy0)/det;
      if (g>g3)and(h>h3)and(r>r3)and(g+h+r<g_h_r3) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Wedge linear and quadratic element -------------------------
  else if (sum_z_coord<>0) and ((NodesInElement[i] = 6)or(NodesInElement[i] = 15)) then
    begin
      cx1 := Nodes1[elements1[i,1]-1,1];
      cx2 := Nodes1[elements1[i,2]-1,1];
      cx3 := Nodes1[elements1[i,3]-1,1];
      cx4 := Nodes1[elements1[i,4]-1,1];
      cx5 := Nodes1[elements1[i,5]-1,1];
      cx6 := Nodes1[elements1[i,6]-1,1];
      cy1 := Nodes1[elements1[i,1]-1,2];
      cy2 := Nodes1[elements1[i,2]-1,2];
      cy3 := Nodes1[elements1[i,3]-1,2];
      cy4 := Nodes1[elements1[i,4]-1,2];
      cy5 := Nodes1[elements1[i,5]-1,2];
      cy6 := Nodes1[elements1[i,6]-1,2];
      cz1 := Nodes1[elements1[i,1]-1,3];
      cz2 := Nodes1[elements1[i,2]-1,3];
      cz3 := Nodes1[elements1[i,3]-1,3];
      cz4 := Nodes1[elements1[i,4]-1,3];
      cz5 := Nodes1[elements1[i,5]-1,3];
      cz6 := Nodes1[elements1[i,6]-1,3];
      f1 := -(0.25*(cx2 + cx3) +  0.75*(cx5 + cx6) - 2*Nodes2[k,1]);
      f2 := -(0.25*(cy2 + cy3) +  0.75*(cy5 + cy6) - 2*Nodes2[k,2]);
      f3 := -(0.25*(cz2 + cz3) +  0.75*(cz5 + cz6) - 2*Nodes2[k,3]);
      f1g := -cx1 + cx2 - cx4 + cx5;
      f1h := -cx1 + cx3 - cx4 + cx6;
      f1r :=  0.5*(- cx2 - cx3 + cx5 + cx6);
      f2g := -cy1 + cy2 - cy4 + cy5;
      f2h := -cy1 + cy3 - cy4 + cy6;
      f2r := 0.5*(-cy2 - cy3 + cy5 + cy6);
      f3g := -cz1 + cz2 - cz4 + cz5;
      f3h := -cz1 + cz3 - cz4 + cz6;
      f3r := 0.5*(-cz2 - cz3 +  cz5 + cz6);
      det := f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h;
      g :=  (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det;
      h :=  (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det;
      r :=  (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det;
      if (g>g4)and(g<gg4)and(h>h4)and(h<hh4)and(r>r4)and(r<rr4) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end
  //--------------------- Wedge linear and quadratic element -------------------------
  else if (sum_z_coord<>0) and ((NodesInElement[i] = 8)or(NodesInElement[i] = 20)) then
    begin
      cx1 := Nodes1[elements1[i,1]-1,1];
      cx2 := Nodes1[elements1[i,2]-1,1];
      cx3 := Nodes1[elements1[i,3]-1,1];
      cx4 := Nodes1[elements1[i,4]-1,1];
      cx5 := Nodes1[elements1[i,5]-1,1];
      cx6 := Nodes1[elements1[i,6]-1,1];
      cx7 := Nodes1[elements1[i,7]-1,1];
      cx8 := Nodes1[elements1[i,8]-1,1];
      cy1 := Nodes1[elements1[i,1]-1,2];
      cy2 := Nodes1[elements1[i,2]-1,2];
      cy3 := Nodes1[elements1[i,3]-1,2];
      cy4 := Nodes1[elements1[i,4]-1,2];
      cy5 := Nodes1[elements1[i,5]-1,2];
      cy6 := Nodes1[elements1[i,6]-1,2];
      cy7 := Nodes1[elements1[i,7]-1,2];
      cy8 := Nodes1[elements1[i,8]-1,2];
      cz1 := Nodes1[elements1[i,1]-1,3];
      cz2 := Nodes1[elements1[i,2]-1,3];
      cz3 := Nodes1[elements1[i,3]-1,3];
      cz4 := Nodes1[elements1[i,4]-1,3];
      cz5 := Nodes1[elements1[i,5]-1,3];
      cz6 := Nodes1[elements1[i,6]-1,3];
      cz7 := Nodes1[elements1[i,7]-1,3];
      cz8 := Nodes1[elements1[i,8]-1,3];
      f1 := -cx1 - cx2 - cx3- cx4- cx5-cx6 - cx7- cx8 + 8*Nodes2[k,1];
      f2 := -cy1 - cy2 - cy3- cy4- cy5- cy6- cy7- cy8 + 8*Nodes2[k,2];
      f3 := -cz1 - cz2 - cz3- cz4- cz5- cz6- cz7- cz8 + 8*Nodes2[k,3];
      f1g := -cx1 + cx2 + cx3 - cx4 - cx5 + cx6 + cx7 - cx8;
      f1h := -cx1 - cx2 + cx3 + cx4 - cx5 - cx6 + cx7 + cx8;
      f1r := -cx1 - cx2 - cx3 - cx4 + cx5 + cx6 + cx7 + cx8;
      f2g := -cy1 + cy2 + cy3 - cy4 - cy5 + cy6 + cy7 - cy8;
      f2h := -cy1 - cy2 + cy3 + cy4 - cy5 - cy6 + cy7 + cy8;
      f2r := -cy1 - cy2 - cy3 - cy4 + cy5 + cy6 + cy7 + cy8;
      f3g := -cz1 + cz2 + cz3 - cz4 - cz5 + cz6 + cz7 - cz8;
      f3h := -cz1 - cz2 + cz3 + cz4 - cz5 - cz6 + cz7 + cz8;
      f3r := -cz1 - cz2 - cz3 - cz4 + cz5 + cz6 + cz7 + cz8;
      det := f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h;
      g :=  (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det;
      h :=  (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det;
      r := (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det;
      if (g>g5)and(g<gg5)and(h>h5)and(h<hh5)and(r>r5)and(r<rr5) then
        begin
          main_element_number := elements1[i,0]-1;
          condition := true;
        end
    end;
end;
}

procedure FindNearestElement(I: Node);
var
  x, y, z: integer;
  p: integer;
  search: boolean;
{  examined: array of boolean; }
  examinedOne: boolean;
  j: integer;

procedure SearchBucket(Bucket: BucketPtr);
var
  k: integer;
  e: Element;

begin
{
  if not examinedBuckets[Bucket^.ID] then
    begin
}
      for k := 0 to Bucket^.Len - 1 do
        begin
          e := Bucket^.Elements[k];
{
          if (not examined[e]) then
            begin
}
              { CheckContainment(I, e); }
              MUESFCheckContainment(I, e, sum_z_coord, NodesInElement, Nodes1, Nodes2, elements1, h1, h2, g1, g2, gg2, g3, g4, gg4, hh2, h3, h4, hh4, r3, r4, rr4, r5, g5, gg5, h5, hh5, rr5, g_h_r1, g_h_r3, g, h, r, condition, main_element_number);
              if condition = true then
                break;
{
              examined[e] := true;
}
              if not examinedOne then
                WriteLn('Examined first element at offset ', p, '.');
              examinedOne := true;
{
            end;
}
        end;
{
      examinedBuckets[Bucket^.ID] := true;
    end
}
end;

procedure SearchXPlane(X, Y1, Y2, Z1, Z2: integer);
var
  j, k: integer;
begin
  j := Y1;
  while (j <= Y2) and (not condition) do
    begin
      k := Z1;
      while (k <= Z2) and (not condition) do
        begin
          SearchBucket(Elements1Idx.Grid[X, j, k]);
          k := k + 1;
        end;
      j := j + 1;
    end;
end;

procedure SearchYPlane(Y, X1, X2, Z1, Z2: integer);
var
  i, k: integer;
begin
  i := X1;
  while (i <= X2) and (not condition) do
    begin
      k := Z1;
      while (k <= Z2) and (not condition) do
        begin
          SearchBucket(Elements1Idx.Grid[i, Y, k]);
          k := k + 1;
        end;
      i := i + 1;
    end;
end;

procedure SearchZPlane(Z, X1, X2, Y1, Y2: integer);
var
  i, j: integer;
begin
  i := X1;
  while (i <= X2) and (not condition) do
    begin
      j := Y1;
      while (j <= Y2) and (not condition) do
        begin
          SearchBucket(Elements1Idx.Grid[i, j, Z]);
          j := j + 1;
        end;
      i := i + 1;
    end;
end;

begin
  WriteLn('Searching for the nearest element to node ', i, '...');
  WriteLn('x = ', nodes2[i,1], ', y = ', nodes2[i,2], ', z = ', nodes2[i,3]);
{
  SetLength(examined, high(Elements1) + 1);
  for j := 0 to high(examined) do
    examined[j] := false;
}
{
  for j := 0 to high(examinedBuckets) do
    examinedBuckets[j] := false;
}
  examinedOne := false;
  x := FindPos(nodes2[i,1], Elements1Idx.MinX, Elements1Idx.XSize, Elements1Idx.RangeX);
  y := FindPos(nodes2[i,2], Elements1Idx.MinY, Elements1Idx.YSize, Elements1Idx.RangeY);
  z := FindPos(nodes2[i,3], Elements1Idx.MinZ, Elements1Idx.ZSize, Elements1Idx.RangeZ);
  WriteLn('Location in index: i = ', x, ', j = ', y, ', k = ', z);
  SearchBucket(Elements1Idx.Grid[x,y,z]);
  if condition  then
    begin
      WriteLn('Element found at offset 0. Recursion level ', rec);
{ 
      offsets[i] := 0;
      reclevels[i] := rec;
}
    end
  else
    begin
      p := 1;
      search := true;
      while search and (not condition) and ((p <= 3) or not examinedOne) do
        begin
          search := false;
          if x - p >= 0 then
            begin
              SearchXPlane(x - p, max(y - p, 0), min(y + p, Elements1Idx.YSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
              search := true;
            end;
          if (not condition) and (x + p < Elements1Idx.XSize) then
            begin
              SearchXPlane(x + p, max(y - p, 0), min(y + p, Elements1Idx.YSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
              search := true;
            end;
          if (not condition) and (y - p >= 0) then
            begin
              SearchYPlane(y - p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
              search := true;
            end;
          if (not condition) and (y + p < Elements1Idx.YSize) then
            begin
              SearchYPlane(y + p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
              search := true;
            end;
          if (not condition) and (z - p >= 0) then
            begin
              SearchZPlane(z - p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(y - p, 0), min(y + p, Elements1Idx.YSize - 1));
              search := true;
            end;
          if (not condition) and (z + p < Elements1Idx.ZSize) then
            begin
              SearchZPlane(z + p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(y - p, 0), min(y + p, Elements1Idx.YSize - 1));
              search := true;
            end;
          if condition then
            begin
              WriteLn('Element found at offset ', p, '. Recursion level ', rec);
{
              offsets[i] := p;
              reclevels[i] := rec;
}
            end;
          p := p + 1;
        end;
      if not condition then
        for j := 0 to high(Elements1) do
          begin
{
            if not examined[j] then
}
              { CheckContainment(I, j); }
              MUESFCheckContainment(I, j, sum_z_coord, NodesInElement, Nodes1, Nodes2, elements1, h1, h2, g1, g2, gg2, g3, g4, gg4, hh2, h3, h4, hh4, r3, r4, rr4, r5, g5, gg5, h5, hh5, rr5, g_h_r1, g_h_r3, g, h, r, condition, main_element_number);
            if condition then
              break;
          end;
    end;
end;

begin
  Item.CalcBlock(Index, BlockSize, length(nodes2), BlockStart, BlockEnd);
  { SetLength(examinedBuckets, Elements1Idx.NumBuckets - 1); }
  for k := BlockStart to BlockEnd do
    begin
      condition := false;
      rec := 0;
      //--- Triangular linear and quadratic element --
      g1 := -0.01;
      h1 := -0.01;
      g_h_r1 := 1.01;
      //--- Quadrileteral linear and quadratic element --
      g2 := -1.01;
      gg2 := 1.01;
      h2 := -1.01;
      hh2 := 1.01;
      //-------- Tet linear and quadratic element -------
      g3 := -0.01;
      h3 := -0.01;
      r3 := -0.01;
      g_h_r3 := 1.01;
      //--------- Wedge linear and quadratic element --------
      g4 := -0.01;
      h4 := -0.01;
      r4 := -1.01;
      gg4 := 1.01;
      hh4 := 1.01;
      rr4 := 1.01;
      //------------Hex linear and quadratic elements
      g5 := -1.01;
      h5 := -1.01;
      r5 := -1.01;
      gg5 := 1.01;
      hh5 := 1.01;
      rr5 := 1.01;      
      repeat
        WriteLn('Recursion level: ', rec);
        FindNearestElement(k);
        if not condition then
          begin
            g1 := g1 - 0.05;
            h1 := h1 - 0.05;
            g_h_r1 := g_h_r1 + 0.05;
            g2 := g2-0.05;
            h2 := h2 -0.05;
            gg2 := gg2 + 0.05;
            hh2 := hh2 + 0.05;
            g3 := g3-0.05;
            h3 := h3 -0.05;
            r3 := r3 -0.05;
            g_h_r3 := g_h_r3 + 0.05;
            g4 := g4 - 0.05;
            h4 := h4 - 0.05;
            r4 := r4 - 0.05;
            gg4 := gg4 + 0.05;
            hh4 := hh4 + 0.05;
            rr4 := rr4 + 0.05;
            g5 := g5 - 0.05;
            h5 := h5 - 0.05;
            r5 := r5 - 0.05;
            gg5 := gg5 + 0.05;
            hh5 := hh5 + 0.05;
            rr5 := rr5 + 0.05;
            rec := rec + 1;
          end;
      until condition;
      MUESFCopyResults(ScaleFactorStress,
        ScaleFactorDisplacements,
        ScaleFactorTotalStrain,
        ScaleFactorPlasticStrain,
        ScaleFactorAccumulatedStrain,
        nodes1,
        nodes2,
        Elements1,
        NodesInElement,
        Stress1,
        Displacements1,
        TotalStrain1,
        PlasticStrain1,
        AccumulatedStrain1,
        Stress2,
        StressMapping,
        Displacements2,
        DisplacementMapping,
        TotalStrain2,
        TotalStrainMapping,
        PlasticStrain2,
        PlasticStrainMapping,
        AccumulatedStrain2,
        AccumulatedStrainMapping,
        sum_z_coord,
        main_element_number,
        k,
        g, h, r);
  end;
end;

var 
  BlockCount: PtrInt;

begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);
  sum_z_coord := sum_array_col(nodes1,3);  

  WriteLn('Index dimension: ', Elements1Idx.XSize, ' x ', Elements1Idx.YSize, ' x ', Elements1Idx.ZSize);
  WriteLn('Index ranges: ', Elements1Idx.RangeX, ', ', Elements1Idx.RangeY, ', ', Elements1Idx.RangeZ);

{
  SetLength(offsets, high(Elements1) + 1);
  SetLength(reclevels, high(Elements1) + 1);
}

  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@MUESFPar, 0, BlockCount - 1, nil);

{
  for l := 0 to high(Nodes2) do
    WriteLn('Node ', l, ': offset ', offsets[l], ', recursion level ', reclevels[l]);
}
end;

procedure MUESFP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

var 
  sum_z_coord : real;
  BlockSize: PtrInt;

procedure MUESFPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);

var 
  i,k: integer;
  main_element_number : integer;
  g,h,r: real;
  g1,g2,g3,g4,g5 : real;
  h1,h2,h3,h4,h5 : real;
  gg2,gg4,gg5 : real;
  hh2, hh4, hh5 : real;
  r3,r4,r5,rr4, rr5 : real;
  g_h_r1,g_h_r3 : real;
  condition : boolean;
  BlockStart, BlockEnd: PtrInt;

begin
  Item.CalcBlock(Index, BlockSize, length(nodes2), BlockStart, BlockEnd);
  for k := BlockStart to BlockEnd do
    begin
      condition := false;
      //--- Triangular linear and quadratic element --
      g1 := -0.01;
      h1 := -0.01;
      g_h_r1 := 1.01;
      //--- Quadrileteral linear and quadratic element --
      g2 := -1.01;
      gg2 := 1.01;
      h2 := -1.01;
      hh2 := 1.01;
      //-------- Tet linear and quadratic element -------
      g3 := -0.01;
      h3 := -0.01;
      r3 := -0.01;
      g_h_r3 := 1.01;
      //--------- Wedge linear and quadratic element --------
      g4 := -0.01;
      h4 := -0.01;
      r4 := -1.01;
      gg4 := 1.01;
      hh4 := 1.01;
      rr4 := 1.01;
      //------------Hex linear and quadratic elements
      g5 := -1.01;
      h5 := -1.01;
      r5 := -1.01;
      gg5 := 1.01;
      hh5 := 1.01;
      rr5 := 1.01;
      repeat
        for i := 0 to high(elements1) do
          begin
            MUESFCheckContainment(k, i, sum_z_coord, NodesInElement, Nodes1, Nodes2, elements1, h1, h2, g1, g2, gg2, g3, g4, gg4, hh2, h3, h4, hh4, r3, r4, rr4, r5, g5, gg5, h5, hh5, rr5, g_h_r1, g_h_r3, g, h, r, condition, main_element_number);
            if condition then
              break;
          end;
        if not condition then
          begin
            g1 := g1 - 0.05;
            h1 := h1 - 0.05;
            g_h_r1 := g_h_r1 + 0.05;
            g2 := g2-0.05;
            h2 := h2 -0.05;
            gg2 := gg2 + 0.05;
            hh2 := hh2 + 0.05;
            g3 := g3-0.05;
            h3 := h3 -0.05;
            r3 := r3 -0.05;
            g_h_r3 := g_h_r3 + 0.05;
            g4 := g4 - 0.05;
            h4 := h4 - 0.05;
            r4 := r4 - 0.05;
            gg4 := gg4 + 0.05;
            hh4 := hh4 + 0.05;
            rr4 := rr4 + 0.05;
            g5 := g5 - 0.05;
            h5 := h5 - 0.05;
            r5 := r5 - 0.05;
            gg5 := gg5 + 0.05;
            hh5 := hh5 + 0.05;
            rr5 := rr5 + 0.05;
          end;
      until condition = true;
      MUESFCopyResults(ScaleFactorStress,
        ScaleFactorDisplacements,
        ScaleFactorTotalStrain,
        ScaleFactorPlasticStrain,
        ScaleFactorAccumulatedStrain,
        nodes1,
        nodes2,
        Elements1,
        NodesInElement,
        Stress1,
        Displacements1,
        TotalStrain1,
        PlasticStrain1,
        AccumulatedStrain1,
        Stress2,
        StressMapping,
        Displacements2,
        DisplacementMapping,
        TotalStrain2,
        TotalStrainMapping,
        PlasticStrain2,
        PlasticStrainMapping,
        AccumulatedStrain2,
        AccumulatedStrainMapping,
        sum_z_coord,
        main_element_number,
        k,
        g, h, r);
    end;
end;

var 
  BlockCount: PtrInt;

begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);
  sum_z_coord := sum_array_col(nodes1,3);
  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@MUESFPar, 0, BlockCount - 1, nil);
end;

procedure NPMP(const ScaleFactorStress: real;
               const ScaleFactorDisplacements: real;
               const ScaleFactorTotalStrain: real;
               const ScaleFactorPlasticStrain: real;
               const ScaleFactorAccumulatedStrain: real;
               const nodes1: TRealRealArray;
               const nodes2: TRealRealArray;
               const Stress1: TRealRealArray;
               const Displacements1: TRealRealArray;
               const TotalStrain1: TRealRealArray;
               const PlasticStrain1: TRealRealArray;
               const AccumulatedStrain1: TRealRealArray;
               var Stress2: TRealRealArray;            const StressMapping: boolean;
               var Displacements2: TRealRealArray;     const DisplacementMapping: boolean;
               var TotalStrain2: TRealRealArray;       const TotalStrainMapping: boolean;
               var PlasticStrain2: TRealRealArray;     const PlasticStrainMapping: boolean;
               var AccumulatedStrain2: TRealRealArray; const AccumulatedStrainMapping: boolean);

var 
  BlockSize: PtrInt;

procedure NPMPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);

var 
  i1, j1, v: integer;
  initial: real;
  less_distance: real;
  BlockStart, BlockEnd: PtrInt;
begin
  Item.CalcBlock(Index, BlockSize, length(nodes2), BlockStart, BlockEnd);
  for i1 := BlockStart to BlockEnd do
    begin
      less_distance := 999999999999999999;
      for j1 := low(nodes1) to high(nodes1) do
        begin
          initial := sqr(nodes2[i1,1] - nodes1[j1,1]) + sqr(nodes2[i1,2] - nodes1[j1,2]) + sqr(
                     nodes2[i1
                     ,3] - nodes1[j1,3]);
          if less_distance >= initial then
            begin
              less_distance := initial;
              for v := 0 to 5 do
                begin
                  if StressMapping then
                    Stress2[i1,v] := Stress1[j1,v] * ScaleFactorStress;
                  if TotalStrainMapping  then
                    TotalStrain2[i1,v] := TotalStrain1[j1,v] * ScaleFactorTotalStrain;
                  if PlasticStrainMapping  then
                    PlasticStrain2[i1,v] := PlasticStrain1[j1,v] * ScaleFactorPlasticStrain;
                end;
              for v := 0 to 2 do
                if DisplacementMapping then
                  begin
                    Displacements2[i1,v] := Displacements1[j1,v] * ScaleFactorDisplacements;
                  end;
              if AccumulatedStrainMapping then
                AccumulatedStrain2[i1,0] := AccumulatedStrain1[j1,0] * ScaleFactorAccumulatedStrain;
            end;
        end;
    end;
end;

var 
  BlockCount: PtrInt;

begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);
  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@NPMPar, 0, BlockCount - 1, nil);
end;

function FindNearest(Nodes1Idx: GridIndex; Nodes1, Nodes2: TRealRealArray; i: integer; MinDist: real; XSizeCell, YSizeCell, ZSizeCell: real): integer;
var
  x, y, z: integer;
  nearest: integer;
  p: integer;
  search: boolean;
  xLowerBound, xUpperBound, yLowerBound, yUpperBound, zLowerBound, zUpperBound: real;

procedure SearchBucket(Bucket: BucketPtr);
var
  k: integer;
  dist: real;
  n: Node;
begin
  for k := 0 to Bucket^.Len - 1 do
    begin
      n := Bucket^.Nodes[k];
      dist := sqr(Nodes2[i,1] - Nodes1[n,1]) + sqr(Nodes2[i,2] - Nodes1[n,2]) + sqr(Nodes2[i,3] - Nodes1[n,3]);
      if dist < MinDist then
        begin
          MinDist := dist;
          nearest := n;
        end;
    end;
end;

procedure SearchXPlane(X, Y1, Y2, Z1, Z2: integer);
var
  j, k: integer;
begin
  for j := Y1 to Y2 do
    for k := Z1 to Z2 do
      SearchBucket(Nodes1Idx.Grid[X, j, k]);
end;

procedure SearchYPlane(Y, X1, X2, Z1, Z2: integer);
var
  i, k: integer;
begin
  for i := X1 to X2 do
    for k := Z1 to Z2 do
      SearchBucket(Nodes1Idx.Grid[i, Y, k]);
end;

procedure SearchZPlane(Z, X1, X2, Y1, Y2: integer);
var
  i, j: integer;
begin
  for i := X1 to X2 do
    for j := Y1 to Y2 do
      SearchBucket(Nodes1Idx.Grid[i, j, Z]);
end;

begin
  WriteLn('Searching for the nearest node to node ', i, '...');
  WriteLn('x = ', nodes2[i,1], ', y = ', nodes2[i,2], ', z = ', nodes2[i,3]);
  nearest := -1;
  x := FindPos(nodes2[i,1], Nodes1Idx.MinX, Nodes1Idx.XSize, Nodes1Idx.RangeX);
  y := FindPos(nodes2[i,2], Nodes1Idx.MinY, Nodes1Idx.YSize, Nodes1Idx.RangeY);
  z := FindPos(nodes2[i,3], Nodes1Idx.MinZ, Nodes1Idx.ZSize, Nodes1Idx.RangeZ);
  WriteLn('Location in index: i = ', x, ', j = ', y, ', k = ', z);
  SearchBucket(Nodes1Idx.Grid[x,y,z]);
  xLowerBound := x * XSizeCell + Nodes1Idx.MinX;
  xUpperBound := xLowerBound + XSizeCell;
  yLowerBound := y * YSizeCell + Nodes1Idx.MinY;
  yUpperBound := yLowerBound + YSizeCell;
  zLowerBound := z * ZSizeCell + Nodes1Idx.MinZ;
  zUpperBound := zLowerBound + ZSizeCell;
  p := 1;
  search := true;
  while search do
    begin
      WriteLn('Offset = ', p, ', min distance = ', MinDist);
      WriteLn('x lower bound = ', xLowerBound, ', x upper bound = ', xUpperBound);
      WriteLn('y lower bound = ', yLowerBound, ', y upper bound = ', yUpperBound);
      WriteLn('z lower bound = ', zLowerBound, ', z upper bound = ', zUpperBound);
      Writeln;
      search := false;
      if (x - p >= 0) and (sqr(Nodes2[i,1] - xLowerBound) < MinDist) then
        begin
          WriteLn('Distance from x lower bound = ', Nodes2[i,1] - xLowerBound);
          { WriteLn('Searching plane x = ', x - p); }
          SearchXPlane(x - p, max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
          search := true;
        end;
      if (x + p < Nodes1Idx.XSize) and (sqr(xUpperBound - Nodes2[i,1]) < MinDist) then
        begin
          WriteLn('Distance from x upper bound = ', xUpperBound - Nodes2[i,1]);
          { WriteLn('Searching plane x = ', x + p); }
          SearchXPlane(x + p, max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
          search := true;
        end;
      if (y - p >= 0) and (sqr(Nodes2[i,2] - yLowerBound) < MinDist) then
        begin
          WriteLn('Distance from y lower bound = ', Nodes2[i,2] - yLowerBound);
          { WriteLn('Searching plane y = ', y - p); }
          SearchYPlane(y - p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
          search := true;
        end;
      if (y + p < Nodes1Idx.YSize) and (sqr(yUpperBound - Nodes2[i,2]) < MinDist) then
        begin
          WriteLn('Distance from y upper bound = ', yUpperBound - Nodes2[i,2]);
          { WriteLn('Searching plane y = ', y + p); }
          SearchYPlane(y + p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
          search := true;
        end;
      if (z - p >= 0) and (sqr(Nodes2[i,3] - zLowerBound) < MinDist) then
        begin
          WriteLn('Distance from z lower bound = ', Nodes2[i,3] - zLowerBound);
          { WriteLn('Searching plane z = ', z - p); }
          SearchZPlane(z - p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1));
          search := true;
        end;
      if (z + p < Nodes1Idx.ZSize) and (sqr(zUpperBound - Nodes2[i,3]) < MinDist) then
        begin
          WriteLn('Distance from z upper bound = ', zUpperBound - Nodes2[i,3]);
          { WriteLn('Searching plane z = ', z + p); }
          SearchZPlane(z + p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1));
          search := true;
        end;
      if search then
        begin
          xLowerBound := xLowerBound - XSizeCell;
          xUpperBound := xUpperBound + XSizeCell;
          yLowerBound := yLowerBound - YSizeCell;
          yUpperBound := yUpperBound + YSizeCell;
          zLowerBound := zLowerBound - ZSizeCell;
          zUpperBound := zUpperBound + ZSizeCell;
          p := p + 1;
        end;
    end;

  if nearest = -1 then
    WriteLn('Error. Nearest node to node ', i, ' not found.')
  else
    Writeln('Found the nearest node to node ', i, ', offset ', p, ', distance ', MinDist);
  FindNearest := nearest;
end;

procedure NPMPG(const ScaleFactorStress: real;
               const ScaleFactorDisplacements: real;
               const ScaleFactorTotalStrain: real;
               const ScaleFactorPlasticStrain: real;
               const ScaleFactorAccumulatedStrain: real;
               const Nodes1Idx: GridIndex;
               const Nodes1: TRealRealArray;
               const Nodes2: TRealRealArray;
               const Stress1: TRealRealArray;
               const Displacements1: TRealRealArray;
               const TotalStrain1: TRealRealArray;
               const PlasticStrain1: TRealRealArray;
               const AccumulatedStrain1: TRealRealArray;
               var Stress2: TRealRealArray;            const StressMapping: boolean;
               var Displacements2: TRealRealArray;     const DisplacementMapping: boolean;
               var TotalStrain2: TRealRealArray;       const TotalStrainMapping: boolean;
               var PlasticStrain2: TRealRealArray;     const PlasticStrainMapping: boolean;
               var AccumulatedStrain2: TRealRealArray; const AccumulatedStrainMapping: boolean);
var 
  BlockSize: PtrInt;
  minDist: real;
  xSizeCell, ySizeCell, zSizeCell: real;

procedure NPMPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);
var
  i, k: integer;
  nearest: integer;
  BlockStart, BlockEnd: PtrInt;
begin
  Item.CalcBlock(Index, BlockSize, length(Nodes2), BlockStart, BlockEnd);
  for i := BlockStart to BlockEnd do
    begin
      nearest := FindNearest(Nodes1Idx, Nodes1, Nodes2, i, minDist, xSizeCell, ySizeCell, zSizeCell);
      if StressMapping then
        for k := 0 to 5 do
          Stress2[i,k] := Stress1[nearest,k] * ScaleFactorStress;
      if TotalStrainMapping then
        for k := 0 to 5 do
          TotalStrain2[i,k] := TotalStrain1[nearest,k] * ScaleFactorTotalStrain;
      if PlasticStrainMapping then
        for k := 0 to 5 do
          PlasticStrain2[i,k] := PlasticStrain1[nearest,k] * ScaleFactorPlasticStrain;
      if DisplacementMapping then
        for k := 0 to 2 do
          Displacements2[i,k] := Displacements1[nearest,k] * ScaleFactorDisplacements;
      if AccumulatedStrainMapping then
        AccumulatedStrain2[i,0] := AccumulatedStrain1[nearest,0] * ScaleFactorAccumulatedStrain;
    end;
end;

var 
  BlockCount: PtrInt;
begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);
  
  minDist := sqr(Nodes1Idx.RangeX) + sqr(Nodes1Idx.RangeY) + sqr(Nodes1Idx.RangeZ);
  xSizeCell := Nodes1Idx.RangeX / Nodes1Idx.XSize;
  ySizeCell := Nodes1Idx.RangeY / Nodes1Idx.YSize;
  zSizeCell := Nodes1Idx.RangeZ / Nodes1Idx.ZSize;

  WriteLn('Index dimension: ', Nodes1Idx.XSize, ' x ', Nodes1Idx.YSize, ' x ', Nodes1Idx.ZSize);
  WriteLn('Index ranges: ', Nodes1Idx.RangeX, ', ', Nodes1Idx.RangeY, ', ', Nodes1Idx.RangeZ);
  WriteLn('Cell size: ', xSizeCell, ' x ', ySizeCell, ' x ', zSizeCell);
  WriteLn('Initial minimum distance: ', minDist);  

  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@NPMPar, 0, BlockCount - 1, nil);
end;

procedure DMUFPCopyResults(
  i1: integer;
  const closest_node: array of integer;
  const quadr: array of real;
  if_coincide: boolean;
  ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain: real;
  const Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1: TRealRealArray;
  const StressZero,PlasticStrainZero,TotalStrainZero: array of real;
  const DisplacementsZero: array of real;
  AccumulatedStrainZero: real;
  StressMapping, DisplacementMapping, TotalStrainMapping, PlasticStrainMapping, AccumulatedStrainMapping: boolean;
  var Stress2, Displacements2, TotalStrain2, PlasticStrain2, AccumulatedStrain2: TRealRealArray);

var
  quadr_sum : real;
  q_k : array [0..7] of real;
  q_k_sum : real;
  StressAverage,PlasticStrainAverage,TotalStrainAverage: array [0..5] of real;
  DisplacementsAverage : array [0..2] of real;
  AccumulatedStrainAverage : real;
  v, f: integer;

begin
  for v := 0 to 5 do
    begin
      StressAverage[v] := 0;
      TotalStrainAverage[v] := 0;
      PlasticStrainAverage[v] := 0;
    end;
  for v := 0 to 2 do
    DisplacementsAverage[v] := 0;
  AccumulatedStrainAverage := 0;
  if if_coincide = true then
    begin
      for v := 0 to 5 do
        begin
          if StressMapping  then
            Stress2[i1,v] := StressZero[v]*ScaleFactorStress;
          if TotalStrainMapping  then
            TotalStrain2[i1,v] := TotalStrainZero[v]*ScaleFactorTotalStrain;
          if PlasticStrainMapping  then
            PlasticStrain2[i1,v] := PlasticStrainZero[v]*ScaleFactorPlasticStrain;
        end;
      for v := 0 to 2 do
        if DisplacementMapping then
          Displacements2[i1,v] := DisplacementsZero[v]*ScaleFactorDisplacements;
      if AccumulatedStrainMapping  then
        AccumulatedStrain2[i1,0] := AccumulatedStrainZero*ScaleFactorAccumulatedStrain;
    end
  else
    begin
      quadr_sum := 0;
      q_k_sum := 0;
      for v := 0 to 5 do
        StressAverage[v] := 0;
      for f:= 0 to 7 do
        if quadr[f]<>-1 then
          quadr_sum := quadr_sum + quadr[f];
      for f:= 0 to 7 do
        if quadr[f]<>-1 then
          q_k[f] := quadr_sum/quadr[f]
        else
          q_k[f] := -1;
      for f:= 0 to 7 do
        if q_k[f]<>-1 then
          q_k_sum := q_k_sum + q_k[f];
      for f:= 0 to 7 do
        if quadr[f]<>-1 then
          begin
            for v := 0 to 5 do
              begin
                if StressMapping  then
                  StressAverage[v] := StressAverage[v] + Stress1[closest_node[f],v]*(q_k[f]/q_k_sum);
                if TotalStrainMapping  then
                  TotalStrainAverage[v] := TotalStrainAverage[v] + TotalStrain1[closest_node[f],v]*(q_k[f]/q_k_sum);
                if PlasticStrainMapping  then
                  PlasticStrainAverage[v] := PlasticStrainAverage[v] + PlasticStrain1[closest_node[f],v]*(q_k[f]/q_k_sum);
              end;
            for v := 0 to 2 do
              if DisplacementMapping  then
                DisplacementsAverage[v] := DisplacementsAverage[v] + Displacements1[closest_node[f],v]*(q_k[f]/q_k_sum);
            if AccumulatedStrainMapping  then
              AccumulatedStrainAverage := AccumulatedStrainAverage + AccumulatedStrain1[closest_node[f],0]*(q_k[f]/q_k_sum);
          end;
      for v := 0 to 5 do
        begin
          if StressMapping  then
            Stress2[i1,v] := StressAverage[v]*ScaleFactorStress;
          if TotalStrainMapping then
            TotalStrain2[i1,v] := TotalStrainAverage[v]*ScaleFactorTotalStrain;
          if PlasticStrainMapping  then
            PlasticStrain2[i1,v] := PlasticStrainAverage[v]*ScaleFactorPlasticStrain;
        end;
      for v := 0 to 2 do
        if DisplacementMapping  then
          Displacements2[i1,v] := DisplacementsAverage[v]*ScaleFactorDisplacements;
      if AccumulatedStrainMapping  then
        AccumulatedStrain2[i1,0] := AccumulatedStrainAverage*ScaleFactorAccumulatedStrain;
    end;
end;

procedure DMUFPP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);
var 
  BlockSize: PtrInt;

procedure DMUFPPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);
var 
  i1,j1,v,f: integer;
  which_quadrant : integer;
  quadr : array [0..7] of  real;
  closest_node : array [0..7] of integer;
  initial : real;
  StressZero,PlasticStrainZero,TotalStrainZero : array [0..5] of real;
  DisplacementsZero: array [0..2] of real;
  AccumulatedStrainZero : real;
  if_coincide : boolean;
  BlockStart, BlockEnd: PtrInt;

begin
  Item.CalcBlock(Index, BlockSize, length(nodes2), BlockStart, BlockEnd);
  for i1 := BlockStart to BlockEnd do
    begin
      if_coincide := false;
      for f:= 0 to 7 do
        begin
          quadr[f] := -1;
          closest_node[f] := -1 ;
        end;
      for j1 := low(nodes1) to high(nodes1) do
        begin
          if (nodes1[j1,1] = nodes2[i1,1]) and (nodes1[j1,2] = nodes2[i1,2]) and(nodes1[j1,3] = nodes2[i1,3]) then
            which_quadrant := 0 //-,-,-
          else if (nodes1[j1,1] <= nodes2[i1,1]) and (nodes1[j1,2] <= nodes2[i1,2]) and(nodes1[j1,3] <= nodes2[i1,3]) then
            which_quadrant := 1 //-,-,-
          else if (nodes1[j1,1] > nodes2[i1,1]) and (nodes1[j1,2] < nodes2[i1,2]) and(nodes1[j1,3] < nodes2[i1,3]) then
            which_quadrant := 2 //+,-,-
          else if (nodes1[j1,1] >= nodes2[i1,1]) and (nodes1[j1,2] <= nodes2[i1,2]) and(nodes1[j1,3] >= nodes2[i1,3]) then
            which_quadrant := 3 //+,-,+
          else if (nodes1[j1,1]< nodes2[i1,1]) and (nodes1[j1,2] < nodes2[i1,2]) and(nodes1[j1,3] > nodes2[i1,3]) then
            which_quadrant := 4 //-,-,+
          else if (nodes1[j1,1] <= nodes2[i1,1]) and (nodes1[j1,2] >= nodes2[i1,2]) and(nodes1[j1,3] <= nodes2[i1,3]) then
            which_quadrant := 5 //-,+,-
          else if (nodes1[j1,1]> nodes2[i1,1]) and (nodes1[j1,2] > nodes2[i1,2]) and(nodes1[j1,3] < nodes2[i1,3]) then
            which_quadrant := 6 //+,+,-
          else if (nodes1[j1,1]>= nodes2[i1,1]) and (nodes1[j1,2] >= nodes2[i1,2]) and(nodes1[j1,3] >= nodes2[i1,3]) then
            which_quadrant := 7 //+,+,+
          else
            which_quadrant := 8; //-,+,+
          initial := sqr(nodes2[i1,1]- nodes1[j1,1]) + sqr(nodes2[i1,2]-nodes1[j1,2]) + sqr(nodes2[i1,3]-nodes1[j1,3]);
          if which_quadrant = 0 then
            begin
              if_coincide := true;
              for v := 0 to 5 do
                begin
                  if Stress2 <> nil then
                    StressZero[v] := stress1[j1,v];
                  if TotalStrain2 <> nil then
                    TotalStrainZero[v] := TotalStrain1[j1,v];
                  if PlasticStrain2 <> nil then
                    PlasticStrainZero[v] := PlasticStrain1[j1,v];
                end;
              for v := 0 to 2 do
                if Displacements2 <> nil then
                  DisplacementsZero[v] := Displacements1[j1,v];
              if AccumulatedStrain2 <> nil then
                AccumulatedStrainZero := AccumulatedStrain1[j1,0];
              break;
            end
          else if (quadr[which_quadrant - 1] > initial) or (quadr[which_quadrant - 1] = -1) then
            begin
              quadr[which_quadrant - 1] := initial;
              closest_node[which_quadrant - 1] := j1;
            end;
        end;
      DMUFPCopyResults(i1,
                       closest_node,
                       quadr,
                       if_coincide,
                       ScaleFactorStress,
                       ScaleFactorDisplacements,
                       ScaleFactorTotalStrain,
                       ScaleFactorPlasticStrain,
                       ScaleFactorAccumulatedStrain,
                       Stress1, Displacements1,
                       TotalStrain1,
                       PlasticStrain1,
                       AccumulatedStrain1,
                       StressZero,
                       PlasticStrainZero,
                       TotalStrainZero,
                       DisplacementsZero,
                       AccumulatedStrainZero,
                       StressMapping,
                       DisplacementMapping,
                       TotalStrainMapping,
                       PlasticStrainMapping,
                       AccumulatedStrainMapping,
                       Stress2,
                       Displacements2,
                       TotalStrain2,
                       PlasticStrain2,
                       AccumulatedStrain2);
    end;
end;

var 
  BlockCount: PtrInt;

begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);

  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@DMUFPPar, 0, BlockCount - 1, nil);
end;

procedure DMUFPPG(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const Nodes1Idx: GridIndex;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);
var 
  BlockSize: PtrInt;
  minDist: real;
  xSizeCell, ySizeCell, zSizeCell: real;
  quadrants0: array[0..3] of integer = (0, 3, 4, 7);
  quadrants1: array[0..4] of integer = (1, 2, 5, 6, 7);
  quadrants2: array[0..3] of integer = (0, 1, 2, 3);
  quadrants3: array[0..3] of integer = (4, 5, 6, 7);
  quadrants4: array[0..4] of integer = (0, 1, 4, 5, 7);
  quadrants5: array[0..3] of integer = (2, 3, 6, 7);

procedure DMUFPPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);
var
  quadr: array[0..7] of  real;
  closest_node: array[0..7] of integer;
  StressZero, PlasticStrainZero, TotalStrainZero: array[0..5] of real;
  DisplacementsZero: array[0..2] of real;
  AccumulatedStrainZero: real;
  if_coincide: boolean;
  BlockStart, BlockEnd: PtrInt;
  { examinedBuckets: array of array of boolean; }

procedure FindNearestNodes(i: integer);
var
  x, y, z: integer;
  p: integer;
  search: boolean;
  xLowerBound, xUpperBound, yLowerBound, yUpperBound, zLowerBound, zUpperBound: real;
  { missing: array[0..5, 0..7] of boolean; }

function FindQuadrant(i1, i2: integer): integer;
begin
  if (nodes1[i1,1] <= nodes2[i2,1]) and (nodes1[i1,2] <= nodes2[i2,2]) and(nodes1[i1,3] <= nodes2[i2,3]) then
    FindQuadrant := 0 //-,-,-
  else if (nodes1[i1,1] > nodes2[i2,1]) and (nodes1[i1,2] < nodes2[i2,2]) and(nodes1[i1,3] < nodes2[i2,3]) then
    FindQuadrant := 1 //+,-,-
  else if (nodes1[i1,1] >= nodes2[i2,1]) and (nodes1[i1,2] <= nodes2[i2,2]) and(nodes1[i1,3] >= nodes2[i2,3]) then
    FindQuadrant := 2 //+,-,+
  else if (nodes1[i1,1] < nodes2[i2,1]) and (nodes1[i1,2] < nodes2[i2,2]) and(nodes1[i1,3] > nodes2[i2,3]) then
    FindQuadrant := 3 //-,-,+
  else if (nodes1[i1,1] <= nodes2[i2,1]) and (nodes1[i1,2] >= nodes2[i2,2]) and(nodes1[i1,3] <= nodes2[i2,3]) then
    FindQuadrant := 4 //-,+,-
  else if (nodes1[i1,1] > nodes2[i2,1]) and (nodes1[i1,2] > nodes2[i2,2]) and(nodes1[i1,3] < nodes2[i2,3]) then
    FindQuadrant := 5 //+,+,-
  else if (nodes1[i1,1] >= nodes2[i2,1]) and (nodes1[i1,2] >= nodes2[i2,2]) and(nodes1[i1,3] >= nodes2[i2,3]) then
    FindQuadrant := 6 //+,+,+
  else
    FindQuadrant := 7;
end;

procedure SearchBucket(Bucket: BucketPtr); overload;
var
  n: Node;

procedure CopyResults();
var
  v: integer;

begin
  for v := 0 to 5 do
    begin
      if Stress2 <> nil then
        StressZero[v] := stress1[N,v];
      if TotalStrain2 <> nil then
        TotalStrainZero[v] := TotalStrain1[N,v];
      if PlasticStrain2 <> nil then
        PlasticStrainZero[v] := PlasticStrain1[N,v];
    end;
  for v := 0 to 2 do
    if Displacements2 <> nil then
      DisplacementsZero[v] := Displacements1[N,v];
  if AccumulatedStrain2 <> nil then
    AccumulatedStrainZero := AccumulatedStrain1[N,0];
end;

var
  k, q: integer;
  dist: real;

begin
  for k := 0 to Bucket^.Len - 1 do
    begin
      n := Bucket^.Nodes[k];
      dist := sqr(Nodes2[i,1] - Nodes1[n,1]) + sqr(Nodes2[i,2] - Nodes1[n,2]) + sqr(Nodes2[i,3] - Nodes1[n,3]);
      if dist = 0 then
        begin
          if_coincide := true;
          CopyResults();
          break;
        end
      else
        begin
          q := FindQuadrant(n, i);
          if dist < quadr[q] then
            begin
              quadr[q] := dist;
              closest_node[q] := n;
            end;
          { examinedBuckets[q,Bucket^.ID] := true; }
        end;
    end;
end;

procedure SearchBucket(Bucket: BucketPtr; Q: integer); overload;
var
  k: integer;
  dist: real;
  n: Node;
begin
  for k := 0 to Bucket^.Len - 1 do
    begin
      n := Bucket^.Nodes[k];
      if (FindQuadrant(n, i) = Q) { and (not examinedBuckets[Q,Bucket^.ID]) } then
        begin
          dist := sqr(Nodes2[i,1] - Nodes1[n,1]) + sqr(Nodes2[i,2] - Nodes1[n,2]) + sqr(Nodes2[i,3] - Nodes1[n,3]);
          if dist < quadr[Q] then
            begin
              quadr[Q] := dist;
              closest_node[Q] := n;
            end;
          { examinedBuckets[Q,Bucket^.ID] := true; }
        end;
    end;
end;

{
procedure SearchBucketTest(Bucket: BucketPtr; Q, P: integer);
var
  k: integer;
  n: Node;
begin
  for k := 0 to Bucket^.Len - 1 do
    begin
      n := Bucket^.Nodes[k];
      if (FindQuadrant(n, i) = Q) then
        missing[P,Q] := true;
    end;
end;
}

procedure SearchXPlane(Q, X, Y1, Y2, Z1, Z2: integer);
var
  j, k: integer;
begin
  for j := Y1 to Y2 do
    for k := Z1 to Z2 do
      SearchBucket(Nodes1Idx.Grid[X, j, k], Q);
end;

procedure SearchYPlane(Q, Y, X1, X2, Z1, Z2: integer);
var
  i, k: integer;
begin
  for i := X1 to X2 do
    for k := Z1 to Z2 do
      SearchBucket(Nodes1Idx.Grid[i, Y, k], Q);
end;

procedure SearchZPlane(Q, Z, X1, X2, Y1, Y2: integer);
var
  i, j: integer;
begin
  for i := X1 to X2 do
    for j := Y1 to Y2 do
      SearchBucket(Nodes1Idx.Grid[i, j, Z], Q);
end;

{
procedure SearchXPlaneTest(P, Q, X, Y1, Y2, Z1, Z2: integer);
var
  j, k: integer;
begin
  for j := Y1 to Y2 do
    for k := Z1 to Z2 do
      SearchBucketTest(Nodes1Idx.Grid[X, j, k], Q, P);
end;

procedure SearchYPlaneTest(P, Q, Y, X1, X2, Z1, Z2: integer);
var
  i, k: integer;
begin
  for i := X1 to X2 do
    for k := Z1 to Z2 do
      SearchBucketTest(Nodes1Idx.Grid[i, Y, k], Q, P);
end;

procedure SearchZPlaneTest(P, Q, Z, X1, X2, Y1, Y2: integer);
var
  i, j: integer;
begin
  for i := X1 to X2 do
    for j := Y1 to Y2 do
      SearchBucketTest(Nodes1Idx.Grid[i, j, Z], Q, P);
end;
}

procedure SearchLowerXPlane();
var
  { nquadrants: array[0..3] of integer = (1, 2, 5, 6); }
  dist: real;
  j: integer;

begin
  dist := sqr(Nodes2[i,1] - xLowerBound);
  for j := low(quadrants0) to high(quadrants0) do
    if dist < quadr[j] then
      begin
        SearchXPlane(quadrants0[j], x - p, max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
        search := true;
      end;
  {
  for j := low(nquadrants) to high(nquadrants) do
    if dist < quadr[j] then
      SearchXPlaneTest(0, nquadrants[j], x - p, max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
  }
end;

procedure SearchUpperXPlane();
var
  { nquadrants: array[0..3] of integer = (0, 3, 4, 7); }
  dist: real;
  j: integer;

begin
  dist := sqr(xUpperBound - Nodes2[i,1]);
  for j := low(quadrants1) to high(quadrants1) do
    if dist < quadr[j] then
      begin
        SearchXPlane(quadrants1[j], x + p, max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
        search := true;
      end;
  {
  for j := low(nquadrants) to high(nquadrants) do
    if dist < quadr[j] then
      SearchXPlaneTest(1, nquadrants[j], x + p, max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
  }
end;

procedure SearchLowerYPlane();
var
  { nquadrants: array[0..3] of integer = (4, 5, 6, 7); }
  dist: real;
  j: integer;

begin
  dist := sqr(Nodes2[i,2] - yLowerBound);
  for j := low(quadrants2) to high(quadrants2) do
    if dist < quadr[j] then
      begin
        SearchYPlane(quadrants2[j], y - p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
        search := true;
      end;
  {
  for j := low(nquadrants) to high(nquadrants) do
    if dist < quadr[j] then
      SearchYPlaneTest(2, nquadrants[j], y - p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
  }
end;

procedure SearchUpperYPlane();
var
  { nquadrants: array[0..3] of integer = (0, 1, 2, 3); }
  dist: real;
  j: integer;

begin
  dist := sqr(yUpperBound - Nodes2[i,2]);
  for j := low(quadrants3) to high(quadrants3) do
    if dist < quadr[j] then
      begin
        SearchYPlane(quadrants3[j], y + p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
        search := true;
      end;
  {
  for j := low(nquadrants) to high(nquadrants) do
    if dist < quadr[j] then
      SearchYPlaneTest(3, nquadrants[j], y + p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(z - p, 0), min(z + p, Nodes1Idx.ZSize - 1));
  }
end;

procedure SearchLowerZPlane();
var
  { nquadrants: array[0..3] of integer = (2, 3, 6, 7); }
  dist: real;
  j: integer;

begin
  dist := sqr(Nodes2[i,3] - zLowerBound);
  for j := low(quadrants4) to high(quadrants4) do
    if dist < quadr[j] then
      begin
        SearchZPlane(quadrants4[j], z - p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1));
        search := true;
      end;
  {
  for j := low(nquadrants) to high(nquadrants) do
    if dist < quadr[j] then
      SearchZPlaneTest(4, nquadrants[j], z - p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1));
  }
end;

procedure SearchUpperZPlane();
var
  { nquadrants: array[0..3] of integer = (0, 1, 4, 5); }
  dist: real;
  j: integer;

begin
  dist := sqr(zUpperBound - Nodes2[i,3]);
  for j := low(quadrants5) to high(quadrants5) do
    if dist < quadr[j] then
      begin
        SearchZPlane(quadrants5[j], z + p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1));
        search := true;
      end;
  {
  for j := low(nquadrants) to high(nquadrants) do
    if dist < quadr[j] then
      SearchZPlaneTest(5, nquadrants[j], z + p, max(x - p, 0), min(x + p, Nodes1Idx.XSize - 1), max(y - p, 0), min(y + p, Nodes1Idx.YSize - 1));
  }
end;

var
  j, l, {m,} q: integer;
  dist: real;

begin
{
  for l := 0 to 5 do
    for m := 0 to 7 do
      missing[l,m] := false;
}
  WriteLn('Searching for the nearest nodes to node ', i, '...');
  WriteLn('x = ', nodes2[i,1], ', y = ', nodes2[i,2], ', z = ', nodes2[i,3]);
  x := FindPos(nodes2[i,1], Nodes1Idx.MinX, Nodes1Idx.XSize, Nodes1Idx.RangeX);
  y := FindPos(nodes2[i,2], Nodes1Idx.MinY, Nodes1Idx.YSize, Nodes1Idx.RangeY);
  z := FindPos(nodes2[i,3], Nodes1Idx.MinZ, Nodes1Idx.ZSize, Nodes1Idx.RangeZ);
  WriteLn('Location in index: i = ', x, ', j = ', y, ', k = ', z);
{
  for j := 0 to 7 do
    for l := 0 to Nodes1Idx.NumBuckets - 2 do
      examinedBuckets[j, l] := false;
}
  SearchBucket(Nodes1Idx.Grid[x,y,z]);
  if if_coincide then
    Writeln('Found the nearest node to node ', i, ' (exact match), last offset examined 0')
  else
    begin
      xLowerBound := x * XSizeCell + Nodes1Idx.MinX;
      xUpperBound := xLowerBound + XSizeCell;
      yLowerBound := y * YSizeCell + Nodes1Idx.MinY;
      yUpperBound := yLowerBound + YSizeCell;
      zLowerBound := z * ZSizeCell + Nodes1Idx.MinZ;
      zUpperBound := zLowerBound + ZSizeCell;
      p := 1;
      search := true;
      while search and (p <= 3) do
        begin
{
          WriteLn('Offset = ', p);
          WriteLn('x lower bound = ', xLowerBound, ', x upper bound = ', xUpperBound);
          WriteLn('y lower bound = ', yLowerBound, ', y upper bound = ', yUpperBound);
          WriteLn('z lower bound = ', zLowerBound, ', z upper bound = ', zUpperBound);
          Writeln;
}
          search := false;
          if x - p >= 0 then
            SearchLowerXPlane();
          if x + p < Nodes1Idx.XSize then
            SearchUpperXPlane();
          if y - p >= 0 then
            SearchLowerYPlane();
          if y + p < Nodes1Idx.YSize then
            SearchUpperYPlane();
          if z - p >= 0 then
            SearchLowerZPlane();
          if z + p < Nodes1Idx.ZSize then
            SearchUpperZPlane();
          if search then
            begin
              xLowerBound := xLowerBound - XSizeCell;
              xUpperBound := xUpperBound + XSizeCell;
              yLowerBound := yLowerBound - YSizeCell;
              yUpperBound := yUpperBound + YSizeCell;
              zLowerBound := zLowerBound - ZSizeCell;
              zUpperBound := zUpperBound + ZSizeCell;
              p := p + 1;
            end;
        end;
{
      for l := 0 to 7 do
        if closest_node[l] = -1 then
          WriteLn('Nearest node to node ', i, ' not found in quadrant ', l)
        else
          Writeln('Found the nearest node to node ', i, ' in quadrant ', l, ', last offset examined ', p, ', distance ', quadr[l]);
}
      if not search then
        WriteLn('Search in the index finished. Last offset examined ', p)
      else
        WriteLn('Last offset examined ', p - 1);
      if search then      
        for j := 0 to 7 do
          if closest_node[j] <> -1 then
            begin
              search := false;
              break;
            end;
      if search then
        for j := 0 to high(Nodes1) do
          begin
            q := FindQuadrant(j, i);
            dist := sqr(Nodes2[i,1] - Nodes1[j,1]) + sqr(Nodes2[i,2] - Nodes1[j,2]) + sqr(Nodes2[i,3] - Nodes1[j,3]);
            if dist < quadr[q] then
              begin
                quadr[q] := dist;
                closest_node[q] := j;
              end;
          end;      
    end;
{
  for l := 0 to 5 do
    begin
      WriteLn;
      Write('Plane ', l);
      for m := 0 to 7 do
        if missing[l,m] then
          Write(' ', m);
    end;
}
end;

{
quadr 0:
[1,2] [1,2] [1,2]
1 1 1
quadr 1:
3 1 1
quadr 2:
[2 3] [1 2] [2 3]
3 1 3
quadr 3:
1 1 3
quadr 4:
[1 2] [2 3] [1 2]
1 3 1
quadr 5:
3 3 1
quadr 6:
[2 3] [2 3] [2 3]
3 3 3
quadr 7:
1 3 3
}
var
  i, q: integer;

begin
  Item.CalcBlock(Index, BlockSize, length(nodes2), BlockStart, BlockEnd);
  { SetLength(examinedBuckets, 8, Nodes1Idx.NumBuckets - 1); }
  for i := BlockStart to BlockEnd do
    begin
      if_coincide := false;
      for q := 0 to 7 do
        begin
          quadr[q] := minDist;
          closest_node[q] := -1;
        end;
      FindNearestNodes(i);
      if not if_coincide then
        for q := 0 to 7 do
          if closest_node[q] = -1 then
            begin
              quadr[q] := -1;
              WriteLn('Nearest node in quadrant ', q, ' not found');
            end;
      DMUFPCopyResults(i,
        closest_node,
        quadr,
        if_coincide,
        ScaleFactorStress,
        ScaleFactorDisplacements,
        ScaleFactorTotalStrain,
        ScaleFactorPlasticStrain,
        ScaleFactorAccumulatedStrain,
        Stress1, Displacements1,
        TotalStrain1,
        PlasticStrain1,
        AccumulatedStrain1,
        StressZero,
        PlasticStrainZero,
        TotalStrainZero,
        DisplacementsZero,
        AccumulatedStrainZero,
        StressMapping,
        DisplacementMapping,
        TotalStrainMapping,
        PlasticStrainMapping,
        AccumulatedStrainMapping,
        Stress2,
        Displacements2,
        TotalStrain2,
        PlasticStrain2,
        AccumulatedStrain2);
    end;
end;

var 
  BlockCount: PtrInt;

begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);

  minDist := sqr(Nodes1Idx.RangeX) + sqr(Nodes1Idx.RangeY) + sqr(Nodes1Idx.RangeZ);
  xSizeCell := Nodes1Idx.RangeX / Nodes1Idx.XSize;
  ySizeCell := Nodes1Idx.RangeY / Nodes1Idx.YSize;
  zSizeCell := Nodes1Idx.RangeZ / Nodes1Idx.ZSize;

  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@DMUFPPar, 0, BlockCount - 1, nil);
end;

procedure DMUECopyResults(
  k: integer;
  main_element_number: integer;
  const ScaleFactorStress: real;
  const ScaleFactorDisplacements: real;
  const ScaleFactorTotalStrain: real;
  const ScaleFactorPlasticStrain: real;
  const ScaleFactorAccumulatedStrain: real;
  const nodes1: TRealRealArray;
  const nodes2: TRealRealArray;
  const Elements1: TIntegerIntegerArray;
  const NodesInElement: array of integer;
  const Stress1: TRealRealArray;
  const Displacements1: TRealRealArray;
  const TotalStrain1: TRealRealArray;
  const PlasticStrain1: TRealRealArray;
  const AccumulatedStrain1: TRealRealArray;
  var Stress2: TRealRealArray;             const StressMapping: boolean;
  var Displacements2: TRealRealArray;      const DisplacementMapping: boolean;
  var TotalStrain2: TRealRealArray;        const TotalStrainMapping: boolean;
  var PlasticStrain2: TRealRealArray;      const PlasticStrainMapping: boolean;
  var AccumulatedStrain2: TRealRealArray;  const AccumulatedStrainMapping: boolean);
var
  DisplacementHelper: array [0..2] of real;
  AccumulatedStrainHelper: real;
  StressHelper, TotalStrainHelper, PlasticStrainHelper: array [0..5] of real;
  avarage_distance_in_element,avarage_k_coefficient:  real;
  distance_in_element,k_coefficient: TRealArray;
  exception_for_coinsidance: boolean;
  NodeCoincidanceStress,NodeCoincidancePlasticStrain,NodeCoincidanceTotalStrain: array [0..5] of real;
  NodeCoincidanceDisplacement: array [0..2] of real;
  NodeCoincidanceAccumulatedStrain: real;
  nodes_in_element:  array of integer;
  arg1,arg2,arg3: real;
  l, br_, v: integer;

begin
  for v := 0 to 5 do
    begin
      StressHelper[v] := 0;
      PlasticStrainHelper[v] := 0;
      TotalStrainHelper[v] := 0;
    end;
  for v := 0 to 2 do
    DisplacementHelper[v] := 0;
  AccumulatedStrainHelper := 0;
  br_ := -1;
  for l := 0 to NodesInElement[main_element_number] do
    begin
      if l > 0 then
        begin
          br_ := br_ + 1;
          SetLength(distance_in_element,Length(distance_in_element)+1);
          SetLength(nodes_in_element,Length(nodes_in_element)+1);
          arg1 := sqr(nodes1[elements1[main_element_number,l]-1,1] - nodes2[k,1]);
          arg2 := sqr(nodes1[elements1[main_element_number,l]-1,2] - nodes2[k,2]);
          arg3 := sqr(nodes1[elements1[main_element_number,l]-1,3] - nodes2[k,3]);
          distance_in_element[br_] := arg1 + arg2 + arg3;
          nodes_in_element[br_] := elements1[main_element_number,l]-1;
        end;
    end;
  avarage_distance_in_element := sum_array(distance_in_element);
  //this is sum not avarage. do not look the variable name
  exception_for_coinsidance := false;
  for l := low(distance_in_element) to high(distance_in_element) do
    begin
      if distance_in_element[l] = 0 then
        begin
          for v := 0 to 5 do
            begin
              if StressMapping then
                NodeCoincidanceStress[v] := Stress1[nodes_in_element[l],v];
              if PlasticStrainMapping then
                NodeCoincidancePlasticStrain[v] := PlasticStrain1[nodes_in_element[l],v];
              if TotalStrainMapping then
                NodeCoincidanceTotalStrain[v] := TotalStrain1[nodes_in_element[l],v];
            end;
          for v := 0 to 2 do
            if DisplacementMapping then
              NodeCoincidanceDisplacement[v] := Displacements1[nodes_in_element[l],v];
          if AccumulatedStrainMapping then
            NodeCoincidanceAccumulatedStrain := AccumulatedStrain1[nodes_in_element[l],0];
          exception_for_coinsidance := true;
          break;
        end
      else
        begin
          SetLength(k_coefficient,Length(k_coefficient)+1);
          k_coefficient[l] :=  avarage_distance_in_element/distance_in_element[l];
        end;
    end;
  if exception_for_coinsidance then
    begin
      for v := 0 to 5 do
        begin
          if StressMapping then
            Stress2[k,v] := NodeCoincidanceStress[v]*ScaleFactorStress;
          if TotalStrainMapping  then
            TotalStrain2[k,v] := NodeCoincidanceTotalStrain[v]*ScaleFactorTotalStrain;
          if PlasticStrainMapping  then
            PlasticStrain2[k,v] := NodeCoincidancePlasticStrain[v]*ScaleFactorPlasticStrain;
        end;
      for v := 0 to 2 do
        if DisplacementMapping then
          Displacements2[k,v] := NodeCoincidanceDisplacement[v]*ScaleFactorDisplacements;
      if AccumulatedStrainMapping  then
        AccumulatedStrain2[k,0] := NodeCoincidanceAccumulatedStrain*ScaleFactorAccumulatedStrain;
    end
  else
    begin
      avarage_k_coefficient := sum_array(k_coefficient);
      //this is sum not avarage. do not look the variable name
      for l := low(k_coefficient) to high(k_coefficient) do
        begin
          for v := 0 to 5 do
            begin
              if StressMapping then
                StressHelper[v] := StressHelper[v] + (k_coefficient[l]/avarage_k_coefficient)*
                                   Stress1[nodes_in_element[l],v];
              if PlasticStrainMapping then
                PlasticStrainHelper[v] := PlasticStrainHelper[v] + (k_coefficient[l]/
                                          avarage_k_coefficient)*PlasticStrain1[nodes_in_element
                                          [l],v];
              if TotalStrainMapping then
                TotalStrainHelper[v] := TotalStrainHelper[v] + (k_coefficient[l]/
                                        avarage_k_coefficient)*TotalStrain1[nodes_in_element[l],
                                        v];
            end;
          for v := 0 to 2 do
            if DisplacementMapping then
              DisplacementHelper[v] := DisplacementHelper[v] + (k_coefficient[l]/
                                       avarage_k_coefficient)*Displacements1[nodes_in_element[l]
                                       ,v];
          if AccumulatedStrainMapping then
            AccumulatedStrainHelper := AccumulatedStrainHelper + (k_coefficient[l]/
                                       avarage_k_coefficient)*AccumulatedStrain1[
                                       nodes_in_element[l],0];
        end;
      for v := 0 to 5 do
        begin
          if StressMapping then
            Stress2[k,v] := StressHelper[v]*ScaleFactorStress;
          if TotalStrainMapping  then
            TotalStrain2[k,v] := TotalStrainHelper[v]*ScaleFactorTotalStrain;
          if PlasticStrainMapping  then
            PlasticStrain2[k,v] := PlasticStrainHelper[v]*ScaleFactorPlasticStrain;
        end;
      for v := 0 to 2 do
        if DisplacementMapping then
          begin
            Displacements2[k,v] := DisplacementHelper[v]*ScaleFactorDisplacements;
          end;
      if AccumulatedStrainMapping  then
        AccumulatedStrain2[k,0] := AccumulatedStrainHelper*ScaleFactorAccumulatedStrain;
    end;
  distance_in_element := nil;
  nodes_in_element := nil;
  k_coefficient := nil;
end;

procedure DMUEP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

var
  BlockSize: PtrInt;

procedure DMUEPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);

var
  i, j, k: integer;
  distance, avarage_distance, main_distance: real;
  main_element_number: integer;
  BlockStart, BlockEnd: PtrInt;
  
begin
  Item.CalcBlock(Index, BlockSize, length(nodes2), BlockStart, BlockEnd);
  for k := BlockStart to BlockEnd do
    begin
      main_distance := -1;
      for i := 0 to high(elements1) do
        begin
          distance := 0;
          for j := 1 to NodesInElement[i] do
            distance := distance +  sqr(nodes1[elements1[i,j]-1,1] - nodes2[k,1]) + sqr(nodes1[elements1[i,j]-1,2] - nodes2[k,2]) + sqr(nodes1[elements1[i,j]-1,3] - nodes2[k,3]);
          avarage_distance := distance / NodesInElement[i];
          if (main_distance > avarage_distance) or (main_distance = -1) then
            begin
              main_distance := avarage_distance;
              main_element_number := elements1[i,0] - 1;
            end;
        end;
      DMUECopyResults(
        k,
        main_element_number,
        ScaleFactorStress,
        ScaleFactorDisplacements,
        ScaleFactorTotalStrain,
        ScaleFactorPlasticStrain,
        ScaleFactorAccumulatedStrain,
        nodes1,
        nodes2,
        Elements1,
        NodesInElement,
        Stress1,
        Displacements1,
        TotalStrain1,
        PlasticStrain1,
        AccumulatedStrain1,
        Stress2,
        StressMapping,
        Displacements2,
        DisplacementMapping,
        TotalStrain2,
        TotalStrainMapping,
        PlasticStrain2,
        PlasticStrainMapping,
        AccumulatedStrain2,
        AccumulatedStrainMapping
      );
    end;
end;

var
  BlockCount: PtrInt;

begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);
  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@DMUEPar, 0, BlockCount - 1, nil);
end;

procedure DMUEPG(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const Elements1Idx: GridIndex;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);

var
  BlockSize: PtrInt;

procedure DMUEPar(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);
var
  main_distance: real;
  main_element_number: integer;

procedure FindNearestElement(I: integer);
var
  examined: array of boolean;
  examinedOne: boolean;
  examinedBuckets: array of boolean;

procedure SearchBucket(Bucket: BucketPtr);
var
  k, j: integer;
  e: Element;
  distance, avarage_distance: real;

begin
  if not examinedBuckets[Bucket^.ID] then
    begin
      for k := 0 to Bucket^.Len - 1 do
        begin
          e := Bucket^.Elements[k];
{
          if not examined[e] then
            begin
}
              distance := 0;
              for j := 1 to NodesInElement[e] do
                distance := distance +  sqr(nodes1[elements1[e,j]-1,1] - nodes2[I,1]) + sqr(nodes1[elements1[e,j]-1,2] - nodes2[I,2]) + sqr(nodes1[elements1[e,j]-1,3] - nodes2[I,3]);
              avarage_distance := distance / NodesInElement[e];
              if (main_distance > avarage_distance) or (main_distance = -1) then
                begin
                  main_distance := avarage_distance;
                  main_element_number := elements1[e,0] - 1;
                end;
{
              examined[e] := true;
}
              examinedOne := true;
{
            end;
}
        end;
      examinedBuckets[Bucket^.ID] := true;
    end;
end;

procedure SearchXPlane(X, Y1, Y2, Z1, Z2: integer);
var
  j, k: integer;
begin
  for j := Y1 to Y2 do
    for k := Z1 to Z2 do
      SearchBucket(Elements1Idx.Grid[X, j, k]);
end;

procedure SearchYPlane(Y, X1, X2, Z1, Z2: integer);
var
  i, k: integer;
begin
  for i := X1 to X2 do
    for k := Z1 to Z2 do
      SearchBucket(Elements1Idx.Grid[i, Y, k]);
end;

procedure SearchZPlane(Z, X1, X2, Y1, Y2: integer);
var
  i, j: integer;
begin
  for i := X1 to X2 do
    for j := Y1 to Y2 do
      SearchBucket(Elements1Idx.Grid[i, j, Z]);
end;

var
  p, j: integer;
  x, y, z: integer;
  withinLimits: boolean;

begin
  WriteLn('Searching for the nearest element to node ', I, '...');
  WriteLn('x = ', nodes2[I,1], ', y = ', nodes2[I,2], ', z = ', nodes2[I,3]);
  SetLength(examinedBuckets, Elements1Idx.NumBuckets - 1);
  for j := 0 to high(examinedBuckets) do
    examinedBuckets[j] := false;
  examinedOne := false;
{
  SetLength(examined, high(Elements1) + 1);
  for j := 0 to high(examined) do
    examined[j] := false;
}
  x := FindPos(nodes2[I,1], Elements1Idx.MinX, Elements1Idx.XSize, Elements1Idx.RangeX);
  y := FindPos(nodes2[I,2], Elements1Idx.MinY, Elements1Idx.YSize, Elements1Idx.RangeY);
  z := FindPos(nodes2[I,3], Elements1Idx.MinZ, Elements1Idx.ZSize, Elements1Idx.RangeZ);
  WriteLn('Location in index: i = ', x, ', j = ', y, ', k = ', z);
  SearchBucket(Elements1Idx.Grid[x,y,z]);
  p := 1;
  withinLimits := true;
  while withinLimits and ((p <= 3) or not examinedOne) do
    begin
      withinLimits := false;
      if x - p >= 0 then
        begin
          SearchXPlane(x - p, max(y - p, 0), min(y + p, Elements1Idx.YSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
          withinLimits := true;
        end;
      if x + p < Elements1Idx.XSize then
        begin
          SearchXPlane(x + p, max(y - p, 0), min(y + p, Elements1Idx.YSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
          withinLimits := true;
        end;
      if y - p >= 0 then
        begin
          SearchYPlane(y - p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
          withinLimits := true;
        end;
      if y + p < Elements1Idx.YSize then
        begin
          SearchYPlane(y + p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(z - p, 0), min(z + p, Elements1Idx.ZSize - 1));
          withinLimits := true;
        end;
      if z - p >= 0 then
        begin
          SearchZPlane(z - p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(y - p, 0), min(y + p, Elements1Idx.YSize - 1));
          withinLimits := true;
        end;
      if z + p < Elements1Idx.ZSize then
        begin
          SearchZPlane(z + p, max(x - p, 0), min(x + p, Elements1Idx.XSize - 1), max(y - p, 0), min(y + p, Elements1Idx.YSize - 1));
          withinLimits := true;
        end;
      p := p + 1;
    end;
end;

var
  k: integer;
  BlockStart, BlockEnd: PtrInt;
  
begin
  Item.CalcBlock(Index, BlockSize, length(nodes2), BlockStart, BlockEnd);
  for k := BlockStart to BlockEnd do
    begin
      main_distance := -1;
      FindNearestElement(k);
      DMUECopyResults(
        k,
        main_element_number,
        ScaleFactorStress,
        ScaleFactorDisplacements,
        ScaleFactorTotalStrain,
        ScaleFactorPlasticStrain,
        ScaleFactorAccumulatedStrain,
        nodes1,
        nodes2,
        Elements1,
        NodesInElement,
        Stress1,
        Displacements1,
        TotalStrain1,
        PlasticStrain1,
        AccumulatedStrain1,
        Stress2,
        StressMapping,
        Displacements2,
        DisplacementMapping,
        TotalStrain2,
        TotalStrainMapping,
        PlasticStrain2,
        PlasticStrainMapping,
        AccumulatedStrain2,
        AccumulatedStrainMapping
      );
    end;
end;

var
  BlockCount: PtrInt;

begin
  if StressMapping  then
    SetLength(Stress2,high(nodes2)+1,6);
  if DisplacementMapping then
    SetLength(Displacements2,high(nodes2)+1,3);
  if TotalStrainMapping  then
    SetLength(TotalStrain2,high(nodes2)+1,6);
  if PlasticStrainMapping  then
    SetLength(PlasticStrain2,high(nodes2)+1,6);
  if AccumulatedStrainMapping  then
    SetLength(AccumulatedStrain2,high(nodes2)+1,1);
  ProcThreadPool.CalcBlockSize(length(nodes2), BlockCount, BlockSize);
  ProcThreadPool.DoParallelLocalProc(@DMUEPar, 0, BlockCount - 1, nil);
end;

 procedure DMUFP(const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);
 var
  i1,j1,k1,l1,f,br,v : integer;
  which_quadrant : integer;
  ixat_solation : integer;
  quadr : array [0..7] of  real;
  quadr_sum : real;
  q_k : array [0..7] of real;
  q_k_sum :real;
  q_stress: array of real;
  closest_node : array [0..7] of integer;
  initial : real;
  StressAverage,PlasticStrainAverage,TotalStrainAverage: array [0..5] of real;
  DisplacementsAverage : array [0..2] of real;
  AccumulatedStrainAverage : real;
  StressZero,PlasticStrainZero,TotalStrainZero : array [0..5] of real;
  DisplacementsZero: array [0..2] of real;
  AccumulatedStrainZero : real;
  if_coincide : boolean;
 begin


  if StressMapping  then
  SetLength(Stress2,high(nodes2)+1,6);


  if DisplacementMapping then
  SetLength(Displacements2,high(nodes2)+1,3);

  if TotalStrainMapping  then
  SetLength(TotalStrain2,high(nodes2)+1,6);

  if PlasticStrainMapping  then
  SetLength(PlasticStrain2,high(nodes2)+1,6);

  if AccumulatedStrainMapping  then
  SetLength(AccumulatedStrain2,high(nodes2)+1,1);


    for i1 := low(nodes2) to high(nodes2) do
      begin
      if_coincide := false;
      for f:= 0 to 7 do
        begin
          quadr[f] := -1;
          closest_node[f] := -1 ;
        end;
       for j1 := low(nodes1) to high(nodes1) do
        begin
                if (nodes1[j1,1] = nodes2[i1,1]) and (nodes1[j1,2] = nodes2[i1,2]) and(nodes1[j1,3] = nodes2[i1,3]) then
                  begin
                    which_quadrant := 0; //-,-,-
                  end
                else if (nodes1[j1,1] <= nodes2[i1,1]) and (nodes1[j1,2] <= nodes2[i1,2]) and(nodes1[j1,3] <= nodes2[i1,3]) then
                  begin
                    which_quadrant := 1; //-,-,-
                  end
                else if (nodes1[j1,1] > nodes2[i1,1]) and (nodes1[j1,2] < nodes2[i1,2]) and(nodes1[j1,3] < nodes2[i1,3]) then
                  begin
                    which_quadrant := 2; //+,-,-
                  end
                else if (nodes1[j1,1] >= nodes2[i1,1]) and (nodes1[j1,2] <= nodes2[i1,2]) and(nodes1[j1,3] >= nodes2[i1,3]) then
                  begin
                    which_quadrant := 3; //+,-,+
                  end
                else if (nodes1[j1,1]< nodes2[i1,1]) and (nodes1[j1,2] < nodes2[i1,2]) and(nodes1[j1,3] > nodes2[i1,3]) then
                  begin
                    which_quadrant := 4; //-,-,+
                  end
                else if (nodes1[j1,1] <= nodes2[i1,1]) and (nodes1[j1,2] >= nodes2[i1,2]) and(nodes1[j1,3] <= nodes2[i1,3]) then
                  begin
                    which_quadrant := 5; //-,+,-
                  end
                else if (nodes1[j1,1]> nodes2[i1,1]) and (nodes1[j1,2] > nodes2[i1,2]) and(nodes1[j1,3] < nodes2[i1,3]) then
                  begin
                    which_quadrant := 6; //+,+,-
                  end
                else if (nodes1[j1,1]>= nodes2[i1,1]) and (nodes1[j1,2] >= nodes2[i1,2]) and(nodes1[j1,3] >= nodes2[i1,3]) then
                  begin
                    which_quadrant := 7; //+,+,+
                  end
                else
                  begin
                    which_quadrant := 8; //-,+,+
                  end;
        initial := sqr(nodes2[i1,1]- nodes1[j1,1]) + sqr(nodes2[i1,2]-nodes1[j1,2]) + sqr(nodes2[i1,3]-nodes1[j1,3]);
        case which_quadrant of
          0 : begin
              if_coincide := true;
                for v := 0 to 5 do
                begin
                        if Stress2 <> nil then
                        StressZero[v]:= stress1[j1,v];
                        if TotalStrain2 <> nil then
                        TotalStrainZero[v]:= TotalStrain1[j1,v];
                        if PlasticStrain2 <> nil then
                        PlasticStrainZero[v]:= PlasticStrain1[j1,v];
                end;

                for v := 0 to 2 do
                        if Displacements2 <> nil then
                        DisplacementsZero[v]:= Displacements1[j1,v];


               if AccumulatedStrain2 <> nil then
                        AccumulatedStrainZero:= AccumulatedStrain1[j1,0];

              break;
              end;
          1 :
              begin
                if quadr[0] = -1 then
                  begin
                  quadr[0] := initial;
                  closest_node[0] := j1;
                  end
                else if quadr[0] > initial then
                  begin
                  quadr[0] := initial;
                  closest_node[0] := j1;
                  end;
                //break;
              end;
          2 :
              begin
                if quadr[1] = -1 then
                  begin
                  quadr[1] := initial;
                  closest_node[1] := j1;
                  end
                else if quadr[1] > initial then
                  begin
                  quadr[1] := initial;
                  closest_node[1] := j1;
                  end;
                //break;
              end;
          3 :
              begin
                if quadr[2] = -1 then
                  begin
                  quadr[2] := initial;
                  closest_node[2] := j1;
                  end
                else if quadr[2] > initial then
                  begin
                  quadr[2] := initial;
                  closest_node[2] := j1;
                  end;
                //break;
              end;
          4 :
              begin
                if quadr[3] = -1 then
                  begin
                  quadr[3] := initial;
                  closest_node[3] := j1;
                  end
                else if quadr[3] > initial then
                  begin
                  quadr[3] := initial;
                  closest_node[3] := j1;
                  end;
                //break;
              end;
          5 :
              begin
                if quadr[4] = -1 then
                  begin
                  quadr[4] := initial;
                  closest_node[4] := j1;
                  end
                else if quadr[4] > initial then
                  begin
                  quadr[4] := initial;
                  closest_node[4] := j1;
                  end;
                //break;
              end;
          6 :
              begin
                if quadr[5] = -1 then
                  begin
                  quadr[5] := initial;
                  closest_node[5] := j1;
                  end
                else if quadr[5] > initial then
                  begin
                  quadr[5] := initial;
                  closest_node[5] := j1;
                  end;
                //break;
              end;
          7 :
              begin
                if quadr[6] = -1 then
                  begin
                  quadr[6] := initial;
                  closest_node[6] := j1;
                  end
                else if quadr[6] > initial then
                  begin
                  quadr[6] := initial;
                  closest_node[6] := j1;
                  end;
                //break;
              end;
          8 :
              begin
                if quadr[7] = -1 then
                  begin
                  quadr[7] := initial;
                  closest_node[7] := j1;
                  end
                else if quadr[7] > initial then
                  begin
                  quadr[7] := initial;
                  closest_node[7] := j1;
                  end;
                //break;
              end;
          end;
        end;


        for v := 0 to 5 do
        begin
        StressAverage[v] := 0;
        TotalStrainAverage[v] := 0;
        PlasticStrainAverage[v] := 0;
        end;

        for v := 0 to 2 do
        DisplacementsAverage[v] := 0;

        AccumulatedStrainAverage := 0;


      br := -1;
      if if_coincide = true then
        begin
          for v := 0 to 5 do
                begin
                        if StressMapping  then
                        Stress2[i1,v] := StressZero[v]*ScaleFactorStress;
                        if TotalStrainMapping  then
                        TotalStrain2[i1,v] := TotalStrainZero[v]*ScaleFactorTotalStrain;
                        if PlasticStrainMapping  then
                        PlasticStrain2[i1,v] := PlasticStrainZero[v]*ScaleFactorPlasticStrain;
                end;

          for v := 0 to 2 do
                        if DisplacementMapping then
                        Displacements2[i1,v] := DisplacementsZero[v]*ScaleFactorDisplacements;


          if AccumulatedStrainMapping  then
                        AccumulatedStrain2[i1,0] := AccumulatedStrainZero*ScaleFactorAccumulatedStrain;
        end
      else
        begin
          quadr_sum := 0;
          q_k_sum := 0;

          for v := 0 to 5 do
          StressAverage[v] := 0;

          for f:= 0 to 7 do
            begin
              if quadr[f]<>-1 then
                begin
                   quadr_sum := quadr_sum + quadr[f];
                end;
            end;

          for f:= 0 to 7 do
            begin
              if quadr[f]<>-1 then
                   q_k[f] := quadr_sum/quadr[f]
              else
                    q_k[f] := -1;
            end;
          for f:= 0 to 7 do
            begin
              if q_k[f]<>-1 then
                begin
                   q_k_sum := q_k_sum + q_k[f];
                end;
            end;
          for f:= 0 to 7 do
            begin
              if quadr[f]<>-1 then
                begin
                 for v := 0 to 5 do
                   begin
                        if StressMapping  then
                        StressAverage[v] := StressAverage[v] + Stress1[closest_node[f],v]*(q_k[f]/q_k_sum);
                        if TotalStrainMapping  then
                        TotalStrainAverage[v] := TotalStrainAverage[v] + TotalStrain1[closest_node[f],v]*(q_k[f]/q_k_sum);
                        if PlasticStrainMapping  then
                        PlasticStrainAverage[v] := PlasticStrainAverage[v] + PlasticStrain1[closest_node[f],v]*(q_k[f]/q_k_sum);
                   end;

                for v := 0 to 2 do
                        if DisplacementMapping  then
                        DisplacementsAverage[v] := DisplacementsAverage[v] + Displacements1[closest_node[f],v]*(q_k[f]/q_k_sum);


                if AccumulatedStrainMapping  then
                        AccumulatedStrainAverage := AccumulatedStrainAverage + AccumulatedStrain1[closest_node[f],0]*(q_k[f]/q_k_sum);

                end;
            end;
           for v := 0 to 5 do
                begin
                        if StressMapping  then
                        Stress2[i1,v]:= StressAverage[v]*ScaleFactorStress;
                        if TotalStrainMapping then
                        TotalStrain2[i1,v]:= TotalStrainAverage[v]*ScaleFactorTotalStrain;
                        if PlasticStrainMapping  then
                        PlasticStrain2[i1,v]:= PlasticStrainAverage[v]*ScaleFactorPlasticStrain;
                end;

                for v := 0 to 2 do
                        if DisplacementMapping  then
                        Displacements2[i1,v]:= DisplacementsAverage[v]*ScaleFactorDisplacements;


                if AccumulatedStrainMapping  then
                        AccumulatedStrain2[i1,0]:= AccumulatedStrainAverage*ScaleFactorAccumulatedStrain;

        end;
        end;
    end;

 procedure NPM(  const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);
 var
  i1,j1,br,v : integer;
 initial : real;
 less_distance : real;
 StressAverage,PlasticStrainAverage,TotalStrainAverage: array [0..5] of real;
 DisplacementsAverage : array [0..2] of real;
 AccumulatedStrainAverage : real;
 begin

  if StressMapping  then
  SetLength(Stress2,high(nodes2)+1,6);


  if DisplacementMapping then
  SetLength(Displacements2,high(nodes2)+1,3);

  if TotalStrainMapping  then
  SetLength(TotalStrain2,high(nodes2)+1,6);

  if PlasticStrainMapping  then
  SetLength(PlasticStrain2,high(nodes2)+1,6);

  if AccumulatedStrainMapping  then
  SetLength(AccumulatedStrain2,high(nodes2)+1,1);

    for i1 := low(nodes2) to high(nodes2) do
    begin
      less_distance := 999999999999999999;
       for j1 := low(nodes1) to high(nodes1) do
       begin
          initial := sqr(nodes2[i1,1]- nodes1[j1,1]) + sqr(nodes2[i1,2]-nodes1[j1,2]) + sqr(nodes2[i1,3]-nodes1[j1,3]);

            if less_distance >= initial then
            begin
                less_distance := initial;
                for v := 0 to 5 do
                   begin
                        if StressMapping then
                        Stress2[i1,v] := Stress1[j1,v]*ScaleFactorStress;
                        if TotalStrainMapping  then
                        TotalStrain2[i1,v] := TotalStrain1[j1,v]*ScaleFactorTotalStrain;
                        if PlasticStrainMapping  then
                        PlasticStrain2[i1,v] := PlasticStrain1[j1,v]*ScaleFactorPlasticStrain;
                   end;

                for v := 0 to 2 do
                        if DisplacementMapping then
                        begin
                        Displacements2[i1,v] := Displacements1[j1,v]*ScaleFactorDisplacements;
                        end;


                if AccumulatedStrainMapping  then
                        AccumulatedStrain2[i1,0] := AccumulatedStrain1[j1,0]*ScaleFactorAccumulatedStrain;
            end;
       end;

    end;

 end;

procedure  DMUE (const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);
 var i,j,k,l,br,br_,v : integer;
  x0 : real;
  y0 : real;
  z0 : real;
  x0_2 : real;
  y0_2 : real;
  z0_2 : real;
 initial : real;
 distance : real;
 avarage_distance : real;
 avarage_stress : real;
 main_distance : real;
 main_element_number : integer;
 element_number : integer;
 distance_in_element,k_coefficient : TRealArray;
 avarage_distance_in_element,avarage_k_coefficient : real;
 StressHelper, TotalStrainHelper, PlasticStrainHelper : array [0..5] of real;
 DisplacementHelper : array [0..2] of real;
 AccumulatedStrainHelper : real;
 NodeCoincidanceStress,NodeCoincidancePlasticStrain,NodeCoincidanceTotalStrain: array [0..5] of real;
 NodeCoincidanceDisplacement: array [0..2] of real;
 NodeCoincidanceAccumulatedStrain: real;
 nodes_in_element : array of integer;
 exception_for_coinsidance : boolean;
 arg1,arg2,arg3 : real;
 begin

if StressMapping  then
  SetLength(Stress2,high(nodes2)+1,6);


  if DisplacementMapping then
  SetLength(Displacements2,high(nodes2)+1,3);

  if TotalStrainMapping  then
  SetLength(TotalStrain2,high(nodes2)+1,6);

  if PlasticStrainMapping  then
  SetLength(PlasticStrain2,high(nodes2)+1,6);

  if AccumulatedStrainMapping  then
  SetLength(AccumulatedStrain2,high(nodes2)+1,1);

  for k := low(nodes2) to high(nodes2) do
  begin
  main_distance := 2222222222222222222222.12;
    for i := 0 to high(elements1) do
    begin
      distance := 0;
      br := 0;
        for j := 0 to NodesInElement[i] do
        begin
            if (j > 0)then
            begin
              br := br + 1;
              arg1 := sqr(nodes1[elements1[i,j]-1,1] - nodes2[k,1]);
              arg2 := sqr(nodes1[elements1[i,j]-1,2] - nodes2[k,2]);
              arg3 := sqr(nodes1[elements1[i,j]-1,3] - nodes2[k,3]);
              initial := arg1 + arg2 + arg3;
              distance := distance + initial;
            end
            else
            begin
              element_number := elements1[i,j];
            end;
        end;
      avarage_distance := distance/br;
      if main_distance > avarage_distance then
      begin
        main_distance := avarage_distance;
        main_element_number := element_number-1;
      end;

    end;

   for v := 0 to 5 do
   begin
              StressHelper[v] := 0;
              PlasticStrainHelper[v] := 0;
              TotalStrainHelper[v] := 0;
   end;
    for v := 0 to 2 do
    DisplacementHelper[v] := 0;

    AccumulatedStrainHelper := 0;

  br_ := -1;
  for l := 0 to NodesInElement[main_element_number] do
  begin
    if l > 0 then
      begin
      br_ := br_ + 1;
      SetLength(distance_in_element,Length(distance_in_element)+1);
      SetLength(nodes_in_element,Length(nodes_in_element)+1);
      arg1 := sqr(nodes1[elements1[main_element_number,l]-1,1] - nodes2[k,1]);
      arg2 := sqr(nodes1[elements1[main_element_number,l]-1,2] - nodes2[k,2]);
      arg3 := sqr(nodes1[elements1[main_element_number,l]-1,3] - nodes2[k,3]);
      distance_in_element[br_] := arg1 + arg2 + arg3;
      nodes_in_element[br_] := elements1[main_element_number,l]-1;
      end;
  end;
    avarage_distance_in_element := sum_array(distance_in_element);  //this is sum not avarage. do not look the variable name
    exception_for_coinsidance := false;
  for l := low(distance_in_element) to high(distance_in_element) do
    begin
      if distance_in_element[l] = 0 then
        begin
          for v := 0 to 5 do
          begin
              if StressMapping then
              NodeCoincidanceStress[v] := Stress1[nodes_in_element[l],v];
              if PlasticStrainMapping then
              NodeCoincidancePlasticStrain[v] := PlasticStrain1[nodes_in_element[l],v];
              if TotalStrainMapping then
              NodeCoincidanceTotalStrain[v] := TotalStrain1[nodes_in_element[l],v];
          end;
          for v := 0 to 2 do
              if DisplacementMapping then
              NodeCoincidanceDisplacement[v] := Displacements1[nodes_in_element[l],v];

              if AccumulatedStrainMapping then
              NodeCoincidanceAccumulatedStrain := AccumulatedStrain1[nodes_in_element[l],0];

        exception_for_coinsidance := true;
        break;
        end
      else
        begin
          SetLength(k_coefficient,Length(k_coefficient)+1);
          k_coefficient[l] :=  avarage_distance_in_element/distance_in_element[l];
        end;
    end;
  if exception_for_coinsidance then
    begin
                for v := 0 to 5 do
                   begin
                        if StressMapping then
                        Stress2[k,v] := NodeCoincidanceStress[v]*ScaleFactorStress;
                        if TotalStrainMapping  then
                        TotalStrain2[k,v] := NodeCoincidanceTotalStrain[v]*ScaleFactorTotalStrain;
                        if PlasticStrainMapping  then
                        PlasticStrain2[k,v] := NodeCoincidancePlasticStrain[v]*ScaleFactorPlasticStrain;
                   end;

                 for v := 0 to 2 do
                        if DisplacementMapping then
                        Displacements2[k,v] := NodeCoincidanceDisplacement[v]*ScaleFactorDisplacements;


                if AccumulatedStrainMapping  then
                        AccumulatedStrain2[k,0] := NodeCoincidanceAccumulatedStrain*ScaleFactorAccumulatedStrain;

    end
  else
    begin
      avarage_k_coefficient := sum_array(k_coefficient);  //this is sum not avarage. do not look the variable name
      for l := low(k_coefficient) to high(k_coefficient) do
        begin
          for v := 0 to 5 do
          begin
              if StressMapping then
              StressHelper[v] := StressHelper[v] + (k_coefficient[l]/avarage_k_coefficient)*Stress1[nodes_in_element[l],v];
              if PlasticStrainMapping then
              PlasticStrainHelper[v] := PlasticStrainHelper[v] + (k_coefficient[l]/avarage_k_coefficient)*PlasticStrain1[nodes_in_element[l],v];
              if TotalStrainMapping then
              TotalStrainHelper[v] := TotalStrainHelper[v] + (k_coefficient[l]/avarage_k_coefficient)*TotalStrain1[nodes_in_element[l],v];
          end;
          for v := 0 to 2 do
              if DisplacementMapping then
              DisplacementHelper[v] := DisplacementHelper[v] + (k_coefficient[l]/avarage_k_coefficient)*Displacements1[nodes_in_element[l],v];

              if AccumulatedStrainMapping then
              AccumulatedStrainHelper := AccumulatedStrainHelper + (k_coefficient[l]/avarage_k_coefficient)*AccumulatedStrain1[nodes_in_element[l],0];

        end;

                for v := 0 to 5 do
                   begin
                        if StressMapping then
                        Stress2[k,v] := StressHelper[v]*ScaleFactorStress;
                        if TotalStrainMapping  then
                        TotalStrain2[k,v] := TotalStrainHelper[v]*ScaleFactorTotalStrain;
                        if PlasticStrainMapping  then
                        PlasticStrain2[k,v] := PlasticStrainHelper[v]*ScaleFactorPlasticStrain;
                   end;

                 for v := 0 to 2 do
                        if DisplacementMapping then
                        begin
                        Displacements2[k,v] := DisplacementHelper[v]*ScaleFactorDisplacements;
                        end;


                if AccumulatedStrainMapping  then
                        AccumulatedStrain2[k,0] := AccumulatedStrainHelper*ScaleFactorAccumulatedStrain;

    end;
  distance_in_element := nil;
  nodes_in_element := nil;
  k_coefficient := nil;
  end;
end;
procedure MUESF (const ScaleFactorStress : real;
                 const ScaleFactorDisplacements: real;
                 const ScaleFactorTotalStrain: real;
                 const ScaleFactorPlasticStrain: real;
                 const ScaleFactorAccumulatedStrain : real;
                 const nodes1:TRealRealArray;
                 const nodes2:TRealRealArray;
                 const Elements1 : TIntegerIntegerArray;
                 const NodesInElement : array of integer;
                 const Stress1 : TRealRealArray;
                 const Displacements1 : TRealRealArray;
                 const TotalStrain1 : TRealRealArray;
                 const PlasticStrain1 : TRealRealArray;
                 const AccumulatedStrain1 : TRealRealArray;
                 var Stress2 : TRealRealArray;             const StressMapping : boolean;
                 var Displacements2 : TRealRealArray;      const DisplacementMapping : boolean;
                 var TotalStrain2 : TRealRealArray;        const TotalStrainMapping : boolean;
                 var PlasticStrain2 : TRealRealArray;      const PlasticStrainMapping : boolean;
                 var AccumulatedStrain2 : TRealRealArray;  const AccumulatedStrainMapping : boolean);
 var

StressValue,TotalStrainValue,PlasticStrainValue : array [0..5] of real;
DisplacementsValue : array [0..2] of real;
AccumulatedStrainValue : real;
 i,k,v : integer;
 main_element_number : integer;
 cx,cy,cz : array [0..3] of real;
 xn,yn,zn,det : real;
 g,h,r: real;
 cx1,cx2,cx3,cx4,cx5,cx6,cx7,cx8 : real;
 cy1,cy2,cy3,cy4,cy5,cy6,cy7,cy8 : real;
 cz1,cz2,cz3,cz4,cz5,cz6,cz7,cz8 : real;
 f1g,f1h,f1r,f2g,f2h,f2r,f3g,f3h,f3r:real;
 f1,f2,f3 : real;
 sum_z_coord : real;
 a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20 : real;
 g1,g2,g3,g4,g5 : real;
 h1,h2,h3,h4,h5 : real;
 r1,r2,r3,r4,r5 : real;
 gg2,gg4,gg5 : real;
 hh2, hh4, hh5 : real;
 rr4, rr5 : real;
 g_h_r1,g_h_r3 : real;
 condition : boolean;
 cx1cx0, cy2cy0 , cz3cz0 ,cy3cy0,cz2cz0 ,cy1cy0 ,cx2cx0 ,cx3cx0 ,cz1cz0 ,xncx0 ,yncy0 , zncz0  : real;
 ghr: real;
 begin

  if StressMapping  then
  SetLength(Stress2,high(nodes2)+1,6);


  if DisplacementMapping then
  SetLength(Displacements2,high(nodes2)+1,3);

  if TotalStrainMapping  then
  SetLength(TotalStrain2,high(nodes2)+1,6);

  if PlasticStrainMapping  then
  SetLength(PlasticStrain2,high(nodes2)+1,6);

  if AccumulatedStrainMapping  then
  SetLength(AccumulatedStrain2,high(nodes2)+1,1);

  sum_z_coord := sum_array_col(nodes1,3);

  for k := low(Nodes2) to high(Nodes2) do
  begin
  condition := false;

  //--- Triangular linear and quadratic element --
  g1 := -0.01;
  h1 := -0.01;
  g_h_r1 := 1.01;

  //--- Quadrileteral linear and quadratic element --
  g2 := -1.01;
  gg2 := 1.01;
  h2 := -1.01;
  hh2 := 1.01;

  //-------- Tet linear and quadratic element -------
  g3 := -0.01;
  h3 := -0.01;
  r3 := -0.01;
  g_h_r3 := 1.01;

  //--------- Wedge linear and quadratic element --------
  g4 := -0.01;
  h4 := -0.01;
  r4 := -1.01;
  gg4 := 1.01;
  hh4 := 1.01;
  rr4 := 1.01;

  //------------Hex linear and quadratic elements
  g5 := -1.01;
  h5 := -1.01;
  r5 := -1.01;
  gg5 := 1.01;
  hh5 := 1.01;
  rr5 := 1.01;

  repeat
        for i := 0 to high(elements1) do
        begin
           //--------------------- Triangular linear and quadratic element -------------------------
                if (sum_z_coord=0) and ((NodesInElement[i] = 3)or(NodesInElement[i] = 6)) then
                begin

                cx[0] := Nodes1[elements1[i,1]-1,1];
                cx[1] := Nodes1[elements1[i,2]-1,1];
                cx[2] := Nodes1[elements1[i,3]-1,1];

                cy[0] := Nodes1[elements1[i,1]-1,2];
                cy[1] := Nodes1[elements1[i,2]-1,2];
                cy[2] := Nodes1[elements1[i,3]-1,2];


                xn := Nodes2[k,1];
                yn := Nodes2[k,2];


                det := ((cx[1]-cx[0])*(cy[2]-cy[0])-(cx[2]-cx[0])*(cy[1]-cy[0]));
                g := ((xn-cx[0])*(cy[2]-cy[0])-(cx[2]-cx[0])*(yn-cy[0]))/det;
                h := ((cx[1]-cx[0])*(yn-cy[0])-(xn-cx[0])*(cy[1]-cy[0]))/det;

                        if (g>g1)and(h>h1)and(g+h<g_h_r1) then
                        begin
                        main_element_number := elements1[i,0]-1;
                        condition := true;
                        break;
                        end

                        else if i = high(elements1) then
                        begin
                        g1 := g1 - 0.05;
                        h1 := h1 - 0.05;
                        g_h_r1 := g_h_r1 + 0.05;

                        g2 := g2-0.05;
                        h2 := h2 -0.05;
                        gg2 := gg2 + 0.05;
                        hh2 := hh2 + 0.05;
                        end;

                end;
          //--------------------- Quadrileteral linear and quadratic element -------------------------
                if (sum_z_coord=0) and ((NodesInElement[i] = 4)or(NodesInElement[i] = 8)) then
                begin
                cx1 := Nodes1[elements1[i,1]-1,1];
                cx2 := Nodes1[elements1[i,2]-1,1];
                cx3 := Nodes1[elements1[i,3]-1,1];
                cx4 := Nodes1[elements1[i,4]-1,1];


                cy1 := Nodes1[elements1[i,1]-1,2];
                cy2 := Nodes1[elements1[i,2]-1,2];
                cy3 := Nodes1[elements1[i,3]-1,2];
                cy4 := Nodes1[elements1[i,4]-1,2];


                f1 := - cx1 - cx2 - cx3 - cx4 + 4*Nodes2[k,1];
                f2 := - cy1 - cy2 - cy3 - cy4 + 4*Nodes2[k,2];


                f1g := -cx1 + cx2 + cx3 - cx4;
                f1h := -cx1 - cx2 + cx3 + cx4;

                f2g := -cy1 + cy2 + cy3 - cy4;
                f2h := -cy1 - cy2 + cy3 + cy4;

                Det := f1g*f2h-f1h*f2g;
                g := (f1*f2h-f1h*f2)/Det;
                h := (f1g*f2-f1*f2g)/Det;

                        if (g>g2)and(g<gg2)and(h>h2)and(h<hh2)then
                        begin
                        main_element_number := elements1[i,0]-1;
                        condition := true;
                        break;
                        end

                        else if i = high(elements1) then
                        begin
                        g1 := g1 - 0.05;
                        h1 := h1 - 0.05;
                        g_h_r1 := g_h_r1 + 0.05;

                        g2 := g2-0.05;
                        h2 := h2 -0.05;
                        gg2 := gg2 + 0.05;
                        hh2 := hh2 + 0.05;
                        end;

                end;
          //--------------------- Tet linear and quadratic element -------------------------
                if (sum_z_coord<>0) and ((NodesInElement[i] = 4)or(NodesInElement[i] = 10)) then
                begin

                cx[0] := Nodes1[elements1[i,1]-1,1];
                cx[1] := Nodes1[elements1[i,2]-1,1];
                cx[2] := Nodes1[elements1[i,3]-1,1];
                cx[3] := Nodes1[elements1[i,4]-1,1];

                cy[0] := Nodes1[elements1[i,1]-1,2];
                cy[1] := Nodes1[elements1[i,2]-1,2];
                cy[2] := Nodes1[elements1[i,3]-1,2];
                cy[3] := Nodes1[elements1[i,4]-1,2];

                cz[0] := Nodes1[elements1[i,1]-1,3];
                cz[1] := Nodes1[elements1[i,2]-1,3];
                cz[2] := Nodes1[elements1[i,3]-1,3];
                cz[3] := Nodes1[elements1[i,4]-1,3];

                xn := Nodes2[k,1];
                yn := Nodes2[k,2];
                zn := Nodes2[k,3];

                cx1cx0 :=  cx[1]-cx[0];
                cy2cy0 :=  cy[2]-cy[0];
                cz3cz0 :=  cz[3]-cz[0];
                cy3cy0 :=  cy[3]-cy[0];
                cz2cz0 :=  cz[2]-cz[0];
                cy1cy0 := cy[1]-cy[0];
                cx2cx0 := cx[2]-cx[0];
                cx3cx0 := cx[3]-cx[0];
                cz1cz0 := cz[1]-cz[0];

                xncx0  := xn-cx[0];
                yncy0  := yn-cy[0];
                zncz0  := zn-cz[0];

                det := cx1cx0*cy2cy0*cz3cz0 - cx1cx0*cy3cy0*cz2cz0 - cy1cy0*cx2cx0*cz3cz0 + cy1cy0*cx3cx0*cz2cz0 + cz1cz0*cx2cx0*cy3cy0 - cz1cz0*cx3cx0*cy2cy0;
                g := (xncx0*cy2cy0*cz3cz0 - xncx0*cy3cy0*cz2cz0 - yncy0*cx2cx0*cz3cz0 + yncy0*cx3cx0*cz2cz0 + zncz0*cx2cx0*cy3cy0 - zncz0*cx3cx0*cy2cy0)/det;
                h := (cx1cx0*yncy0*cz3cz0 - cx1cx0*cy3cy0*zncz0 - cy1cy0*xncx0*cz3cz0 + cy1cy0*cx3cx0*zncz0 + cz1cz0*xncx0*cy3cy0 - cz1cz0*cx3cx0*yncy0)/det;
                r := (cx1cx0*cy2cy0*zncz0 - cx1cx0*yncy0*cz2cz0 - cy1cy0*cx2cx0*zncz0 + cy1cy0*xncx0*cz2cz0 + cz1cz0*cx2cx0*yncy0 - cz1cz0*xncx0*cy2cy0)/det;

                        if (g>g3)and(h>h3)and(r>r3)and(g+h+r<g_h_r3) then
                        begin
                        main_element_number := elements1[i,0]-1;
                        condition := true;
                        break;
                        end

                        else if i = high(elements1) then
                        begin
                        g3 := g3-0.05;
                        h3 := h3 -0.05;
                        r3 := r3 -0.05;
                        g_h_r3 := g_h_r3 + 0.05;

                        g4 := g4 - 0.05;
                        h4 := h4 - 0.05;
                        r4 := r4 - 0.05;
                        gg4 := gg4 + 0.05;
                        hh4 := hh4 + 0.05;
                        rr4 := rr4 + 0.05;

                        g5 := g5 - 0.05;
                        h5 := h5 - 0.05;
                        r5 := r5 - 0.05;
                        gg5 := gg5 + 0.05;
                        hh5 := hh5 + 0.05;
                        rr5 := rr5 + 0.05;
                        end;
                end;

                //--------------------- Wedge linear and quadratic element -------------------------
                if (sum_z_coord<>0) and ((NodesInElement[i] = 6)or(NodesInElement[i] = 15)) then
                begin
                cx1 := Nodes1[elements1[i,1]-1,1];
                cx2 := Nodes1[elements1[i,2]-1,1];
                cx3 := Nodes1[elements1[i,3]-1,1];
                cx4 := Nodes1[elements1[i,4]-1,1];
                cx5 := Nodes1[elements1[i,5]-1,1];
                cx6 := Nodes1[elements1[i,6]-1,1];


                cy1 := Nodes1[elements1[i,1]-1,2];
                cy2 := Nodes1[elements1[i,2]-1,2];
                cy3 := Nodes1[elements1[i,3]-1,2];
                cy4 := Nodes1[elements1[i,4]-1,2];
                cy5 := Nodes1[elements1[i,5]-1,2];
                cy6 := Nodes1[elements1[i,6]-1,2];


                cz1 := Nodes1[elements1[i,1]-1,3];
                cz2 := Nodes1[elements1[i,2]-1,3];
                cz3 := Nodes1[elements1[i,3]-1,3];
                cz4 := Nodes1[elements1[i,4]-1,3];
                cz5 := Nodes1[elements1[i,5]-1,3];
                cz6 := Nodes1[elements1[i,6]-1,3];


                f1 := -(0.25*(cx2 + cx3) +  0.75*(cx5 + cx6) - 2*Nodes2[k,1]);
                f2 := -(0.25*(cy2 + cy3) +  0.75*(cy5 + cy6) - 2*Nodes2[k,2]);
                f3 := -(0.25*(cz2 + cz3) +  0.75*(cz5 + cz6) - 2*Nodes2[k,3]);


                f1g := -cx1 + cx2 - cx4 + cx5;
                f1h := -cx1 + cx3 - cx4 + cx6;
                f1r :=  0.5*(- cx2 - cx3 + cx5 + cx6);

                f2g := -cy1 + cy2 - cy4 + cy5;
                f2h := -cy1 + cy3 - cy4 + cy6;
                f2r := 0.5*(-cy2 - cy3 + cy5 + cy6);

                f3g := -cz1 + cz2 - cz4 + cz5;
                f3h := -cz1 + cz3 - cz4 + cz6;
                f3r := 0.5*(-cz2 - cz3 +  cz5 + cz6);

                det := f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h;
                g :=  (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det;
                h :=  (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det;
                r :=  (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det;

                        if (g>g4)and(g<gg4)and(h>h4)and(h<hh4)and(r>r4)and(r<rr4) then
                        begin
                        main_element_number := elements1[i,0]-1;
                        condition := true;
                        break;
                        end

                        else if i = high(elements1) then
                        begin
                        g3 := g3-0.05;
                        h3 := h3 -0.05;
                        r3 := r3 -0.05;
                        g_h_r3 := g_h_r3 + 0.05;

                        g4 := g4 - 0.05;
                        h4 := h4 - 0.05;
                        r4 := r4 - 0.05;
                        gg4 := gg4 + 0.05;
                        hh4 := hh4 + 0.05;
                        rr4 := rr4 + 0.05;

                        g5 := g5 - 0.05;
                        h5 := h5 - 0.05;
                        r5 := r5 - 0.05;
                        gg5 := gg5 + 0.05;
                        hh5 := hh5 + 0.05;
                        rr5 := rr5 + 0.05;
                        end;
                end;
                 //--------------------- Wedge linear and quadratic element -------------------------
                if (sum_z_coord<>0) and ((NodesInElement[i] = 8)or(NodesInElement[i] = 20)) then
                begin
                cx1 := Nodes1[elements1[i,1]-1,1];
                cx2 := Nodes1[elements1[i,2]-1,1];
                cx3 := Nodes1[elements1[i,3]-1,1];
                cx4 := Nodes1[elements1[i,4]-1,1];
                cx5 := Nodes1[elements1[i,5]-1,1];
                cx6 := Nodes1[elements1[i,6]-1,1];
                cx7 := Nodes1[elements1[i,7]-1,1];
                cx8 := Nodes1[elements1[i,8]-1,1];

                cy1 := Nodes1[elements1[i,1]-1,2];
                cy2 := Nodes1[elements1[i,2]-1,2];
                cy3 := Nodes1[elements1[i,3]-1,2];
                cy4 := Nodes1[elements1[i,4]-1,2];
                cy5 := Nodes1[elements1[i,5]-1,2];
                cy6 := Nodes1[elements1[i,6]-1,2];
                cy7 := Nodes1[elements1[i,7]-1,2];
                cy8 := Nodes1[elements1[i,8]-1,2];

                cz1 := Nodes1[elements1[i,1]-1,3];
                cz2 := Nodes1[elements1[i,2]-1,3];
                cz3 := Nodes1[elements1[i,3]-1,3];
                cz4 := Nodes1[elements1[i,4]-1,3];
                cz5 := Nodes1[elements1[i,5]-1,3];
                cz6 := Nodes1[elements1[i,6]-1,3];
                cz7 := Nodes1[elements1[i,7]-1,3];
                cz8 := Nodes1[elements1[i,8]-1,3];

                f1 := -cx1 - cx2 - cx3- cx4- cx5-cx6 - cx7- cx8 + 8*Nodes2[k,1];
                f2 := -cy1 - cy2 - cy3- cy4- cy5- cy6- cy7- cy8 + 8*Nodes2[k,2];
                f3 := -cz1 - cz2 - cz3- cz4- cz5- cz6- cz7- cz8 + 8*Nodes2[k,3];


                f1g := -cx1 + cx2 + cx3 - cx4 - cx5 + cx6 + cx7 - cx8;
                f1h := -cx1 - cx2 + cx3 + cx4 - cx5 - cx6 + cx7 + cx8;
                f1r := -cx1 - cx2 - cx3 - cx4 + cx5 + cx6 + cx7 + cx8;

                f2g := -cy1 + cy2 + cy3 - cy4 - cy5 + cy6 + cy7 - cy8;
                f2h := -cy1 - cy2 + cy3 + cy4 - cy5 - cy6 + cy7 + cy8;
                f2r := -cy1 - cy2 - cy3 - cy4 + cy5 + cy6 + cy7 + cy8;

                f3g := -cz1 + cz2 + cz3 - cz4 - cz5 + cz6 + cz7 - cz8;
                f3h := -cz1 - cz2 + cz3 + cz4 - cz5 - cz6 + cz7 + cz8;
                f3r := -cz1 - cz2 - cz3 - cz4 + cz5 + cz6 + cz7 + cz8;

                det := f1g*f2h*f3r-f1g*f2r*f3h-f2g*f1h*f3r+f2g*f1r*f3h+f3g*f1h*f2r-f3g*f1r*f2h;
                g :=  (f1*f2h*f3r-f1*f2r*f3h-f2*f1h*f3r+f2*f1r*f3h+f3*f1h*f2r-f3*f1r*f2h)/det;
                h :=  (f1g*f2*f3r-f1g*f2r*f3-f2g*f1*f3r+f2g*f1r*f3+f3g*f1*f2r-f3g*f1r*f2)/det;
                r := (f1g*f2h*f3-f1g*f2*f3h-f2g*f1h*f3+f2g*f1*f3h+f3g*f1h*f2-f3g*f1*f2h)/det;

                        if (g>g5)and(g<gg5)and(h>h5)and(h<hh5)and(r>r5)and(r<rr5) then
                        begin
                        main_element_number := elements1[i,0]-1;
                        condition := true;
                        break;
                        end

                        else if i = high(elements1) then
                        begin
                        g3 := g3-0.05;
                        h3 := h3 -0.05;
                        r3 := r3 -0.05;
                        g_h_r3 := g_h_r3 + 0.05;

                        g4 := g4 - 0.05;
                        h4 := h4 - 0.05;
                        r4 := r4 - 0.05;
                        gg4 := gg4 + 0.05;
                        hh4 := hh4 + 0.05;
                        rr4 := rr4 + 0.05;

                        g5 := g5 - 0.05;
                        h5 := h5 - 0.05;
                        r5 := r5 - 0.05;
                        gg5 := gg5 + 0.05;
                        hh5 := hh5 + 0.05;
                        rr5 := rr5 + 0.05;
                        end;
                end;

        end;
  until condition = true;
//------------------------------ Linear triangular elements -----------------------------------------------
  if (sum_z_coord=0) and (NodesInElement[main_element_number] = 3)then
  begin
        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := (1-g-h)*Stress1[elements1[main_element_number,1]-1,v] + g*Stress1[elements1[main_element_number,2]-1,v] + h*Stress1[elements1[main_element_number,3]-1,v];
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := (1-g-h)*TotalStrain1[elements1[main_element_number,1]-1,v] + g*TotalStrain1[elements1[main_element_number-1,2],v] + h*TotalStrain1[elements1[main_element_number,3]-1,v];
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := (1-g-h)*PlasticStrain1[elements1[main_element_number,1]-1,v] + g*PlasticStrain1[elements1[main_element_number,2]-1,v] + h*PlasticStrain1[elements1[main_element_number,3]-1,v];
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := (1-g-h)*Displacements1[elements1[main_element_number,1]-1,v] + g*Displacements1[elements1[main_element_number,2]-1,v] + h*Displacements1[elements1[main_element_number,3]-1,v];
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := (1-g-h)*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + g*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + h*AccumulatedStrain1[elements1[main_element_number,3]-1,0];
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;
//------------------------------ Quadratic triangular elements -----------------------------------------------
  if (sum_z_coord=0) and (NodesInElement[main_element_number] = 6)then
  begin

        a1 := 2*(0.5-g-h)*(1-g-h);
        a2 := 2*g*(g-0.5);
        a3 := 2*h*(h-0.5);
        a4 := 4*g*(1-g-h);
        a5 := 4*g*h;
        a6 := 4*h*(1-g-h);


        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := a1*Stress1[elements1[main_element_number,1]-1,v] + a2*Stress1[elements1[main_element_number,2]-1,v] + a3*Stress1[elements1[main_element_number,3]-1,v] + a4*Stress1[elements1[main_element_number,4]-1,v] + a5*Stress1[elements1[main_element_number,5]-1,v]+ a6*Stress1[elements1[main_element_number,6]-1,v];
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := a1*TotalStrain1[elements1[main_element_number,1]-1,v] + a2*TotalStrain1[elements1[main_element_number-1,2],v] + a3*TotalStrain1[elements1[main_element_number,3]-1,v]+ a4*TotalStrain1[elements1[main_element_number,4]-1,v]+ a5*TotalStrain1[elements1[main_element_number,5]-1,v]+ a6*TotalStrain1[elements1[main_element_number,6]-1,v];
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := a1*PlasticStrain1[elements1[main_element_number,1]-1,v] + a2*PlasticStrain1[elements1[main_element_number,2]-1,v] + a3*PlasticStrain1[elements1[main_element_number,3]-1,v]+ a4*PlasticStrain1[elements1[main_element_number,4]-1,v]+ a5*PlasticStrain1[elements1[main_element_number,5]-1,v]+ a6*PlasticStrain1[elements1[main_element_number,6]-1,v];
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;

        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := a1*Displacements1[elements1[main_element_number,1]-1,v] + a2*Displacements1[elements1[main_element_number,2]-1,v] + a3*Displacements1[elements1[main_element_number,3]-1,v]+ a4*Displacements1[elements1[main_element_number,4]-1,v]+ a5*Displacements1[elements1[main_element_number,5]-1,v]+ a6*Displacements1[elements1[main_element_number,6]-1,v];
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := a1*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + a2*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + a3*AccumulatedStrain1[elements1[main_element_number,3]-1,0]+ a4*AccumulatedStrain1[elements1[main_element_number,4]-1,0]+ a5*AccumulatedStrain1[elements1[main_element_number,5]-1,0]+ a6*AccumulatedStrain1[elements1[main_element_number,6]-1,0];
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;
//------------------------------ Linear quadrileteral elements --------------------------------------
  if (sum_z_coord=0) and (NodesInElement[main_element_number] = 4)then
  begin
        a1 := (1-g)*(1-h);
        a2 := (1+g)*(1-h);
        a3 := (1+g)*(1+h);
        a4 := (1-g)*(1+h);

        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := (a1*Stress1[elements1[main_element_number,1]-1,v] + a2*Stress1[elements1[main_element_number,2]-1,v] + a3*Stress1[elements1[main_element_number,3]-1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v])/4;
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := (a1*TotalStrain1[elements1[main_element_number,1]-1,v] + a2*TotalStrain1[elements1[main_element_number,2]-1,v] + a3*TotalStrain1[elements1[main_element_number,3]-1,v]+ a4*TotalStrain1[elements1[main_element_number,4]-1,v])/4;
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := (a1*PlasticStrain1[elements1[main_element_number,1]-1,v] + a2*PlasticStrain1[elements1[main_element_number,2]-1,v] + a3*PlasticStrain1[elements1[main_element_number,3]-1,v]+ a4*PlasticStrain1[elements1[main_element_number,4]-1,v])/4;
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := (a1*Displacements1[elements1[main_element_number,1]-1,v] + a2*Displacements1[elements1[main_element_number,2]-1,v] + a3*Displacements1[elements1[main_element_number,3]-1,v]+ a4*Displacements1[elements1[main_element_number,4]-1,v])/4;
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := (a1*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + a2*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + a3*AccumulatedStrain1[elements1[main_element_number,3]-1,0]+ a4*AccumulatedStrain1[elements1[main_element_number,4]-1,0])/4;
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;

  end;
//------------------------------ Quadratic quadrileteral elements --------------------------------------
  if (sum_z_coord=0) and (NodesInElement[main_element_number] = 8)then
  begin
        a1 := (1-g)*(1-h)*(1+g+h);
        a2 := (1+g)*(1-h)*(1-g+h);
        a3 := (1+g)*(1+h)*(1-g-h);
        a4 := (1-g)*(1+h)*(1+g-h);
        a5 := (1-g)*(1+g)*(1-h);
        a6 := (1-h)*(1+h)*(1+g);
        a7 := (1-g)*(1+g)*(1+h);
        a8 := (1-h)*(1+h)*(1-g);
        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := -0.25*(a1*Stress1[elements1[main_element_number,1]-1,v] + a2*Stress1[elements1[main_element_number,2]-1,v] + a3*Stress1[elements1[main_element_number,3]-1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v]) + 0.5*(a5*Stress1[elements1[main_element_number,5]-1,v] + a6*Stress1[elements1[main_element_number,6]-1,v] + a7*Stress1[elements1[main_element_number,7]-1,v]+ a8*Stress1[elements1[main_element_number,8]-1,v]);
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := -0.25*(a1*TotalStrain1[elements1[main_element_number,1]-1,v] + a2*TotalStrain1[elements1[main_element_number,2]-1,v] + a3*TotalStrain1[elements1[main_element_number,3]-1,v]+ a4*TotalStrain1[elements1[main_element_number,4]-1,v]) + 0.5*(a5*TotalStrain1[elements1[main_element_number,5]-1,v] + a6*TotalStrain1[elements1[main_element_number,6]-1,v] + a7*TotalStrain1[elements1[main_element_number,7]-1,v]+ a8*TotalStrain1[elements1[main_element_number,8]-1,v]);
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := -0.25*(a1*PlasticStrain1[elements1[main_element_number,1]-1,v] + a2*PlasticStrain1[elements1[main_element_number,2]-1,v] + a3*PlasticStrain1[elements1[main_element_number,3]-1,v]+ a4*PlasticStrain1[elements1[main_element_number,4]-1,v])+ 0.5*(a5*PlasticStrain1[elements1[main_element_number,5]-1,v] + a6*PlasticStrain1[elements1[main_element_number,6]-1,v] + a7*PlasticStrain1[elements1[main_element_number,7]-1,v]+ a8*PlasticStrain1[elements1[main_element_number,8]-1,v]);
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := -0.25*(a1*Displacements1[elements1[main_element_number,1]-1,v] + a2*Displacements1[elements1[main_element_number,2]-1,v] + a3*Displacements1[elements1[main_element_number,3]-1,v]+ a4*Displacements1[elements1[main_element_number,4]-1,v])+ 0.5*(a5*Displacements1[elements1[main_element_number,5]-1,v] + a6*Displacements1[elements1[main_element_number,6]-1,v] + a7*Displacements1[elements1[main_element_number,7]-1,v]+ a8*Displacements1[elements1[main_element_number,8]-1,v]);
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := -0.25*(a1*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + a2*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + a3*AccumulatedStrain1[elements1[main_element_number,3]-1,0]+ a4*AccumulatedStrain1[elements1[main_element_number,4]-1,0])+ 0.5*(a5*AccumulatedStrain1[elements1[main_element_number,5]-1,0] + a6*AccumulatedStrain1[elements1[main_element_number,6]-1,0] + a7*AccumulatedStrain1[elements1[main_element_number,7]-1,0]+ a8*AccumulatedStrain1[elements1[main_element_number,8]-1,0]);
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;
//------------------------------ Tet linear elements --------------------------
  if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 4)then
  begin
        ghr := (1-g-h-r);
        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := ghr*Stress1[elements1[main_element_number,1]-1,v] + g*stress1[elements1[main_element_number,2]-1,v] + h*stress1[elements1[main_element_number,3]-1,v] + r*stress1[elements1[main_element_number,4]-1,v];
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := ghr*TotalStrain1[elements1[main_element_number,1]-1,v] + g*TotalStrain1[elements1[main_element_number,2]-1,v] + h*TotalStrain1[elements1[main_element_number,3]-1,v] + r*TotalStrain1[elements1[main_element_number,4]-1,v];
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := ghr*PlasticStrain1[elements1[main_element_number,1]-1,v] + g*PlasticStrain1[elements1[main_element_number,2]-1,v] + h*PlasticStrain1[elements1[main_element_number-1,3],v] + r*PlasticStrain1[elements1[main_element_number,4]-1,v];
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := ghr*Displacements1[elements1[main_element_number,1]-1,v] + g*Displacements1[elements1[main_element_number,2]-1,v] + h*Displacements1[elements1[main_element_number,3]-1,v] + r*Displacements1[elements1[main_element_number,4]-1,v];
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := ghr*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + g*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + h*AccumulatedStrain1[elements1[main_element_number,3]-1,0] + r*AccumulatedStrain1[elements1[main_element_number,4]-1,0];
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;
//------------------------------ Tet quadratic elements --------------------------
  if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 10)then
  begin
        ghr := 1-g-h-r;
        a1 := (2*ghr-1)*ghr;
        a2 := (2*g-1)*g;
        a3 := (2*h-1)*h;
        a4 := (2*r-1)*r;
        a5 := 4*ghr*g;
        a6 := 4*g*h;
        a7 := 4*ghr*h;
        a8 := 4*ghr*r;
        a9 := 4*g*r;
        a10 := 4*h*r;

        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := a1*Stress1[elements1[main_element_number,1]-1,v] + a2*stress1[elements1[main_element_number,2]-1,v] + a3*stress1[elements1[main_element_number,3]-1,v] + a4*stress1[elements1[main_element_number,4]-1,v] + a5*stress1[elements1[main_element_number,5]-1,v] + a6*stress1[elements1[main_element_number,6]-1,v]+ a7*stress1[elements1[main_element_number,7]-1,v]+ a8*stress1[elements1[main_element_number,8]-1,v]+ a9*stress1[elements1[main_element_number,9]-1,v]+ a10*stress1[elements1[main_element_number,10]-1,v];
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := a1*TotalStrain1[elements1[main_element_number,1]-1,v] + a2*TotalStrain1[elements1[main_element_number,2]-1,v] + a3*TotalStrain1[elements1[main_element_number,3]-1,v] + a4*TotalStrain1[elements1[main_element_number,4]-1,v]+ a5*TotalStrain1[elements1[main_element_number,5]-1,v]+ a6*TotalStrain1[elements1[main_element_number,6]-1,v]+ a7*TotalStrain1[elements1[main_element_number,7]-1,v]+ a8*TotalStrain1[elements1[main_element_number,8]-1,v]+ a9*TotalStrain1[elements1[main_element_number,9]-1,v]+ a10*TotalStrain1[elements1[main_element_number,10]-1,v];
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := a1*PlasticStrain1[elements1[main_element_number,1]-1,v] + a2*PlasticStrain1[elements1[main_element_number,2]-1,v] + a3*PlasticStrain1[elements1[main_element_number-1,3],v] + a4*PlasticStrain1[elements1[main_element_number,4]-1,v]+ a5*PlasticStrain1[elements1[main_element_number,5]-1,v]+ a6*PlasticStrain1[elements1[main_element_number,6]-1,v]+ a7*PlasticStrain1[elements1[main_element_number,7]-1,v]+ a8*PlasticStrain1[elements1[main_element_number,8]-1,v]+ a9*PlasticStrain1[elements1[main_element_number,9]-1,v]+ a10*PlasticStrain1[elements1[main_element_number,10]-1,v];
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := a1*Displacements1[elements1[main_element_number,1]-1,v] + a2*Displacements1[elements1[main_element_number,2]-1,v] + a3*Displacements1[elements1[main_element_number,3]-1,v] + a4*Displacements1[elements1[main_element_number,4]-1,v] + a5*Displacements1[elements1[main_element_number,5]-1,v]+ a6*Displacements1[elements1[main_element_number,6]-1,v] + a7*Displacements1[elements1[main_element_number,7]-1,v]+ a8*Displacements1[elements1[main_element_number,8]-1,v] + a9*Displacements1[elements1[main_element_number,9]-1,v] + a10*Displacements1[elements1[main_element_number,10]-1,v];
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := a1*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + a2*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + a3*AccumulatedStrain1[elements1[main_element_number,3]-1,0] + a4*AccumulatedStrain1[elements1[main_element_number,4]-1,0]+ a5*AccumulatedStrain1[elements1[main_element_number,5]-1,0] + a6*AccumulatedStrain1[elements1[main_element_number,6]-1,0]+ a7*AccumulatedStrain1[elements1[main_element_number,7]-1,0]+ a8*AccumulatedStrain1[elements1[main_element_number,8]-1,0]+ a9*AccumulatedStrain1[elements1[main_element_number,9]-1,0]+ a10*AccumulatedStrain1[elements1[main_element_number,10]-1,0];
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;
//------------------------------ Wedge linear and quadratic elements --------------------------
  if (sum_z_coord<>0) and ((NodesInElement[main_element_number] = 6) or (NodesInElement[main_element_number] = 15)) then
  begin
        a1 := (1-g-h)*(1-r);
        a2 := g*(1-r);
        a3 := h*(1-r);
        a4 := (1-g-h)*(1+r);
        a5 := g*(1+r);
        a6 := h*(1+r);
        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := (a1*Stress1[elements1[main_element_number,1]-1,v] + a2*Stress1[elements1[main_element_number,2]-1,v] + a3*Stress1[elements1[main_element_number,3]-1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v]+ a5*Stress1[elements1[main_element_number,5]-1,v]+ a6*Stress1[elements1[main_element_number,6]-1,v])/2;
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := (a1*TotalStrain1[elements1[main_element_number,1]-1,v] + a2*TotalStrain1[elements1[main_element_number,2]-1,v] + a3*TotalStrain1[elements1[main_element_number,3]-1,v]+ a4*TotalStrain1[elements1[main_element_number,4]-1,v]+ a5*TotalStrain1[elements1[main_element_number,5]-1,v]+ a6*TotalStrain1[elements1[main_element_number,6]-1,v])/2;
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := (a1*PlasticStrain1[elements1[main_element_number,1]-1,v] + a2*PlasticStrain1[elements1[main_element_number,2]-1,v] + a3*PlasticStrain1[elements1[main_element_number,3]-1,v]+ a4*PlasticStrain1[elements1[main_element_number,4]-1,v]+ a5*PlasticStrain1[elements1[main_element_number,5]-1,v]+ a6*PlasticStrain1[elements1[main_element_number,6]-1,v])/2;
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := (a1*Displacements1[elements1[main_element_number,1]-1,v] + a2*Displacements1[elements1[main_element_number,2]-1,v] + a3*Displacements1[elements1[main_element_number,3]-1,v]+ a4*Displacements1[elements1[main_element_number,4]-1,v]+ a5*Displacements1[elements1[main_element_number,5]-1,v]+ a6*Displacements1[elements1[main_element_number,6]-1,v])/2;
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := (a1*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + a2*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + a3*AccumulatedStrain1[elements1[main_element_number,3]-1,0]+ a4*AccumulatedStrain1[elements1[main_element_number,4]-1,0]+ a5*AccumulatedStrain1[elements1[main_element_number,5]-1,0]+ a6*AccumulatedStrain1[elements1[main_element_number,6]-1,0])/2;
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;

//------------------------------ Hex linear elements --------------------------
  if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 8)then
  begin
        a1 := (1-g)*(1-h)*(1-r);
        a2 := (1+g)*(1-h)*(1-r);
        a3 := (1+g)*(1+h)*(1-r);
        a4 := (1-g)*(1+h)*(1-r);
        a5 := (1-g)*(1-h)*(1+r);
        a6 := (1+g)*(1-h)*(1+r);
        a7 := (1+g)*(1+h)*(1+r);
        a8 := (1-g)*(1+h)*(1+r);
        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := (a1*Stress1[elements1[main_element_number,1]-1,v] + a2*Stress1[elements1[main_element_number,2]-1,v] + a3*Stress1[elements1[main_element_number,3]-1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v]+ a5*Stress1[elements1[main_element_number,5]-1,v]+ a6*Stress1[elements1[main_element_number,6]-1,v]+ a7*Stress1[elements1[main_element_number,7]-1,v]+ a8*Stress1[elements1[main_element_number,8]-1,v])/8;
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := (a1*TotalStrain1[elements1[main_element_number,1]-1,v] + a2*TotalStrain1[elements1[main_element_number,2]-1,v] + a3*TotalStrain1[elements1[main_element_number,3]-1,v]+ a4*TotalStrain1[elements1[main_element_number,4]-1,v]+ a5*TotalStrain1[elements1[main_element_number,5]-1,v]+ a6*TotalStrain1[elements1[main_element_number,6]-1,v]+ a7*TotalStrain1[elements1[main_element_number,7]-1,v]+ a8*TotalStrain1[elements1[main_element_number,8]-1,v])/8;
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := (a1*PlasticStrain1[elements1[main_element_number,1]-1,v] + a2*PlasticStrain1[elements1[main_element_number,2]-1,v] + a3*PlasticStrain1[elements1[main_element_number,3]-1,v]+ a4*PlasticStrain1[elements1[main_element_number,4]-1,v]+ a5*PlasticStrain1[elements1[main_element_number,5]-1,v]+ a6*PlasticStrain1[elements1[main_element_number,6]-1,v]+ a7*PlasticStrain1[elements1[main_element_number,7]-1,v]+ a8*PlasticStrain1[elements1[main_element_number,8]-1,v])/8;
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := (a1*Displacements1[elements1[main_element_number,1]-1,v] + a2*Displacements1[elements1[main_element_number,2]-1,v] + a3*Displacements1[elements1[main_element_number,3]-1,v]+ a4*Displacements1[elements1[main_element_number,4]-1,v]+ a5*Displacements1[elements1[main_element_number,5]-1,v]+ a6*Displacements1[elements1[main_element_number,6]-1,v]+ a7*Displacements1[elements1[main_element_number,7]-1,v]+ a8*Displacements1[elements1[main_element_number,8]-1,v])/8;
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := (a1*AccumulatedStrain1[elements1[main_element_number,1]-1,0] + a2*AccumulatedStrain1[elements1[main_element_number,2]-1,0] + a3*AccumulatedStrain1[elements1[main_element_number,3]-1,0]+ a4*AccumulatedStrain1[elements1[main_element_number,4]-1,0]+ a5*AccumulatedStrain1[elements1[main_element_number,5]-1,0]+ a6*AccumulatedStrain1[elements1[main_element_number,6]-1,0]+ a7*AccumulatedStrain1[elements1[main_element_number,7]-1,0]+ a8*AccumulatedStrain1[elements1[main_element_number,8]-1,0])/8;
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;
//------------------------------ Hex quadratic elements --------------------------
  if (sum_z_coord<>0) and (NodesInElement[main_element_number] = 20)then
  begin
        a1 := (1-g)*(1-h)*(1-r)*(2+g+h+r);
        a2 := (1+g)*(1-h)*(1-r)*(2-g+h+r);
        a3 := (1+g)*(1+h)*(1-r)*(2-g-h+r);
        a4 := (1-g)*(1+h)*(1-r)*(2+g-h+r);
        a5 := (1-g)*(1-h)*(1+r)*(2+g+h-r);
        a6 := (1+g)*(1-h)*(1+r)*(2-g+h-r);
        a7 := (1+g)*(1+h)*(1+r)*(2-g-h-r);
        a8 := (1-g)*(1+h)*(1+r)*(2+g-h-r);
        a9 := (1-g)*(1+g)*(1-h)*(1-r);
        a10 := (1-h)*(1+h)*(1+g)*(1-r);
        a11 := (1-g)*(1+g)*(1+h)*(1-r);
        a12 := (1-h)*(1+h)*(1-g)*(1-r);
        a13 := (1-g)*(1+g)*(1-h)*(1+r);
        a14 := (1-h)*(1+h)*(1+g)*(1+r);
        a15 := (1-g)*(1+g)*(1+h)*(1+r);
        a16 := (1-h)*(1+h)*(1-g)*(1+r);
        a17 := (1-r)*(1+r)*(1-g)*(1-h);
        a18 := (1-r)*(1+r)*(1+g)*(1-h);
        a19 := (1-r)*(1+r)*(1+g)*(1+h);
        a20 := (1-r)*(1+r)*(1-g)*(1+h);

        for v := 0 to 5 do
        begin
                if StressMapping then
                begin
                StressValue[v] := -(a1*Stress1[elements1[main_element_number,1]-1,v] + a2*Stress1[elements1[main_element_number,2]-1,v] + a3*Stress1[elements1[main_element_number,3]-1,v]+ a4*Stress1[elements1[main_element_number,4]-1,v] + a5*Stress1[elements1[main_element_number,5]-1,v] + a6*Stress1[elements1[main_element_number,6]-1,v] + a7*Stress1[elements1[main_element_number,7]-1,v] + a8*Stress1[elements1[main_element_number,8]-1,v])/8 +
                                   (a9*Stress1[elements1[main_element_number,9]-1,v] + a10*Stress1[elements1[main_element_number,10]-1,v] + a11*Stress1[elements1[main_element_number,11]-1,v] + a12*Stress1[elements1[main_element_number,12]-1,v] + a13*Stress1[elements1[main_element_number,13]-1,v] + a14*Stress1[elements1[main_element_number,14]-1,v] + a15*Stress1[elements1[main_element_number,15]-1,v] + a16*Stress1[elements1[main_element_number,16]-1,v] + a17*Stress1[elements1[main_element_number,17]-1,v] + a18*Stress1[elements1[main_element_number,18]-1,v] + a19*Stress1[elements1[main_element_number,19]-1,v] + a20*Stress1[elements1[main_element_number,20]-1,v])/4;
                Stress2[k,v] := StressValue[v]*ScaleFactorStress;
                end;

                if TotalStrainMapping then
                begin
                TotalStrainValue[v] := -(a1*TotalStrain1[elements1[main_element_number,1]-1,v] + a2*TotalStrain1[elements1[main_element_number,2]-1,v] + a3*TotalStrain1[elements1[main_element_number,3]-1,v]+ a4*TotalStrain1[elements1[main_element_number,4]-1,v] + a5*TotalStrain1[elements1[main_element_number,5]-1,v] + a6*TotalStrain1[elements1[main_element_number,6]-1,v] + a7*TotalStrain1[elements1[main_element_number,7]-1,v] + a8*TotalStrain1[elements1[main_element_number,8]-1,v])/8 +
                                        (a9*TotalStrain1[elements1[main_element_number,9]-1,v] + a10*TotalStrain1[elements1[main_element_number,10]-1,v] + a11*TotalStrain1[elements1[main_element_number,11]-1,v] + a12*TotalStrain1[elements1[main_element_number,12]-1,v] + a13*TotalStrain1[elements1[main_element_number,13]-1,v] + a14*TotalStrain1[elements1[main_element_number,14]-1,v] + a15*TotalStrain1[elements1[main_element_number,15]-1,v] + a16*TotalStrain1[elements1[main_element_number,16]-1,v] + a17*TotalStrain1[elements1[main_element_number,17]-1,v] + a18*TotalStrain1[elements1[main_element_number,18]-1,v] + a19*TotalStrain1[elements1[main_element_number,19]-1,v] + a20*TotalStrain1[elements1[main_element_number,20]-1,v])/4;
                TotalStrain2[k,v] := TotalStrainValue[v]*ScaleFactorTotalStrain;
                end;

                if PlasticStrainMapping then
                begin
                PlasticStrainValue[v] := -(a1*PlasticStrain1[elements1[main_element_number,1]-1,v] + a2*PlasticStrain1[elements1[main_element_number,2]-1,v] + a3*PlasticStrain1[elements1[main_element_number,3]-1,v]+ a4*PlasticStrain1[elements1[main_element_number,4]-1,v] + a5*PlasticStrain1[elements1[main_element_number,5]-1,v] + a6*PlasticStrain1[elements1[main_element_number,6]-1,v] + a7*PlasticStrain1[elements1[main_element_number,7]-1,v] + a8*PlasticStrain1[elements1[main_element_number,8]-1,v])/8 +
                                          (a9*PlasticStrain1[elements1[main_element_number,9]-1,v] + a10*PlasticStrain1[elements1[main_element_number,10]-1,v] + a11*PlasticStrain1[elements1[main_element_number,11]-1,v] + a12*PlasticStrain1[elements1[main_element_number,12]-1,v] + a13*PlasticStrain1[elements1[main_element_number,13]-1,v] + a14*PlasticStrain1[elements1[main_element_number,14]-1,v] + a15*TotalStrain1[elements1[main_element_number,15]-1,v] + a16*PlasticStrain1[elements1[main_element_number,16]-1,v] + a17*PlasticStrain1[elements1[main_element_number,17]-1,v] + a18*PlasticStrain1[elements1[main_element_number,18]-1,v] + a19*PlasticStrain1[elements1[main_element_number,19]-1,v] + a20*PlasticStrain1[elements1[main_element_number,20]-1,v])/4;
                PlasticStrain2[k,v] := PlasticStrainValue[v]*ScaleFactorPlasticStrain;
                end;
        end;

        if DisplacementMapping then
        for v := 0 to 2 do
        begin
                DisplacementsValue[v] := -(a1*Displacements1[elements1[main_element_number,1]-1,v] + a2*Displacements1[elements1[main_element_number,2]-1,v] + a3*Displacements1[elements1[main_element_number,3]-1,v]+ a4*Displacements1[elements1[main_element_number,4]-1,v] + a5*Displacements1[elements1[main_element_number,5]-1,v] + a6*Displacements1[elements1[main_element_number,6]-1,v] + a7*Displacements1[elements1[main_element_number,7]-1,v] + a8*Displacements1[elements1[main_element_number,8]-1,v])/8 +
                                          (a9*Displacements1[elements1[main_element_number,9]-1,v] + a10*Displacements1[elements1[main_element_number,10]-1,v] + a11*Displacements1[elements1[main_element_number,11]-1,v] + a12*Displacements1[elements1[main_element_number,12]-1,v] + a13*Displacements1[elements1[main_element_number,13]-1,v] + a14*Displacements1[elements1[main_element_number,14]-1,v] + a15*Displacements1[elements1[main_element_number,15]-1,v] + a16*Displacements1[elements1[main_element_number,16]-1,v] + a17*Displacements1[elements1[main_element_number,17]-1,v] + a18*Displacements1[elements1[main_element_number,18]-1,v] + a19*Displacements1[elements1[main_element_number,19]-1,v] + a20*Displacements1[elements1[main_element_number,20]-1,v])/4;
                Displacements2[k,v] := DisplacementsValue[v]*ScaleFactorDisplacements;
        end;

        if AccumulatedStrainMapping then
        begin
                AccumulatedStrainValue := -(a1*AccumulatedStrain1[elements1[main_element_number,1]-1,v] + a2*AccumulatedStrain1[elements1[main_element_number,2]-1,v] + a3*AccumulatedStrain1[elements1[main_element_number,3]-1,v]+ a4*AccumulatedStrain1[elements1[main_element_number,4]-1,v] + a5*AccumulatedStrain1[elements1[main_element_number,5]-1,v] + a6*AccumulatedStrain1[elements1[main_element_number,6]-1,v] + a7*AccumulatedStrain1[elements1[main_element_number,7]-1,v] + a8*AccumulatedStrain1[elements1[main_element_number,8]-1,v])/8 +
                                           (a9*AccumulatedStrain1[elements1[main_element_number,9]-1,v] + a10*AccumulatedStrain1[elements1[main_element_number,10]-1,v] + a11*AccumulatedStrain1[elements1[main_element_number,11]-1,v] + a12*AccumulatedStrain1[elements1[main_element_number,12]-1,v] + a13*AccumulatedStrain1[elements1[main_element_number,13]-1,v] + a14*AccumulatedStrain1[elements1[main_element_number,14]-1,v] + a15*AccumulatedStrain1[elements1[main_element_number,15]-1,v] + a16*AccumulatedStrain1[elements1[main_element_number,16]-1,v] + a17*AccumulatedStrain1[elements1[main_element_number,17]-1,v] + a18*AccumulatedStrain1[elements1[main_element_number,18]-1,v] + a19*AccumulatedStrain1[elements1[main_element_number,19]-1,v] + a20*AccumulatedStrain1[elements1[main_element_number,20]-1,v])/4;
                AccumulatedStrain2[k,0] := AccumulatedStrainValue*ScaleFactorAccumulatedStrain;
        end;
  end;


  end;
end;


procedure convert_coordinates(var nodes2 : TRealRealArray;
                              const nodes1 : TRealRealArray;
                              const elements1: TIntegerIntegerArray);
var
x,y,z : real;
br,i,j : integer;
begin
    nodes2 := nil;
    SetLength(nodes2,high(elements1)+1,4);
  for i := 0 to high(elements1) do
  begin
    x := 0;
    y := 0;
    z := 0;
    br := 0;

        for j := 0 to high(elements1[i]) do
        begin
          if j > 0 then
          begin
                if elements1[i,j]<>0 then
                begin
                x := x + nodes1[elements1[i,j]-1,1];
                y := y + nodes1[elements1[i,j]-1,2];
                z := z + nodes1[elements1[i,j]-1,3];
                br := br + 1;
                end;
          end;
        end;
    nodes2[i,0] := i+1;
    nodes2[i,1] := x/br;
    nodes2[i,2] := y/br;
    nodes2[i,3] := z/br;
  end;
end;

 procedure obtain_nodes_in_element(const Elements : TIntegerIntegerArray; var NodesInElement : TIntegerArray);
 var
 i,j,br : integer;
 begin
      SetLength(NodesInElement,length(Elements));
      for i := 0 to high(Elements) do
      begin
      br := 0;
       for j := 0 to high(Elements[i]) do
         begin
         if (j>0) and (Elements[i,j] <> 0) then
         br := br + 1;
         end;
      NodesInElement[i] := br;
      end;
 end;
end.
