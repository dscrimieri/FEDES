unit Grid;

interface

uses Scale, type_of_model;

type
  Node = longint;
  Element = longint;

  Bucket = record
    ID: longint;
    Nodes: array of Node;
    Elements: array of Element;
    Len: integer;
    PointerCount: longint;
  end;
  BucketPtr = ^Bucket;

  GridIndex = record
    Grid: array of array of array of BucketPtr;
    ScaleX, ScaleY, ScaleZ: BTreePtr;
    XSize, YSize, ZSize: integer;
    BucketSize: integer;
    MaxX, MinX, MaxY, MinY, MaxZ, MinZ: real;
    RangeX, RangeY, RangeZ: real;
    NumBuckets: longint;
  end;

  Axis = (XAxis, YAxis, ZAxis);

  procedure CreateNodeGridIndex(const Nodes: TRealRealArray; var NodeIdx: GridIndex);
  procedure CreateNodeGridIndex2(const Nodes: TRealRealArray; var NodeIdx: GridIndex);
  procedure CreateElementGridIndex(const Elements: TIntegerIntegerArray; const Nodes: TRealRealArray; const NodesInElement: TIntegerArray; var ElementIdx: GridIndex);
  procedure CreateElementGridIndex2(const Elements: TIntegerIntegerArray; const Nodes: TRealRealArray; const NodesInElement: TIntegerArray; var ElementIdx: GridIndex);
  procedure InitialiseBucket(var NodeIdx: GridIndex; Buck: BucketPtr; Size: integer);
  procedure InitialiseBucketWithElements(var NodeIdx: GridIndex; Buck: BucketPtr; Size: integer);
  procedure InitialiseIndex(var NodeIdx: GridIndex; const Nodes: TRealRealArray; IndexingElements: boolean);
  procedure CountPointersToOverflowedBucket(var NodeIdx: GridIndex; OverflowedBucket: BucketPtr);
  procedure SplitGrid(var NodeIdx: GridIndex; var AxisToSplit: Axis; Idx: integer; OverflowedBucket: BucketPtr; const Nodes: TRealRealArray; IndexingElements: boolean);
  procedure RedistributeBucket(var NodeIdx: GridIndex; Buck: BucketPtr; const Nodes: TRealRealArray; IndexingElements: boolean);
  function FindBucket(var NodeIdx: GridIndex; const Nodes: TRealRealArray; N: Node): BucketPtr;
  procedure InsertNode(Buck: BucketPtr; N: Node; Size: integer);
  procedure InsertNode(Buck: BucketPtr; N: Node; E: Element; Size: integer);
  procedure RecursiveSplitGrid(var NodeIdx: GridIndex; var AxisToSplit: Axis; OverflowedBucket: BucketPtr; const Nodes: TRealRealArray; N: Node; E: Element; IndexingElements: boolean);
  procedure CountSharedBuckets(var NodeIdx: GridIndex);
  procedure SplitSharedBucket(var NodeIdx: GridIndex; OverflowedBucket: BucketPtr; const Nodes: TRealRealArray; N: Node; E: Element; IndexingElements: boolean; var axisToSplit: Axis);
  procedure CheckIndex(var NodeIdx: GridIndex; const Nodes: TRealRealArray);

implementation

procedure InitialiseBucket(var NodeIdx: GridIndex; Buck: BucketPtr; Size: integer);
begin
{  SetLength(Buck^.Nodes, Size); }
  Buck^.ID := NodeIdx.NumBuckets;
  NodeIdx.NumBuckets := NodeIdx.NumBuckets + 1;
  Buck^.Len := 0;
  Buck^.PointerCount := 1;
end;

procedure InitialiseBucketWithElements(var NodeIdx: GridIndex; Buck: BucketPtr; Size: integer);
begin
{  SetLength(Buck^.Nodes, Size);
  SetLength(Buck^.Elements, Size); }
  Buck^.ID := NodeIdx.NumBuckets;
  NodeIdx.NumBuckets := NodeIdx.NumBuckets + 1;
  Buck^.Len := 0;
  Buck^.PointerCount := 1;
