library fedes;

{$mode objfpc}{$H+}

uses
{$ifdef unix}
  cthreads,
  //cmem, // the c memory manager is on some systems much faster for multi-threading
{$endif}
  //Interfaces,
  Classes,
  interpolations,
  parsers,
  readers;

{$R *.res}

exports
{interpolations}
SetNumOfThreads2,
DMUFPP,
NPMP,
DMUEP,
MUESFP,
DMUFP,
NPM,
DMUE,
MUESF,
convert_coordinates,
obtain_nodes_in_element,
{parsers}
FortranNPM,
FortranDMUFP,
FortranDMUE,
FortranMUESF,
CreateFortranAbaqusFile,
CreateAbaqusFile,
createXML2,
createXML1,
CreateAnsysFiles,
CreateDeformFile,
CreateMorpheoFile,
{readers}
abaqus_input_read,
abaqus_output_read,
ansys_input_read,
ansys_input_read_lis,
ansys_input_integration_points_read,
ansys_output_read,
marc_input_output_read,
marc_stress_output_read,
deform_input_output_read,
deform_input_read,
vulcan_input_read,
vulcan_output_read,
morpheo_input_output_read,
morpheo_input_read,
XML_input_read;

end.