end;

procedure InitialiseIndex(var NodeIdx: GridIndex; const Nodes: TRealRealArray; IndexingElements: boolean);
var
  i, j, k: longint;
begin
  WriteLn('Initialising index...');
  NodeIdx.XSize := 50; { 40; } { 25; }
  NodeIdx.YSize := 50; { 40; } { 25; }
  NodeIdx.ZSize := 50; { 40; } { 25; }
  NodeIdx.BucketSize := 60; { 50; } { 15; }
  NodeIdx.NumBuckets := 0;
  SetLength(NodeIdx.Grid, NodeIdx.XSize, NodeIdx.YSize, NodeIdx.ZSize);
  if (IndexingElements) then
    for i := 0 to NodeIdx.XSize - 1 do
      for j := 0 to NodeIdx.YSize - 1 do
        for k := 0 to NodeIdx.ZSize - 1 do
          begin
            new(NodeIdx.Grid[i,j,k]);
            InitialiseBucketWithElements(NodeIdx, NodeIdx.Grid[i,j,k], NodeIdx.BucketSize);
          end
  else
    for i := 0 to NodeIdx.XSize - 1 do
      for j := 0 to NodeIdx.YSize - 1 do
        for k := 0 to NodeIdx.ZSize - 1 do
          begin
            new(NodeIdx.Grid[i,j,k]);
            InitialiseBucket(NodeIdx, NodeIdx.Grid[i,j,k], NodeIdx.BucketSize);
          end;

  NodeIdx.MaxX := Nodes[0,1];
  NodeIdx.MinX := Nodes[0,1];
  NodeIdx.MaxY := Nodes[0,2];
  NodeIdx.MinY := Nodes[0,2];
  NodeIdx.MaxZ := Nodes[0,3];
  NodeIdx.MinZ := Nodes[0,3];
  for i := 0 to high(Nodes) do
    begin
      if Nodes[i,1] > NodeIdx.MaxX then
        NodeIdx.MaxX := Nodes[i,1]
      else if Nodes[i,1] < NodeIdx.MinX then
        NodeIdx.MinX := Nodes[i,1];
      
      if Nodes[i,2] > NodeIdx.MaxY then
        NodeIdx.MaxY := Nodes[i,2]
      else if Nodes[i,2] < NodeIdx.MinY then
        NodeIdx.MinY := Nodes[i,2];

      if Nodes[i,3] > NodeIdx.MaxZ then
        NodeIdx.MaxZ := Nodes[i,3]
      else if Nodes[i,3] < NodeIdx.MinZ then
        NodeIdx.MinZ := Nodes[i,3];
    end;
  NodeIdx.RangeX := NodeIdx.MaxX - NodeIdx.MinX;
  NodeIdx.RangeY := NodeIdx.MaxY - NodeIdx.MinY;
  NodeIdx.RangeZ := NodeIdx.MaxZ - NodeIdx.MinZ;
  WriteLn('Initial X size = ', NodeIdx.XSize, ', Y size = ', NodeIdx.YSize, ', Z size = ', NodeIdx.ZSize);
  WriteLn('Bucket size = ', NodeIdx.BucketSize);
  WriteLn('max x = ', NodeIdx.MaxX, ', min x = ', NodeIdx.MinX, ', max y = ', NodeIdx.MaxY, ', min y = ', NodeIdx.MinY, ', max z = ', NodeIdx.MaxZ, ', min z = ', NodeIdx.MinZ);
  WriteLn('range x = ', NodeIdx.RangeX, ', range y = ', NodeIdx.RangeY, ', range z = ', NodeIdx.RangeZ);

  CreateScale(NodeIdx.ScaleX);
  InitialiseScale(NodeIdx.ScaleX, 0, NodeIdx.XSize - 1, NodeIdx.MinX, NodeIdx.RangeX / NodeIdx.XSize);
  ShowScale(NodeIdx.ScaleX);
  CreateScale(NodeIdx.ScaleY);
  InitialiseScale(NodeIdx.ScaleY, 0, NodeIdx.YSize - 1, NodeIdx.MinY, NodeIdx.RangeY / NodeIdx.YSize);
  ShowScale(NodeIdx.ScaleY);
  CreateScale(NodeIdx.ScaleZ);
  InitialiseScale(NodeIdx.ScaleZ, 0, NodeIdx.ZSize - 1, NodeIdx.MinZ, NodeIdx.RangeZ / NodeIdx.ZSize);
  ShowScale(NodeIdx.ScaleZ);
end;

procedure CountPointersToOverflowedBucket(var NodeIdx: GridIndex; OverflowedBucket: BucketPtr);
var
  i, j, k: longint;
  pointersToOverflowedBucket: longint;
begin
  pointersToOverflowedBucket := 0;
  for i := 0 to NodeIdx.XSize - 1 do
    for j := 0 to NodeIdx.YSize - 1 do
      for k := 0 to NodeIdx.ZSize - 1 do
        if NodeIdx.Grid[i,j,k] = OverflowedBucket then
          begin
            pointersToOverflowedBucket := pointersToOverflowedBucket + 1;
            { WriteLn('Pointer to overflowed bucket: ', i, ' ', j, ' ', k); }
          end;
  WriteLn('Number of pointers to overflowed bucket: ', pointersToOverflowedBucket);
end;

procedure SplitGrid(var NodeIdx: GridIndex; var AxisToSplit: Axis; Idx: integer; OverflowedBucket: BucketPtr; const Nodes: TRealRealArray; IndexingElements: boolean);
var
  CopyGrid: array of array of array of BucketPtr;
  i, j, k: longint;
  currSplit: Axis;

procedure ShareBucket(i1, j1, k1, i2, j2, k2: longint);
begin
  if CopyGrid[i1,j1,k1] = OverflowedBucket then
    begin
      new(NodeIdx.Grid[i2,j2,k2]);
      InitialiseBucket(NodeIdx, NodeIdx.Grid[i2,j2,k2], NodeIdx.BucketSize);
    end
  else
    NodeIdx.Grid[i2,j2,k2] := CopyGrid[i1,j1,k1];
end;

procedure ShareBucketWithElements(i1, j1, k1, i2, j2, k2: longint);
begin
  if CopyGrid[i1,j1,k1] = OverflowedBucket then
    begin
      new(NodeIdx.Grid[i2,j2,k2]);
      InitialiseBucketWithElements(NodeIdx, NodeIdx.Grid[i2,j2,k2], NodeIdx.BucketSize);
    end
  else
    NodeIdx.Grid[i2,j2,k2] := CopyGrid[i1,j1,k1];
end;

procedure ShareBuckets();
var
  i, j, k: longint;
begin
  if (IndexingElements) then
    if currSplit = XAxis then
      begin
        for i := 0 to Idx do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucketWithElements(i, j, k, i, j, k);
        for i := Idx + 1 to NodeIdx.XSize - 1 do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucketWithElements(i - 1, j, k, i, j, k);
      end
    else if currSplit = YAxis then
      begin
        for i := 0 to NodeIdx.XSize - 1 do
          for j := 0 to Idx do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucketWithElements(i, j, k, i, j, k);
        for i := 0 to NodeIdx.XSize - 1 do
          for j := Idx + 1 to NodeIdx.YSize - 1 do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucketWithElements(i, j - 1, k, i, j, k);
      end
    else
      begin
        for i := 0 to NodeIdx.XSize - 1 do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := 0 to Idx do
              ShareBucketWithElements(i, j, k, i, j, k);
        for i := 0 to NodeIdx.XSize - 1 do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := Idx + 1 to NodeIdx.ZSize - 1 do
              ShareBucketWithElements(i, j, k - 1, i, j, k);
      end
  else
    if currSplit = XAxis then
      begin
        for i := 0 to Idx do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucket(i, j, k, i, j, k);
        for i := Idx + 1 to NodeIdx.XSize - 1 do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucket(i - 1, j, k, i, j, k);
      end
    else if currSplit = YAxis then
      begin
        for i := 0 to NodeIdx.XSize - 1 do
          for j := 0 to Idx do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucket(i, j, k, i, j, k);
        for i := 0 to NodeIdx.XSize - 1 do
          for j := Idx + 1 to NodeIdx.YSize - 1 do
            for k := 0 to NodeIdx.ZSize - 1 do
              ShareBucket(i, j - 1, k, i, j, k);
      end
    else
      begin
        for i := 0 to NodeIdx.XSize - 1 do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := 0 to Idx do
              ShareBucket(i, j, k, i, j, k);
        for i := 0 to NodeIdx.XSize - 1 do
          for j := 0 to NodeIdx.YSize - 1 do
            for k := Idx + 1 to NodeIdx.ZSize - 1 do
              ShareBucket(i, j, k - 1, i, j, k);
      end;
end;

procedure SplitAxis(Scale: BTreePtr; Size: integer; Min, Range: real);
var
  idxValue, succIdxValue: real;
begin
  idxValue := FindValue(Scale, Idx);
  if Idx < Size - 1 then
    begin
      succIdxValue := FindValue(Scale, Idx + 1);
      ShiftScale(Scale, Idx + 1);
    end
  else
    succIdxValue := Min + Range;
  AddToScale(Scale, (idxValue + succIdxValue) / 2, Idx + 1);
end;

begin
  WriteLn('Splitting along axis ', AxisToSplit, '...');

  { CountPointersToOverflowedBucket(NodeIdx, OverflowedBucket);
  WriteLn('Counting shared buckets before splitting the grid...');
  CountSharedBuckets(NodeIdx); }

  SetLength(CopyGrid, NodeIdx.XSize, NodeIdx.YSize, NodeIdx.ZSize);
  for i := 0 to NodeIdx.XSize - 1 do
    for j := 0 to NodeIdx.YSize - 1 do
      for k := 0 to NodeIdx.ZSize - 1 do
        CopyGrid[i,j,k] := NodeIdx.Grid[i,j,k];

  currSplit := AxisToSplit;
  if AxisToSplit = XAxis then
    begin
      SplitAxis(NodeIdx.ScaleX, NodeIdx.XSize, NodeIdx.MinX, NodeIdx.RangeX);
      NodeIdx.XSize := NodeIdx.XSize + 1;
      WriteLn('New X size: ', NodeIdx.XSize);
      for j := 0 to NodeIdx.YSize - 1 do
        for k := 0 to NodeIdx.ZSize - 1 do
          CopyGrid[Idx,j,k]^.PointerCount := CopyGrid[Idx,j,k]^.PointerCount + 1;
      AxisToSplit := YAxis;
    end
  else if AxisToSplit = YAxis then
    begin
      SplitAxis(NodeIdx.ScaleY, NodeIdx.YSize, NodeIdx.MinY, NodeIdx.RangeY);
      NodeIdx.YSize := NodeIdx.YSize + 1;
      WriteLn('New Y size: ', NodeIdx.YSize);
      for i := 0 to NodeIdx.XSize - 1 do
        for k := 0 to NodeIdx.ZSize - 1 do
          CopyGrid[i,Idx,k]^.PointerCount := CopyGrid[i,Idx,k]^.PointerCount + 1;
      AxisToSplit := ZAxis;
    end
  else
    begin
      SplitAxis(NodeIdx.ScaleZ, NodeIdx.ZSize, NodeIdx.MinZ, NodeIdx.RangeZ);
      NodeIdx.ZSize := NodeIdx.ZSize + 1;
      WriteLn('New Z size: ', NodeIdx.ZSize);
      for i := 0 to NodeIdx.XSize - 1 do
        for j := 0 to NodeIdx.YSize - 1 do
          CopyGrid[i,j,Idx]^.PointerCount := CopyGrid[i,j,Idx]^.PointerCount + 1;
      AxisToSplit := XAxis;
    end;
  SetLength(NodeIdx.Grid, NodeIdx.XSize, NodeIdx.YSize, NodeIdx.ZSize);
  ShareBuckets();
  SetLength(CopyGrid, 0, 0, 0);
  RedistributeBucket(NodeIdx, OverflowedBucket, Nodes, IndexingElements);
  dispose(OverflowedBucket);

  { WriteLn('Counting shared buckets after splitting the grid...');
  CountSharedBuckets(NodeIdx); }
end;

procedure RedistributeBucket(var NodeIdx: GridIndex; Buck: BucketPtr; const Nodes: TRealRealArray; IndexingElements: boolean);
var
  i: longint;
  { x, y, z: longint; }
  b: BucketPtr;
  n: Node;
begin
  WriteLn('Redistributing bucket...');
  if Buck^.Len < NodeIdx.BucketSize then
    WriteLn('Error. The number of nodes in the bucket is less than its size. No need to redistribute.');
  if (IndexingElements) then
    for i := 0 to Buck^.Len - 1 do
      begin
        n := Buck^.Nodes[i];
        b := FindBucket(NodeIdx, Nodes, n);
        if b^.Len < NodeIdx.BucketSize then
          InsertNode(b, n, Buck^.Elements[i], NodeIdx.BucketSize)
        else
          WriteLn('Error: Found a full bucket during redistribution.');
      end
  else
    for i := 0 to Buck^.Len - 1 do
      begin
        n := Buck^.Nodes[i];
        b := FindBucket(NodeIdx, Nodes, n);
        if b^.Len < NodeIdx.BucketSize then
          InsertNode(b, n, NodeIdx.BucketSize)
        else
          WriteLn('Error: Found a full bucket during redistribution.');
      end
end;

function FindBucket(var NodeIdx: GridIndex; const Nodes: TRealRealArray; N: Node): BucketPtr;
var
  x1, y1, z1: longint;
begin
  x1 := FindPos(Nodes[N,1], NodeIdx.ScaleX);
  y1 := FindPos(Nodes[N,2], NodeIdx.ScaleY);
  z1 := FindPos(Nodes[N,3], NodeIdx.ScaleZ);
  FindBucket := NodeIdx.Grid[x1,y1,z1];
end;

procedure InsertNode(Buck: BucketPtr; N: Node; Size: integer);
begin
  if Buck^.Len = 0 then
    SetLength(Buck^.Nodes, Size);
  Buck^.Nodes[Buck^.Len] := N;
  Buck^.Len := Buck^.Len + 1;
end;

procedure InsertNode(Buck: BucketPtr; N: Node; E: Element; Size: integer);
begin
  if Buck^.Len = 0 then
    begin
      SetLength(Buck^.Nodes, Size);
      SetLength(Buck^.Elements, Size);
    end;
  Buck^.Nodes[Buck^.Len] := N;
  Buck^.Elements[Buck^.Len] := E;
  Buck^.Len := Buck^.Len + 1;
end;

function GetPosSplittingAxis(var NodeIdx: GridIndex; AxisToSplit: Axis; const Nodes: TRealRealArray; N: Node): integer;
begin
  if AxisToSplit = XAxis then
    GetPosSplittingAxis := FindPos(Nodes[N,1], NodeIdx.ScaleX)
  else if AxisToSplit = YAxis then
    GetPosSplittingAxis := FindPos(Nodes[N,2], NodeIdx.ScaleY)
  else
    GetPosSplittingAxis := FindPos(Nodes[N,3], NodeIdx.ScaleZ);
end;

procedure RecursiveSplitGrid(var NodeIdx: GridIndex; var AxisToSplit: Axis; OverflowedBucket: BucketPtr; const Nodes: TRealRealArray; N: Node; E: Element; IndexingElements: boolean);
var
  buck: BucketPtr;
  rec, posSplittingAxis: integer;
begin
  buck := OverflowedBucket;
  rec := 0;
  repeat
    WriteLn('Recursion level ', rec);
    WriteLn('Bucket length: ', buck^.Len);
    posSplittingAxis := GetPosSplittingAxis(NodeIdx, AxisToSplit, Nodes, N);
    WriteLn('Splitting position: ', posSplittingAxis);
    SplitGrid(NodeIdx, AxisToSplit, posSplittingAxis, buck, Nodes, IndexingElements);
    buck := FindBucket(NodeIdx, Nodes, N);
    rec := rec + 1;
  until buck^.Len < NodeIdx.BucketSize;
  if (IndexingElements) then
    InsertNode(buck, N, E, NodeIdx.BucketSize)
  else
    InsertNode(buck, N, NodeIdx.BucketSize);
  WriteLn('Added node ', N, ' which caused a grid split');
end;

procedure CountSharedBuckets(var NodeIdx: GridIndex);
var
  i, j, k: longint;
  shared, notShared: longint;
begin
  shared := 0;
  notShared := 0;
  for i := 0 to NodeIdx.XSize - 1 do
    for j := 0 to NodeIdx.YSize - 1 do
      for k := 0 to NodeIdx.ZSize - 1 do
        if NodeIdx.Grid[i,j,k]^.PointerCount > 1 then
          shared := shared + 1
        else
          notShared := notShared + 1;
  WriteLn(shared, ' shared buckects, ', notShared, ' not shared buckets');
end;

procedure SplitSharedBucket(var NodeIdx: GridIndex; OverflowedBucket: BucketPtr; const Nodes: TRealRealArray; N: Node; E: Element; IndexingElements: boolean; var axisToSplit: Axis);
var
  x1, y1, z1: longint;
  newBuck, sharedBuck: BucketPtr;
begin
  x1 := FindPos(Nodes[N,1], NodeIdx.ScaleX);
  y1 := FindPos(Nodes[N,2], NodeIdx.ScaleY);
  z1 := FindPos(Nodes[N,3], NodeIdx.ScaleZ);
  { WriteLn('Overflowed bucket ', x1, ' ', y1, ' ', z1, ', size ', OverflowedBucket^.Len); }
  { WriteLn('Counting shared buckets before splitting shared bucket...');
  CountSharedBuckets(NodeIdx); }
  new(sharedBuck);
  sharedBuck^ := OverflowedBucket^;
  if (IndexingElements) then
    InitialiseBucketWithElements(NodeIdx, OverflowedBucket, NodeIdx.BucketSize)
  else
    InitialiseBucket(NodeIdx, OverflowedBucket, NodeIdx.BucketSize);
  OverflowedBucket^.PointerCount := sharedBuck^.PointerCount  - 1;
  new(NodeIdx.Grid[x1,y1,z1]);
  newBuck := NodeIdx.Grid[x1,y1,z1];
  if (IndexingElements) then
    InitialiseBucketWithElements(NodeIdx, newBuck, NodeIdx.BucketSize)
  else
    InitialiseBucket(NodeIdx, newBuck, NodeIdx.BucketSize);
  { WriteLn('Counting shared buckets after splitting shared bucket...');
  CountSharedBuckets(NodeIdx); }
  RedistributeBucket(NodeIdx, sharedBuck, Nodes, IndexingElements);
  WriteLn('Length overflowed bucket: ', OverflowedBucket^.Len, ', length new bucket: ', newBuck^.Len);
  if newBuck^.Len < NodeIdx.BucketSize then
    if (IndexingElements) then
      InsertNode(newBuck, N, E, NodeIdx.BucketSize)
    else
      InsertNode(newBuck, N, NodeIdx.BucketSize)
  else
    begin
      WriteLn('Bucket still full after redistribution.');
      RecursiveSplitGrid(NodeIdx, axisToSplit, newBuck, Nodes, N, E, IndexingElements);
    end; 
end;

procedure CheckIndex(var NodeIdx: GridIndex; const Nodes: TRealRealArray);
var
  i, j, k, l: longint;
  found: longint;
  buck: BucketPtr;
  nnodes, nbuckets, nempty, sumBucketSize: real;
  xSizeCell, ySizeCell, zSizeCell: real;
  n: Node;
begin
  { WriteLn('Searching ', high(Nodes) + 1, ' nodes...');
  found := 0;
  for i := 0 to high(Nodes) do
    begin
      WriteLn('Node ', i);
      buck := FindBucket(NodeIdx, Nodes, i);
      for j := 0 to buck^.Len - 1 do
        if buck^.Nodes[j] = i then
          begin
            found := found + 1;
            break;
          end;
    end;
  WriteLn('Found ', found, ' nodes'); }

  nnodes := 0;
  nbuckets := 0;
  nempty := 0;
  sumBucketSize := 0;
  for i := 0 to NodeIdx.XSize - 1 do
    for j := 0 to NodeIdx.YSize - 1 do
      for k := 0 to NodeIdx.ZSize - 1 do
        begin
          buck := NodeIdx.Grid[i,j,k];
          if buck^.Len = 0 then
            nempty := nempty + 1 / buck^.PointerCount;
          nnodes := nnodes + buck^.Len / buck^.PointerCount;
          nbuckets := nbuckets + 1 / buck^.PointerCount;
          sumBucketSize := sumBucketSize + length(buck^.Nodes) / buck^.PointerCount;
        end;
  WriteLn(round(nnodes), ' nodes, ', round(nbuckets), ' buckets, average non-empty bucket size = ', (sumBucketSize / (nbuckets - nempty)):3:1, ', average bucket occupancy = ', (nnodes / (nbuckets - nempty)):3:1, ', ratio space occupied = ', ((nbuckets - nempty) * NodeIdx.BucketSize / nnodes):3:1, ', ', round(nbuckets - round(nempty)), ' nonempty buckets, ', round(nempty), ' empty buckets, ', NodeIdx.XSize, ' x size, ', NodeIdx.YSize, ' y size, ', NodeIdx.ZSize, ' z size');

  { WriteLn('Scanning nodes in index...');
  for i := 0 to NodeIdx.XSize - 1 do
    for j := 0 to NodeIdx.YSize - 1 do
      for k := 0 to NodeIdx.ZSize - 1 do
        begin
          WriteLn('i = ', i, ', j = ', j, ', k = ', k);
          for l := 0 to NodeIdx.Grid[i,j,k]^.Len - 1 do
            begin
              n := NodeIdx.Grid[i,j,k]^.Nodes[l];
              WriteLn('(', Nodes[n,1], ', ', Nodes[n,2], ', ', Nodes[n,3], ')');
            end;
        end; }

end;

procedure CreateNodeGridIndex(const Nodes: TRealRealArray; var NodeIdx: GridIndex);
var
  i: longint;
  buck: BucketPtr;
  axisToSplit: Axis = XAxis;
begin
  WriteLn(high(Nodes) + 1, ' nodes');
  InitialiseIndex(NodeIdx, Nodes, false);
  for i := 0 to high(Nodes) do
    begin
      WriteLn('Indexing node ', i, ' ...');
      buck := FindBucket(NodeIdx, Nodes, i);
      if buck^.Len < NodeIdx.BucketSize then
        begin
          InsertNode(buck, i, NodeIdx.BucketSize);
          { WriteLn('Added node ', Nodes[i,1], ', ', Nodes[i,2], ', ', Nodes[i,3], '.'); }
        end
      else
        begin
          Write('Bucket full, it is ');
          if buck^.PointerCount > 1 then
            begin
              WriteLn('shared.');
              SplitSharedBucket(NodeIdx, buck, Nodes, i, 0, false,  axisToSplit);
            end
          else
            begin
              WriteLn('not shared.');
              RecursiveSplitGrid(NodeIdx, axisToSplit, buck, Nodes, i, 0, false);
            end
        end;
    end;
  CheckIndex(NodeIdx, Nodes);
end;

procedure CreateNodeGridIndex2(const Nodes: TRealRealArray; var NodeIdx: GridIndex);
var
  i, j, k: longint;
  buck: BucketPtr;
  axisToSplit: Axis = XAxis;
begin
  WriteLn(high(Nodes) + 1, ' nodes');
  InitialiseIndex(NodeIdx, Nodes, false);
  for i := 0 to high(Nodes) do
    begin
      WriteLn('Indexing node ', i, ' ...');
      buck := FindBucket(NodeIdx, Nodes, i);
      if buck^.Len >= length(buck^.Nodes) then
        SetLength(Buck^.Nodes, length(Buck^.Nodes) * 2);
      InsertNode(buck, i, NodeIdx.BucketSize);
      { WriteLn('Added node ', Nodes[i,1], ', ', Nodes[i,2], ', ', Nodes[i,3], '.'); }
    end;
  for i := 0 to NodeIdx.XSize - 1 do
    for j := 0 to NodeIdx.YSize - 1 do
      for k := 0 to NodeIdx.ZSize - 1 do
        WriteLn('Length bucket: ', length(NodeIdx.Grid[i,j,k]^.Nodes));
  CheckIndex(NodeIdx, Nodes);
end;

procedure CreateElementGridIndex(const Elements: TIntegerIntegerArray; const Nodes: TRealRealArray; const NodesInElement: TIntegerArray; var ElementIdx: GridIndex);
var
  i, j: longint;
  buck: BucketPtr;
  axisToSplit: Axis = XAxis;
begin
  WriteLn(high(Nodes) + 1, ' nodes');
  Writeln(high(Elements) + 1, ' elements');
  InitialiseIndex(ElementIdx, Nodes, true);
  for j := 0 to high(Elements) do
    begin
      WriteLn('Indexing element  ', j, ' ...');
      for i := 1 to NodesInElement[j] do
        begin
          buck := FindBucket(ElementIdx, Nodes, Elements[j,i] - 1);
          if buck^.Len < ElementIdx.BucketSize then
            InsertNode(buck, Elements[j,i] - 1, j, ElementIdx.BucketSize)
          else
            begin
              Write('Bucket full, it is ');
              if buck^.PointerCount > 1 then
                begin
                  WriteLn('shared.');
                  SplitSharedBucket(ElementIdx, buck, Nodes, Elements[j,i] - 1, j, true, axisToSplit);
                end
              else
                begin
                  WriteLn('not shared.');
                  RecursiveSplitGrid(ElementIdx, axisToSplit, buck, Nodes, Elements[j,i] - 1, j, true);
                end
            end;
        end;
    end;
  CheckIndex(ElementIdx, Nodes);
end;

procedure CreateElementGridIndex2(const Elements: TIntegerIntegerArray; const Nodes: TRealRealArray; const NodesInElement: TIntegerArray; var ElementIdx: GridIndex);
var
  i, j, k: longint;
  buck: BucketPtr;
  axisToSplit: Axis = XAxis;
begin
  WriteLn(high(Nodes) + 1, ' nodes');
  Writeln(high(Elements) + 1, ' elements');
  InitialiseIndex(ElementIdx, Nodes, true);
  for j := 0 to high(Elements) do
    begin
      WriteLn('Indexing element  ', j, ' ...');
      for i := 1 to NodesInElement[j] do
        begin
          buck := FindBucket(ElementIdx, Nodes, Elements[j,i] - 1);
          if buck^.Len >= length(buck^.Nodes) then
            begin
              SetLength(Buck^.Nodes, length(Buck^.Nodes) + ElementIdx.BucketSize);
              SetLength(Buck^.Elements, length(Buck^.Elements) + ElementIdx.BucketSize);
            end;
          InsertNode(buck, Elements[j,i] - 1, j, ElementIdx.BucketSize)
        end;
    end;
  for i := 0 to ElementIdx.XSize - 1 do
    for j := 0 to ElementIdx.YSize - 1 do
      for k := 0 to ElementIdx.ZSize - 1 do
        WriteLn('Length bucket: ', length(ElementIdx.Grid[i,j,k]^.Nodes));
  CheckIndex(ElementIdx, Nodes);
end;

end.
