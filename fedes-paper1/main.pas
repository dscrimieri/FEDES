unit main;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  xmldom, XMLIntf, msxmldom, XMLDoc, Windows,
{$ELSE}
  DOM, LCLIntf, LCLType, LMessages,
{$ENDIF}
{$IFDEF windows}
  ShellAPI,
{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,math, ExtCtrls,data, Menus, Buttons, ImgList, ComCtrls,
  about,type_of_model,printers;

type

  TMainForm = class(TForm)
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Help1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    AbaqusAbaqus: TRadioButton;
    AbaqusAnsys: TRadioButton;
    AbaqusDeform: TRadioButton;
    Panel2: TPanel;
    EditAbaqus1: TEdit;
    BitBtnAbaqus1: TBitBtn;
    About1: TMenuItem;
    Label4: TLabel;
    EditAbaqus2: TEdit;
    BitBtnAbaqus2: TBitBtn;
    Label5: TLabel;
    BitBtnAbaqus3: TBitBtn;
    EditAbaqus3: TEdit;
    Label3: TLabel;
    SaveDialogAbaqusMethodB: TSaveDialog;
    TabSheet10: TTabSheet;
    AbaqusVulcan: TRadioButton;
    AbaqusMorfeo: TRadioButton;
    GroupBox4: TGroupBox;
    RadioButtonAnsys1: TRadioButton;
    RadioButtonAnsys2: TRadioButton;
    RadioButtonAnsys3: TRadioButton;
    RadioButtonAnsys4: TRadioButton;
    RadioButtonAnsys5: TRadioButton;
    RadioButtonAnsys6: TRadioButton;
    Panel1: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    EditAnsys1: TEdit;
    EditAnsys2: TEdit;
    EditAnsys3: TEdit;
    BitBtnAnsys1: TBitBtn;
    BitBtnAnsys2: TBitBtn;
    BitBtnAnsys3: TBitBtn;
    OpenDialogAnsys1: TOpenDialog;
    OpenDialogAnsys2: TOpenDialog;
    OpenDialogAnsys3: TOpenDialog;
    SaveDialogAnsys1: TSaveDialog;
    GroupBox7: TGroupBox;
    RadioButtonDeform1: TRadioButton;
    RadioButtonDeform2: TRadioButton;
    RadioButtonDeform3: TRadioButton;
    RadioButtonDeform4: TRadioButton;
    RadioButtonDeform5: TRadioButton;
    RadioButtonDeform6: TRadioButton;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditDeform1: TEdit;
    EditDeform2: TEdit;
    EditDeform3: TEdit;
    BitBtnDeform1: TBitBtn;
    BitBtnDefrom2: TBitBtn;
    BitBtnDeform3: TBitBtn;
    OpenDialogDeform1: TOpenDialog;
    OpenDialogDeform2: TOpenDialog;
    OpenDialogDeform3: TOpenDialog;
    SaveDialogDeform1: TSaveDialog;
    GroupBox9: TGroupBox;
    RadioButtonMorpheo1: TRadioButton;
    RadioButtonMorpheo2: TRadioButton;
    RadioButtonMorpheo3: TRadioButton;
    RadioButtonMorpheo4: TRadioButton;
    RadioButtonMorpheo5: TRadioButton;
    RadioButtonMorpheo6: TRadioButton;
    Panel4: TPanel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EditMorpheo1: TEdit;
    EditMorpheo2: TEdit;
    EditMorpheo3: TEdit;
    BitBtnMorpheo1: TBitBtn;
    BitBtnMorpheo2: TBitBtn;
    BitBtnMorpheo3: TBitBtn;
    OpenDialogMorpheo1: TOpenDialog;
    OpenDialogMorpheo2: TOpenDialog;
    OpenDialogMorpheo3: TOpenDialog;
    SaveDialogMorpheo1: TSaveDialog;
    OpenDialogMARC1: TOpenDialog;
    OpenDialogmarc2: TOpenDialog;
    OpenDialogmarc3: TOpenDialog;
    SaveDialogmarc1: TSaveDialog;
    xml1: TMenuItem;
    Print1: TMenuItem;
    Close2: TMenuItem;
    SaveDialogxml: TSaveDialog;
    xml2: TMenuItem;
    Help2: TMenuItem;
    Panel6: TPanel;
    BitBtnAbaqus4: TBitBtn;
    GroupBox2: TGroupBox;
    CheckBoxAbaqusTotalStrain: TCheckBox;
    CheckBoxAbaqusStress: TCheckBox;
    CheckBoxAbaqusPlasticStrain: TCheckBox;
    CheckBoxAbaqusAccumulatedStrain: TCheckBox;
    CheckBoxAbaqusDisplacement: TCheckBox;
    GroupBox3: TGroupBox;
    RadioButtonMUSF: TRadioButton;
    RadioButtonDMUFP: TRadioButton;
    RadioButtonDMUE: TRadioButton;
    RadioButtonNPM: TRadioButton;
    OpenDialog1Abaqus: TOpenDialog;
    OpenDialog2Abaqus: TOpenDialog;
    OpenDialog3Abaqus: TOpenDialog;
    ProgressBarAbaqus1: TProgressBar;
    GroupBox5: TGroupBox;
    EditStresses: TEdit;
    EditDisplacements: TEdit;
    EditTotalStrains: TEdit;
    EditPlasticStrains: TEdit;
    EditAccumulatedStrain: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    BitBtnAbaqusCalculate: TBitBtn;
    BitBtnSave2: TBitBtn;
    BitBtnSave1: TBitBtn;
    BitBtnClear: TBitBtn;
    BitBtnAbaqusClose: TBitBtn;
    EditAnsys4: TEdit;
    BitBtnAnsys4: TBitBtn;
    Label17: TLabel;
    OpenDialogAnsys4: TOpenDialog;
    Panel7: TPanel;
    ProgressBarAnsys1: TProgressBar;
    BitBtnAnsys5: TBitBtn;
    GroupBox6: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox10: TGroupBox;
    BitBtnAnsysCalculate: TBitBtn;
    BitBtnAnsysClose: TBitBtn;
    BitBtnAnsysSave: TBitBtn;
    BitBtnAnsysClear: TBitBtn;
    CheckBoxAnsysStress: TCheckBox;
    CheckBoxAnsysDisplacement: TCheckBox;
    CheckBoxAnsysTotalStrain: TCheckBox;
    CheckBoxAnsysPlasticStrain: TCheckBox;
    CheckBoxAnsysAccumulatedStrain: TCheckBox;
    RadioButtonAnsysMUESF: TRadioButton;
    RadioButtonAnsysDMUFP: TRadioButton;
    RadioButtonAnsysDMUE: TRadioButton;
    RadioButtonAnsysNPM: TRadioButton;
    EditAnsysStress: TEdit;
    EditAnsysDisplacement: TEdit;
    EditAnsysTotalStrain: TEdit;
    EditAnsysPlasticStrain: TEdit;
    EditAnsysAccumulatedStrain: TEdit;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Panel8: TPanel;
    BitBtnDeform4: TBitBtn;
    ProgressBarDeform1: TProgressBar;
    GroupBox11: TGroupBox;
    CheckBoxDeformStress: TCheckBox;
    CheckBoxDeformTotalStrain: TCheckBox;
    CheckBoxDeformPlasticStrain: TCheckBox;
    CheckBoxDeformAccumulatedStrain: TCheckBox;
    CheckBoxDeformDisplacement: TCheckBox;
    GroupBox12: TGroupBox;
    RadioButtonDeformMUESF: TRadioButton;
    RadioButtonDeformDMUFP: TRadioButton;
    RadioButtonDeformDMUE: TRadioButton;
    RadioButtonDeformNPM: TRadioButton;
    GroupBox13: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    EditDeformStress: TEdit;
    EditDeformDisplacement: TEdit;
    EditDeformTotalStrain: TEdit;
    EditDeformPlasticStrain: TEdit;
    EditDeformAccumulatedStrain: TEdit;
    BitBtnDeformCalculate: TBitBtn;
    BitBtnDeformClose: TBitBtn;
    BitBtnDeformSave: TBitBtn;
    BitBtnDeformClear: TBitBtn;
    Panel10: TPanel;
    BitBtnMorpheo4: TBitBtn;
    ProgressBarMorpheo1: TProgressBar;
    GroupBox18: TGroupBox;
    CheckBoxMorpheoStress: TCheckBox;
    CheckBoxMorpheoTotalStrain: TCheckBox;
    CheckBoxMorpheoPlasticStrain: TCheckBox;
    CheckBoxMorpheoAccumulatedStrain: TCheckBox;
    CheckBoxMorpheoDisplacement: TCheckBox;
    GroupBox19: TGroupBox;
    RadioButtonMorpheoMUESF: TRadioButton;
    RadioButtonMorpheoDMUFP: TRadioButton;
    RadioButtonMorpheoDMUE: TRadioButton;
    RadioButtonMorpheoNPM: TRadioButton;
    GroupBox20: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    EditMorpheoStress: TEdit;
    EditMorpheoDisplacement: TEdit;
    EditMorpheoTotalStrain: TEdit;
    EditMorpheoPlasticStrain: TEdit;
    EditMorpheoAccumulatedStrain: TEdit;
    BitBtnMorpheoCalculate: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtnMorpheoSave: TBitBtn;
    BitBtnMorpheoClear: TBitBtn;
    OpenDialogChainDisplacements: TOpenDialog;
    AbaqusMarc: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnAbaqus3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure AbaqusAnsysClick(Sender: TObject);
    procedure AbaqusAbaqusClick(Sender: TObject);
    procedure BitBtnAnsys1Click(Sender: TObject);
    procedure BitBtnAnsys2Click(Sender: TObject);
    procedure BitBtnAnsys3Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure RadioButtonAnsys2Click(Sender: TObject);
    procedure RadioButtonAnsys1Click(Sender: TObject);
    procedure BitBtnDeform1Click(Sender: TObject);
    procedure BitBtnDefrom2Click(Sender: TObject);
    procedure BitBtnDeform3Click(Sender: TObject);
    procedure RadioButtonDeform2Click(Sender: TObject);
    procedure RadioButtonDeform1Click(Sender: TObject);
    procedure RadioButtonMorpheo1Click(Sender: TObject);
    procedure RadioButtonMorpheo2Click(Sender: TObject);
    procedure BitBtnMorpheo1Click(Sender: TObject);
    procedure BitBtnMorpheo2Click(Sender: TObject);
    procedure BitBtnMorpheo3Click(Sender: TObject);
    procedure AbaqusMorfeoClick(Sender: TObject);
    procedure RadioButtonAnsys6Click(Sender: TObject);
    procedure RadioButtonDeform6Click(Sender: TObject);
    procedure RadioButtonMorpheo6Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure RadioButtonMorpheo3Click(Sender: TObject);
    procedure AbaqusMarcClick(Sender: TObject);
    procedure RadioButtonMorpheo4Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure AbaqusDeformClick(Sender: TObject);
    procedure RadioButtonAnsys4Click(Sender: TObject);
    procedure RadioButtonDeform4Click(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure TabSheet10Enter(Sender: TObject);
    procedure RadioButtonAnsys3Click(Sender: TObject);
    procedure RadioButtonDeform3Click(Sender: TObject);
    procedure Close2Click(Sender: TObject);
    procedure xml1Click(Sender: TObject);
    procedure xml2Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure SavemodeltwoinXMLformat1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure AbaqusVulcanClick(Sender: TObject);
    procedure RadioButtonAnsys5Click(Sender: TObject);
    procedure RadioButtonDeform5Click(Sender: TObject);
    procedure RadioButtonMorpheo5Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure BitBtnAbaqus4Click(Sender: TObject);
    procedure BitBtnAbaqus2Click(Sender: TObject);
    procedure BitBtnAbaqus1Click(Sender: TObject);
    procedure EditStressesKeyPress(Sender: TObject; var Key: Char);
    procedure EditDisplacementsKeyPress(Sender: TObject; var Key: Char);
    procedure EditTotalStrainsKeyPress(Sender: TObject; var Key: Char);
    procedure EditPlasticStrainsKeyPress(Sender: TObject; var Key: Char);
    procedure EditAccumulatedStrainKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnAbaqusCalculateClick(Sender: TObject);
    procedure BitBtnSave2Click(Sender: TObject);
    procedure BitBtnSave1Click(Sender: TObject);
    procedure BitBtnAbaqusCloseClick(Sender: TObject);
    procedure BitBtnAnsys4Click(Sender: TObject);
    procedure EditAnsysStressKeyPress(Sender: TObject; var Key: Char);
    procedure EditAnsysDisplacementKeyPress(Sender: TObject; var Key: Char);
    procedure EditAnsysTotalStrainKeyPress(Sender: TObject; var Key: Char);
    procedure EditAnsysPlasticStrainKeyPress(Sender: TObject; var Key: Char);
    procedure EditAnsysAccumulatedStrainKeyPress(Sender: TObject;
      var Key: Char);
    procedure BitBtnAnsys5Click(Sender: TObject);
    procedure BitBtnAnsysCalculateClick(Sender: TObject);
    procedure BitBtnAnsysSaveClick(Sender: TObject);
    procedure BitBtnDeform4Click(Sender: TObject);
    procedure BitBtnDeformCalculateClick(Sender: TObject);
    procedure BitBtnDeformSaveClick(Sender: TObject);
    procedure BitBtnMorpheo4Click(Sender: TObject);
    procedure BitBtnMorpheoCalculateClick(Sender: TObject);
    procedure BitBtnClearClick(Sender: TObject);
    procedure BitBtnAnsysClearClick(Sender: TObject);
    procedure BitBtnAnsysCloseClick(Sender: TObject);
    procedure BitBtnMorpheoSaveClick(Sender: TObject);
  private
    { Private declarations }
  procedure ClearRAM;
  procedure InsertTotalDisplacements;
  public
    { Public declarations }
  XMLDocument1: TXMLDocument;
  model_read : boolean;
  but1Abaqusclick : boolean;
  but2Abaqusclick : boolean;
  but3Abaqusclick : boolean;
  but1Ansysclick : boolean;
  but2Ansysclick : boolean;
  but3Ansysclick : boolean;
  but4Ansysclick : boolean;
  but1Deformclick : boolean;
  but2Deformclick : boolean;
  but3Deformclick : boolean;
  but1Morpheoclick : boolean;
  but2Morpheoclick : boolean;
  but3Morpheoclick : boolean;
  but1Marcclick : boolean;
  but2Marcclick : boolean;
  but3Marcclick : boolean;
//============= First model ===================
  ElementType1 : integer;
  ElementNumber1: integer;
  IntegrationPointNumber1 : integer;
  NodeNumber1 : integer;
  Elements1 : TIntegerIntegerArray;
  Nodes1 : TRealRealArray;
  Displacements1 : TRealRealArray;
  Stress1 : TRealRealArray;
  TotalStrain1: TRealRealArray;
  PlasticStrain1 : TRealRealArray;
  AccumulatedStrain1 : TRealRealArray;
//============ Second model ================
  ElementType2 : integer;
  ElementNumber2: integer;
  IntegrationPointNumber2 : integer;
  NodeNumber2 : integer;
  Elements2 : TIntegerIntegerArray;
  Nodes2 : TRealRealArray;
  Displacements2 : TRealRealArray;
  Stress2 : TRealRealArray;
  TotalStrain2: TRealRealArray;
  PlasticStrain2 : TRealRealArray;
  AccumulatedStrain2 : TRealRealArray;
//==================================================
  Nodes2Integration : TRealRealArray;
  NodesInElement1 : TIntegerArray;
  NodesInElement2 : TIntegerArray;
//======================================================
  stress_interpolation_method : string;
  package_to : string;
  pacage_from : string;
  buttonSelected  : integer;
  end;

var
  MainForm: TMainForm;

{$I libfedes.inc}

implementation

{$DEFINE USETHREADS}

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
procedure TMainForm.ClearRam;
begin
  ElementType1 := 0;
  ElementNumber1 := 0;
  IntegrationPointNumber1 :=0;
  NodeNumber1 := 0;
  Elements1 := nil;
  Nodes1 := nil;
  Displacements1 := nil;
  Stress1 := nil;
  TotalStrain1 := nil;
  PlasticStrain1 := nil;
  AccumulatedStrain1 := nil;
//============ Second model ================
  ElementType2 := 0;
  ElementNumber2 := 0;
  IntegrationPointNumber2 := 0;
  NodeNumber2 := 0;
  Elements2 := nil;
  Nodes2 := nil;
  Displacements2 := nil;
  Stress2 := nil;
  TotalStrain2 := nil;
  PlasticStrain2 := nil;
  AccumulatedStrain2 := nil;

end;

procedure DMUFPWrapper(const ScaleFactorStress : real;
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
begin
{$IFDEF USETHREADS}
  DMUFPP(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ELSE}
  DMUFP(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ENDIF}
end;

procedure NPMWrapper(const ScaleFactorStress : real;
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
begin
{$IFDEF USETHREADS}
  NPMP(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ELSE}
  NPM(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ENDIF}
end;

procedure DMUEWrapper(const ScaleFactorStress : real;
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
begin
{$IFDEF USETHREADS}
  DMUEP(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Elements1, NodesInElement, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ELSE}
  DMUE(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Elements1, NodesInElement, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ENDIF}
end;

procedure MUESFWrapper(const ScaleFactorStress : real;
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
begin
{$IFDEF USETHREADS}
  MUESFP(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Elements1, NodesInElement, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ELSE}
  MUESF(ScaleFactorStress, ScaleFactorDisplacements, ScaleFactorTotalStrain, ScaleFactorPlasticStrain, ScaleFactorAccumulatedStrain, nodes1, nodes2, Elements1, NodesInElement, Stress1, Displacements1, TotalStrain1, PlasticStrain1, AccumulatedStrain1, Stress2, StressMapping, Displacements2, DisplacementMapping, TotalStrain2, TotalStrainMapping, PlasticStrain2, PlasticStrainMapping, AccumulatedStrain2, AccumulatedStrainMapping);
{$ENDIF}
end;

procedure TMainForm.InsertTotalDisplacements;
begin
  buttonSelected := MessageDlg('Insert total displacements?', mtCustom, [mbYes,mbCancel], 0);
  if buttonSelected = mrYes then
    if OpenDialogChainDisplacements.Execute then
      XML_input_read (OpenDialogChainDisplacements.FileName, Displacements1);
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
  if savedialogxml.Execute then
  begin
    obtain_nodes_in_element(Elements1,NodesInElement1);
    createXML1(savedialogxml.FileName,
            Nodes1,
            Elements1,
            NodesInElement1,
            Stress1,
            Displacements1,
            TotalStrain1,
            PlasticStrain1,
            AccumulatedStrain1);
  end;
end;

procedure TMainForm.Close2Click(Sender: TObject);
begin
MainForm.Close;
end;

procedure TMainForm.EditAccumulatedStrainKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditAnsysAccumulatedStrainKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditAnsysDisplacementKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditAnsysPlasticStrainKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditAnsysStressKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditAnsysTotalStrainKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditDisplacementsKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditPlasticStrainsKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditStressesKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.EditTotalStrainsKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
begin
        beep;
        key := #0;
end;
end;

procedure TMainForm.File1Click(Sender: TObject);
begin

if nodes1 = nil then
xml1.Enabled := false
else
 xml1.Enabled := true;
if nodes2 = nil then
xml2.Enabled := false
else
xml2.Enabled := true;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
but1Marcclick := false;
but2Marcclick := false;
but3Marcclick := false;
but1Morpheoclick := false;
but2Morpheoclick := false;
but3Morpheoclick := false;
but1Deformclick := false;
but2Deformclick := false;
but3Deformclick := false;
but1Ansysclick := false;
but2Ansysclick := false;
but3Ansysclick := false;
but1Abaqusclick := false;
but2Abaqusclick := false;
but3Abaqusclick := false;  
model_read := false;
stress_interpolation_method := '';
package_to := 'abaqus';
pacage_from := 'abaqus';
end;


procedure TMainForm.Help2Click(Sender: TObject);
begin
{$IFDEF windows}
ShellExecute(Handle, 'open', 'help\main.html',nil,nil, SW_SHOWNORMAL);
{$ENDIF}
end;

procedure TMainForm.AbaqusVulcanClick(Sender: TObject);
begin
  pacage_from := 'vulcan';
  but1Abaqusclick := false;
  but2Abaqusclick := false;
  but3Abaqusclick := false;
  model_read := false;
  EditAbaqus1.Text :='';
  EditAbaqus2.Text := '';
  EditAbaqus3.Text := '';
  EditAbaqus1.Enabled := true;
  BitBtnAbaqus1.Enabled := true;
  OpenDialog1Abaqus.Filter := 'Vulcan mesh file(*.msh)|*.msh';
  OpenDialog2Abaqus.Filter := 'Vulcan result file(*.res)|*.res';
  EditAbaqus3.Enabled := true;
  BitBtnAbaqus2.Enabled := true;
end;

procedure TMainForm.AbaqusMorfeoClick(Sender: TObject);
begin
  pacage_from := 'morpheo';
  but1Abaqusclick := false;
  but2Abaqusclick := false;
  but3Abaqusclick := false;
  model_read := false;
  EditAbaqus1.Text :='';
  EditAbaqus2.Text := '';
  EditAbaqus3.Text := '';
EditAbaqus1.Enabled := false;
BitBtnAbaqus1.Enabled := false;
OpenDialog2Abaqus.Filter := 'Morpheo input/output file(*.vtu)|*.vtu';
end;

procedure TMainForm.AbaqusAbaqusClick(Sender: TObject);
begin
  pacage_from := 'abaqus';
  but1Abaqusclick := false;
  but2Abaqusclick := false;
  but3Abaqusclick := false;
  model_read := false;
  EditAbaqus1.Text :='';
  EditAbaqus2.Text := '';
  EditAbaqus3.Text := '';
  EditAbaqus1.Enabled := true;
  BitBtnAbaqus1.Enabled := true;
  OpenDialog1Abaqus.Filter := 'Abaqus input file(*.inp)|*.inp';
  OpenDialog3Abaqus.Filter := 'Abaqus output file(*.dat)|*.dat';
  EditAbaqus3.Enabled := true;
  BitBtnAbaqus2.Enabled := true;
end;

procedure TMainForm.AbaqusAnsysClick(Sender: TObject);
begin
  pacage_from := 'ansys';
  but1Abaqusclick := false;
  but2Abaqusclick := false;
  but3Abaqusclick := false;
  model_read := false;
  EditAbaqus1.Text :='';
  EditAbaqus2.Text := '';
  EditAbaqus3.Text := '';
  EditAbaqus1.Enabled := true;
  BitBtnAbaqus1.Enabled := true;
  OpenDialog1Abaqus.Filter := 'ANSYS input file (*.inp)|*.txt';
  OpenDialog2Abaqus.Filter := 'ANSYS output file (*.txt)|*.TXT';
  EditAbaqus3.Enabled := true;
  BitBtnAbaqus2.Enabled := true;

end;

procedure TMainForm.AbaqusMarcClick(Sender: TObject);
begin
  pacage_from := 'marc';
  but1Abaqusclick := false;
  but2Abaqusclick := false;
  but3Abaqusclick := false;
  model_read := false;
  EditAbaqus1.Text :='';
  EditAbaqus2.Text := '';
  EditAbaqus3.Text := '';
  EditAbaqus1.Enabled := true;
  BitBtnAbaqus1.Enabled := true;
  OpenDialog1Abaqus.Filter := 'Marc input file (*.t19)|*.t19';
  OpenDialog2Abaqus.Filter := 'Marc stress output file (*.70)|*.70';
  EditAbaqus3.Enabled := true;
  BitBtnAbaqus2.Enabled := true;
end;

procedure TMainForm.AbaqusDeformClick(Sender: TObject);
begin
  pacage_from := 'deform';
  but1Abaqusclick := false;
  but2Abaqusclick := false;
  but3Abaqusclick := false;
  model_read := false;
  EditAbaqus1.Text :='';
  EditAbaqus2.Text := '';
  EditAbaqus3.Text := '';
  OpenDialog2Abaqus.Filter := 'Deform input/output file(*.key)|*.key';
  EditAbaqus1.Enabled := false;
  BitBtnAbaqus1.Enabled := false;
end;

procedure TMainForm.RadioButtonAnsys1Click(Sender: TObject);
begin
  pacage_from := 'abaqus';
  but1ansysclick := false;
  but2ansysclick := false;
  but3ansysclick := false;
  model_read := false;
  editansys1.Text :='';
  editansys2.Text := '';
  editansys3.Text := '';
  editansys1.Enabled := true;
  bitbtnansys1.Enabled := true;
  opendialogansys1.Filter := 'Abaqus input file(*.inp)|*.inp';
  opendialogansys2.Filter := 'Abaqus output file(*.dat)|*.dat';
end;

procedure TMainForm.RadioButtonAnsys2Click(Sender: TObject);
begin
  pacage_from := 'ansys';
  but1ansysclick := false;
  but2ansysclick := false;
  but3ansysclick := false;
  model_read := false;
  editansys1.Text :='';
  editansys2.Text := '';
  editansys3.Text := '';
  opendialogansys1.Filter := 'ANSYS input file (*.inp)|*.inp';
  opendialogansys2.Filter := 'ANSYS output file (*.txt)|*.TXT';
  editansys1.Enabled := true;
  bitbtnansys1.Enabled := true;
end;

procedure TMainForm.RadioButtonAnsys3Click(Sender: TObject);
begin
pacage_from := 'marc';
but1ansysclick := false;
  but2ansysclick := false;
  but3ansysclick := false;
  model_read := false;
  editansys1.Text :='';
  editansys2.Text := '';
  editansys3.Text := '';
opendialogansys1.Filter := 'Marc input file (*.t19)|*.t19';
  opendialogansys2.Filter := 'Marc stress output file (*.70)|*.70';
  editansys1.Enabled := true;
  bitbtnansys1.Enabled := true;
end;

procedure TMainForm.RadioButtonAnsys4Click(Sender: TObject);
begin
pacage_from := 'deform';
 but1ansysclick := false;
  but2ansysclick := false;
  but3ansysclick := false;
  model_read := false;
  editansys1.Text :='';
  editansys2.Text := '';
  editansys3.Text := '';
   editansys1.Enabled := false;
  bitbtnansys1.Enabled := false;
  opendialogansys2.Filter := 'Deform input/output file(*.key)|*.key';
end;

procedure TMainForm.RadioButtonAnsys5Click(Sender: TObject);
begin
  pacage_from := 'vulcan';
  but1ansysclick := false;
  but2ansysclick := false;
  but3ansysclick := false;
  model_read := false;
  editansys1.Text :='';
  editansys2.Text := '';
  editansys3.Text := '';
  editansys1.Enabled := true;
  bitbtnansys1.Enabled := true;
  opendialogansys1.Filter := 'Vulcan mesh file(*.msh)|*.msh';
  opendialogansys2.Filter := 'Vulcan result file(*.res)|*.res';
end;

procedure TMainForm.RadioButtonAnsys6Click(Sender: TObject);
begin
pacage_from := 'morpheo';
but1ansysclick := false;
  but2ansysclick := false;
  but3ansysclick := false;
  model_read := false;
  editansys1.Text :='';
  editansys2.Text := '';
  editansys3.Text := '';
editansys1.Enabled := false;
bitbtnansys1.Enabled := false;
opendialogansys2.Filter := 'Morpheo input/output file(*.vtu)|*.vtu';
end;

procedure TMainForm.RadioButtonDeform1Click(Sender: TObject);
begin
pacage_from := 'abaqus';
but1deformclick := false;
  but2deformclick := false;
  but3deformclick := false;
  model_read := false;
  editdeform1.Text :='';
  editdeform2.Text := '';
  editdeform3.Text := '';
  editdeform1.Enabled := true;
  bitbtndeform1.Enabled := true;
  opendialogDeform1.Filter := 'Abaqus input file(*.inp)|*.inp';
  opendialogDeform2.Filter := 'Abaqus output file(*.dat)|*.dat';

end;

procedure TMainForm.RadioButtonDeform2Click(Sender: TObject);
begin
pacage_from := 'ansys';
but1deformclick := false;
  but2deformclick := false;
  but3deformclick := false;
  model_read := false;
  editdeform1.Text :='';
  editdeform2.Text := '';
  editdeform3.Text := '';
  editdeform1.Enabled := true;
  bitbtndeform1.Enabled := true;
  opendialogDeform1.Filter := 'ANSYS input file (*.inp)|*.inp';
  opendialogDeform2.Filter := 'ANSYS output file (*.txt)|*.TXT';
end;

procedure TMainForm.RadioButtonDeform3Click(Sender: TObject);
begin
pacage_from := 'marc';
but1deformclick := false;
  but2deformclick := false;
  but3deformclick := false;
  model_read := false;
  editdeform1.Text :='';
  editdeform2.Text := '';
  editdeform3.Text := '';
  opendialogdeform1.Filter := 'Marc input file (*.t19)|*.t19';
  opendialogdeform2.Filter := 'Marc stress output file (*.70)|*.70';
  editdeform1.Enabled := true;
  bitbtndeform1.Enabled := true;
end;

procedure TMainForm.RadioButtonDeform4Click(Sender: TObject);
begin
pacage_from := 'deform';
but1deformclick := false;
  but2deformclick := false;
  but3deformclick := false;
  model_read := false;
  editdeform1.Text :='';
  editdeform2.Text := '';
  editdeform3.Text := '';
  editdeform1.Enabled := false;
  bitbtndeform1.Enabled := false;
  opendialogDeform2.Filter := 'Deform input/output file (*.key)|*.key';
end;

procedure TMainForm.RadioButtonDeform5Click(Sender: TObject);
begin
pacage_from := 'vulcan';
but1deformclick := false;
  but2deformclick := false;
  but3deformclick := false;
  model_read := false;
  editdeform1.Text :='';
  editdeform2.Text := '';
  editdeform3.Text := '';
  editdeform1.Enabled := true;
  bitbtndeform1.Enabled := true;
  opendialogDeform1.Filter := 'Vulcan mesh file(*.msh)|*.msh';
  opendialogDeform2.Filter := 'Vulcan result file(*.res)|*.res';
end;

procedure TMainForm.RadioButtonDeform6Click(Sender: TObject);
begin
pacage_from := 'morpheo';
but1deformclick := false;
  but2deformclick := false;
  but3deformclick := false;
  model_read := false;
  editdeform1.Text :='';
  editdeform2.Text := '';
  editdeform3.Text := '';
editdeform1.Enabled := false;
bitbtndeform1.Enabled := false;
opendialogdeform2.Filter := 'Morpheo input/output file(*.vtu)|*.vtu';
end;



procedure TMainForm.RadioButtonMorpheo1Click(Sender: TObject);
begin
pacage_from := 'abaqus';
  but1morpheoclick := false;
  but2morpheoclick := false;
  but3morpheoclick := false;
  model_read := false;
  editmorpheo1.Text :='';
  editmorpheo2.Text := '';
  editmorpheo3.Text := '';
  editmorpheo1.Enabled := true;
  bitbtnmorpheo1.Enabled := true;
  opendialogMorpheo1.Filter := 'Abaqus input file(*.inp)|*.inp';
  opendialogMorpheo2.Filter := 'Abaqus output file(*.dat)|*.dat';

end;

procedure TMainForm.RadioButtonMorpheo2Click(Sender: TObject);
begin
pacage_from := 'ansys';
 but1morpheoclick := false;
  but2morpheoclick := false;
  but3morpheoclick := false;
  model_read := false;
  editmorpheo1.Text :='';
  editmorpheo2.Text := '';
  editmorpheo3.Text := '';
  editmorpheo1.Enabled := true;
  bitbtnmorpheo1.Enabled := true;
  opendialogMorpheo1.Filter := 'ANSYS input file (*.inp)|*.inp';
  opendialogMorpheo2.Filter := 'ANSYS output file (*.txt)|*.TXT';

end;

procedure TMainForm.RadioButtonMorpheo3Click(Sender: TObject);
begin
pacage_from := 'marc';
 but1morpheoclick := false;
  but2morpheoclick := false;
  but3morpheoclick := false;
  model_read := false;
  editmorpheo1.Text :='';
  editmorpheo2.Text := '';
  editmorpheo3.Text := '';
  editmorpheo1.Enabled := true;
  bitbtnmorpheo1.Enabled := true;
  opendialogMorpheo1.Filter := 'Mark input file (*.t19)|*.t19';
  opendialogMorpheo2.Filter := 'Mark stress output file (*.70)|*.70';
end;

procedure TMainForm.RadioButtonMorpheo4Click(Sender: TObject);
begin
pacage_from := 'deform';
 but1morpheoclick := false;
  but2morpheoclick := false;
  but3morpheoclick := false;
  model_read := false;
  editmorpheo1.Text :='';
  editmorpheo2.Text := '';
  editmorpheo3.Text := '';
  editmorpheo1.Enabled := false;
  bitbtnmorpheo1.Enabled := false;
  opendialogMorpheo2.Filter := 'Deform input/output file (*.key)|*.key';
end;

procedure TMainForm.RadioButtonMorpheo5Click(Sender: TObject);
begin
pacage_from := 'vulcan';
  but1morpheoclick := false;
  but2morpheoclick := false;
  but3morpheoclick := false;
  model_read := false;
  editmorpheo1.Text :='';
  editmorpheo2.Text := '';
  editmorpheo3.Text := '';
  editmorpheo1.Enabled := true;
  bitbtnmorpheo1.Enabled := true;
  opendialogMorpheo1.Filter := 'Vulcan mesh file(*.msh)|*.msh';
  opendialogMorpheo2.Filter := 'Vulcan result file(*.res)|*.res';
end;

procedure TMainForm.RadioButtonMorpheo6Click(Sender: TObject);
begin
pacage_from := 'morpheo';
 but1morpheoclick := false;
  but2morpheoclick := false;
  but3morpheoclick := false;
  model_read := false;
  editmorpheo1.Text :='';
  editmorpheo2.Text := '';
  editmorpheo3.Text := '';
editmorpheo1.Enabled := false;
bitbtnmorpheo1.Enabled := false;
opendialogmorpheo2.Filter := 'Morpheo input/output file(*.vtu)|*.vtu';
end;

procedure TMainForm.SavemodeltwoinXMLformat1Click(Sender: TObject);
begin
  if savedialogxml.Execute then
  begin
    obtain_nodes_in_element(Elements2,NodesInElement2);
    createXML2(savedialogxml.FileName,
            Nodes2,
            Elements2,
            NodesInElement2,
            Stress2,
            Displacements2,
            TotalStrain2,
            PlasticStrain2,
            AccumulatedStrain2);
  end
end;

procedure TMainForm.TabSheet10Enter(Sender: TObject);
begin
model_read := false;
package_to := 'morpheo';
end;

procedure TMainForm.TabSheet1Enter(Sender: TObject);
begin
 model_read := false;
 package_to := 'abaqus';
end;

procedure TMainForm.TabSheet2Enter(Sender: TObject);
begin
model_read := false;
package_to := 'ansys';
end;

procedure TMainForm.TabSheet3Enter(Sender: TObject);
begin
model_read := false;
package_to := 'marc';
end;

procedure TMainForm.TabSheet4Enter(Sender: TObject);
begin
model_read := false;
package_to := 'deform';
end;

procedure TMainForm.BitBtnAbaqusCalculateClick(Sender: TObject);
begin
Application.Minimize;
MainForm.Caption := 'Calculating......';
application.Title := 'Calculating......';


 if RadioButtonDMUFP.Checked then
 begin
           DMUFPWrapper(strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxAbaqusDisplacement.Enabled)and(CheckBoxAbaqusDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           DMUFPWrapper(strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAbaqusStress.Enabled)and(CheckBoxAbaqusStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAbaqusTotalStrain.Enabled)and(CheckBoxAbaqusTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAbaqusPlasticStrain.Enabled)and(CheckBoxAbaqusPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAbaqusAccumulatedStrain.Enabled)and(CheckBoxAbaqusAccumulatedStrain.Checked));
 end;
 if RadioButtonNPM.Checked then
 begin
           NPMWrapper(  strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxAbaqusDisplacement.Enabled)and(CheckBoxAbaqusDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           NPMWrapper(  strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAbaqusStress.Enabled)and(CheckBoxAbaqusStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAbaqusTotalStrain.Enabled)and(CheckBoxAbaqusTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAbaqusPlasticStrain.Enabled)and(CheckBoxAbaqusPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAbaqusAccumulatedStrain.Enabled)and(CheckBoxAbaqusAccumulatedStrain.Checked));
 end;
 if RadioButtonDMUE.Checked then
 begin
    obtain_nodes_in_element(Elements1,NodesInElement1);
          DMUEWrapper  (strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxAbaqusDisplacement.Enabled)and(CheckBoxAbaqusDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           DMUEWrapper (strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAbaqusStress.Enabled)and(CheckBoxAbaqusStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAbaqusTotalStrain.Enabled)and(CheckBoxAbaqusTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAbaqusPlasticStrain.Enabled)and(CheckBoxAbaqusPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAbaqusAccumulatedStrain.Enabled)and(CheckBoxAbaqusAccumulatedStrain.Checked));
 end;
 if RadioButtonMUSF.Checked then
 begin
    obtain_nodes_in_element(Elements1,NodesInElement1);
          MUESFWrapper (strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxAbaqusDisplacement.Enabled)and(CheckBoxAbaqusDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);
          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           MUESFWrapper(strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAbaqusStress.Enabled)and(CheckBoxAbaqusStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAbaqusTotalStrain.Enabled)and(CheckBoxAbaqusTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAbaqusPlasticStrain.Enabled)and(CheckBoxAbaqusPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAbaqusAccumulatedStrain.Enabled)and(CheckBoxAbaqusAccumulatedStrain.Checked));
 end;

BitBtnSave1.Enabled := true;
BitBtnSave2.Enabled := true;
MainForm.Caption := 'FEDES';
application.Title := 'FEDES';
{ FlashWindow (application.Handle, True) ; }
end;

procedure TMainForm.BitBtnAbaqusCloseClick(Sender: TObject);
begin
MainForm.Close;
end;

procedure TMainForm.BitBtn20Click(Sender: TObject);
var
i : integer;
begin

end;

procedure TMainForm.BitBtn26Click(Sender: TObject);
begin
MainForm.Close;
end;

procedure TMainForm.BitBtnDeformCalculateClick(Sender: TObject);
begin
MainForm.Caption := 'Calculating......';
application.Title := 'Calculating......';


 if RadioButtonDeformDMUFP.Checked then
 begin
           DMUFPWrapper(strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxDeformDisplacement.Enabled)and(CheckBoxDeformDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           DMUFPWrapper(strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxDeformStress.Enabled)and(CheckBoxDeformStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxDeformTotalStrain.Enabled)and(CheckBoxDeformTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxDeformPlasticStrain.Enabled)and(CheckBoxDeformPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxDeformAccumulatedStrain.Enabled)and(CheckBoxDeformAccumulatedStrain.Checked));
 end;
 if RadioButtonDeformNPM.Checked then
 begin
           NPMWrapper(  strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxDeformDisplacement.Enabled)and(CheckBoxDeformDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           NPMWrapper(  strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxDeformStress.Enabled)and(CheckBoxDeformStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxDeformTotalStrain.Enabled)and(CheckBoxDeformTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxDeformPlasticStrain.Enabled)and(CheckBoxDeformPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxDeformAccumulatedStrain.Enabled)and(CheckBoxDeformAccumulatedStrain.Checked));
 end;
 if RadioButtonDeformDMUE.Checked then
 begin
    obtain_nodes_in_element(Elements1,NodesInElement1);
          DMUEWrapper  (strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxDeformDisplacement.Enabled)and(CheckBoxDeformDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           DMUEWrapper (strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxDeformStress.Enabled)and(CheckBoxDeformStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxDeformTotalStrain.Enabled)and(CheckBoxDeformTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxDeformPlasticStrain.Enabled)and(CheckBoxDeformPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxDeformAccumulatedStrain.Enabled)and(CheckBoxDeformAccumulatedStrain.Checked));
 end;
 if RadioButtonDeformMUESF.Checked then
 begin
    obtain_nodes_in_element(Elements1,NodesInElement1);
          MUESFWrapper (strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxDeformDisplacement.Enabled)and(CheckBoxDeformDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           MUESFWrapper(strtoreal(EditDeformStress.text),
                 strtoreal(EditDeformDisplacement.text),
                 strtoreal(EditDeformTotalStrain.text),
                 strtoreal(EditDeformPlasticStrain.text),
                 strtoreal(EditDeformAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxDeformStress.Enabled)and(CheckBoxDeformStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxDeformTotalStrain.Enabled)and(CheckBoxDeformTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxDeformPlasticStrain.Enabled)and(CheckBoxDeformPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxDeformAccumulatedStrain.Enabled)and(CheckBoxDeformAccumulatedStrain.Checked));

 end;

BitBtnDeformSave.Enabled := true;
MainForm.Caption := 'FEDES';
application.Title := 'FEDES';
end;

procedure TMainForm.BitBtnAbaqus1Click(Sender: TObject);
begin
if OpenDialog1Abaqus.Execute then
begin
EditAbaqus1.Text := OpenDialog1Abaqus.FileName;
but1Abaqusclick := true;
end;
end;

procedure TMainForm.BitBtnAbaqus2Click(Sender: TObject);
begin
if OpenDialog2Abaqus.Execute then
begin
EditAbaqus2.Text := OpenDialog2Abaqus.FileName;
but2Abaqusclick := true;
end;
end;

procedure TMainForm.BitBtnAbaqus3Click(Sender: TObject);
begin
if OpenDialog3Abaqus.Execute then
begin
EditAbaqus3.Text := OpenDialog3Abaqus.FileName;
but3Abaqusclick := true;
end;
end;

procedure TMainForm.BitBtnAbaqus4Click(Sender: TObject);
begin
if ((EditAbaqus1.Text <> '')or(EditAbaqus1.Enabled=false)) and (EditAbaqus2.Text <> '') and (EditAbaqus3.Text <> '') then
begin
ClearRAM;
CheckBoxAbaqusStress.Enabled := false;
CheckBoxAbaqusDisplacement.Enabled := false;
CheckBoxAbaqusPlasticStrain.Enabled := false;
CheckBoxAbaqusTotalStrain.Enabled := false;
CheckBoxAbaqusAccumulatedStrain.Enabled := false;

CheckBoxAbaqusStress.Checked := True;
CheckBoxAbaqusDisplacement.Checked := True;
CheckBoxAbaqusPlasticStrain.Checked := True;
CheckBoxAbaqusTotalStrain.Checked := True;
CheckBoxAbaqusAccumulatedStrain.Checked := True;

EditStresses.Enabled := false;
EditDisplacements.Enabled := false;
EditTotalStrains.Enabled := false;
EditPlasticStrains.Enabled := false;
EditAccumulatedStrain.Enabled := false;

ProgressBarAbaqus1.Position := 0;

BitBtnAbaqusCalculate.Enabled := false;
BitBtnSave1.Enabled := false;
BitBtnSave2.Enabled := false;


//================== Reading data ===============================================
if AbaqusAbaqus.Checked then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        abaqus_input_read(EditAbaqus1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        abaqus_output_read(EditAbaqus2.text,
                           Length(nodes1),
                           Stress1,
                           Displacements1,
                           TotalStrain1,
                           PlasticStrain1,
                           AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        abaqus_input_read(EditAbaqus3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAbaqus1.Position := 100;
end;
if AbaqusAnsys.Checked then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        {if ExtractFileExt(opendialogansys3.FileName)='.inp' then

        Ansys_input_read(ProgressBarAbaqus1,
                          EditAbaqus1.text,
                          Nodes1,
                          Elements1);

        if ExtractFileExt(opendialogansys3.FileName)='.txt' then
        }

        ansys_input_read_lis(EditAbaqus1.text,
                          Nodes1,
                          Elements1);

        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Ansys_output_read(EditAbaqus2.text,
                           length(Nodes1),
                           Displacements1,
                           TotalStrain1,
                           Stress1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        abaqus_input_read(EditAbaqus3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAbaqus1.Position := 100;
end;
if AbaqusMarc.Checked then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        Marc_input_output_read(EditAbaqus1.text,
                               Nodes1,
                               Elements1,
                               Displacements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Marc_stress_output_read(EditAbaqus2.text,
                                Stress1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        abaqus_input_read(EditAbaqus3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAbaqus1.Position := 100;
end;

if AbaqusDeform.Checked then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        deform_input_output_read(EditAbaqus2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        abaqus_input_read(EditAbaqus3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAbaqus1.Position := 100;
end;
if AbaqusVulcan.Checked then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        vulcan_input_read(EditAbaqus1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        vulcan_output_read(EditAbaqus2.text,
                           Stress1,
                           Displacements1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        abaqus_input_read(EditAbaqus3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAbaqus1.Position := 100;
end;
if AbaqusMorfeo.Checked then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        morpheo_input_output_read(XMLDocument1,
                                 EditAbaqus2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 TotalStrain1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        abaqus_input_read(EditAbaqus3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAbaqus1.Position := 100;
end;

BitBtnAbaqusCalculate.Enabled  := true;

//===================== Activate Check boxes for mapping =======================
if Stress1 <> nil then
CheckBoxAbaqusStress.Enabled := true;
if Displacements1 <> nil then
CheckBoxAbaqusDisplacement.Enabled := true;
if PlasticStrain1 <> nil then
CheckBoxAbaqusPlasticStrain.Enabled := true;
if TotalStrain1 <> nil then
CheckBoxAbaqusTotalStrain.Enabled := true;
if AccumulatedStrain1 <> nil then
CheckBoxAbaqusAccumulatedStrain.Enabled := true;
//==================== Activate Edit boxes for the scale factor ================
if Stress1 <> nil then
EditStresses.Enabled := true;
if Displacements1 <> nil then
EditDisplacements.Enabled := true;
if PlasticStrain1 <> nil then
EditPlasticStrains.Enabled := true;
if TotalStrain1 <> nil then
EditTotalStrains.Enabled := true;
if AccumulatedStrain1 <> nil then
EditAccumulatedStrain.Enabled := true;
end
else
begin
   if EditAbaqus1.Text = '' then
   showmessage('Please append an input file for model one!')
   else if EditAbaqus2.Text = '' then
   showmessage('Please append an output file for model one!')
   else if EditAbaqus3.Text = '' then
   showmessage('Please append an input file for model two!');
end;

end;



procedure TMainForm.BitBtn30Click(Sender: TObject);
var
printbuf : textfile;
j : integer;
begin

end;

procedure TMainForm.BitBtn38Click(Sender: TObject);
begin
MainForm.Close;
end;

procedure TMainForm.BitBtn6Click(Sender: TObject);
begin
MainForm.Close;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
form_about.Show;
end;

procedure TMainForm.xml1Click(Sender: TObject);
begin
//create_xml1(savedialogxml);
end;

procedure TMainForm.xml2Click(Sender: TObject);
begin
//create_xml2(savedialogxml);
end;

procedure TMainForm.BitBtnAnsys1Click(Sender: TObject);
begin
if opendialogAnsys1.Execute then
begin
editAnsys1.Text := opendialogAnsys1.FileName;
but1Ansysclick := true;
end;
end;

procedure TMainForm.BitBtnAnsys2Click(Sender: TObject);
begin
if opendialogAnsys2.Execute then
begin
editAnsys2.Text := opendialogAnsys2.FileName;
but2Ansysclick := true;
end;
end;

procedure TMainForm.BitBtnAnsys3Click(Sender: TObject);
begin
if opendialogAnsys3.Execute then
begin
editAnsys3.Text := opendialogAnsys3.FileName;
but3Ansysclick := true;
end;
end;

procedure TMainForm.BitBtnAnsys4Click(Sender: TObject);
begin
if opendialogAnsys4.Execute then
begin
editAnsys4.Text := opendialogAnsys4.FileName;
but4Ansysclick := true;
end;
end;

procedure TMainForm.BitBtnAnsys5Click(Sender: TObject);
begin
if ((EditAnsys1.Text <> '')or(EditAnsys1.Enabled=false)) and (EditAnsys2.Text <> '') and (EditAnsys3.Text <> '') and (EditAnsys4.Text <> '') then
begin
ClearRAM;
CheckBoxAnsysStress.Enabled := false;
CheckBoxAnsysDisplacement.Enabled := false;
CheckBoxAnsysPlasticStrain.Enabled := false;
CheckBoxAnsysTotalStrain.Enabled := false;
CheckBoxAnsysAccumulatedStrain.Enabled := false;

CheckBoxAnsysStress.Checked := true;
CheckBoxAnsysDisplacement.Checked := true;
CheckBoxAnsysPlasticStrain.Checked := true;
CheckBoxAnsysTotalStrain.Checked := true;
CheckBoxAnsysAccumulatedStrain.Checked := true;

EditAnsysStress.Enabled := false;
EditAnsysDisplacement.Enabled := false;
EditAnsysTotalStrain.Enabled := false;
EditAnsysPlasticStrain.Enabled := false;
EditAnsysAccumulatedStrain.Enabled := false;

ProgressBarAnsys1.Position := 0;

BitBtnAnsysCalculate.Enabled := false;
BitBtnAnsysSave.Enabled := false;

if RadioButtonAnsys1.checked then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        abaqus_input_read(EditAnsys1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        abaqus_output_read(EditAnsys2.text,
                           Length(nodes1),
                           Stress1,
                           Displacements1,
                           TotalStrain1,
                           PlasticStrain1,
                           AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        ansys_input_read(EditAnsys3.text,
                          Nodes2,
                          Elements2);
        ansys_input_integration_points_read(EditAnsys4.text,
                                            Nodes2Integration);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAnsys1.Position := 100;
end;
if RadioButtonAnsys2.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        Ansys_input_read(EditAnsys1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Ansys_output_read(EditAnsys2.text,
                           length(Nodes1),
                           Displacements1,
                           TotalStrain1,
                           Stress1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        ansys_input_read(EditAnsys3.text,
                          Nodes2,
                          Elements2);
        ansys_input_integration_points_read(EditAnsys4.text,
                                            Nodes2Integration);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAnsys1.Position := 100;
end;
if RadioButtonAnsys3.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        Marc_input_output_read(EditAnsys1.text,
                               Nodes1,
                               Elements1,
                               Displacements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Marc_stress_output_read(EditAnsys2.text,
                                Stress1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        ansys_input_read(EditAnsys3.text,
                          Nodes2,
                          Elements2);
        ansys_input_integration_points_read(EditAnsys4.text,
                                            Nodes2Integration);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAnsys1.Position := 100;
end;
if RadioButtonAnsys4.checked  then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        deform_input_output_read(EditAnsys2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        ansys_input_read(EditAnsys3.text,
                          Nodes2,
                          Elements2);
        ansys_input_integration_points_read(EditAnsys4.text,
                                            Nodes2Integration);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAnsys1.Position := 100;
end;
if RadioButtonAnsys5.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        vulcan_input_read(EditAnsys1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        vulcan_output_read(EditAnsys2.text,
                           Stress1,
                           Displacements1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        if ExtractFileExt(opendialogansys3.FileName)='.inp' then

        ansys_input_read(EditAnsys3.text,
                          Nodes2,
                          Elements2);

        if ExtractFileExt(opendialogansys3.FileName)='.txt' then

        ansys_input_read_lis(EditAnsys3.text,
                          Nodes2,
                          Elements2);

        ansys_input_integration_points_read(EditAnsys4.text,
                                            Nodes2Integration);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAnsys1.Position := 100;
end;
if RadioButtonAnsys6.checked then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        morpheo_input_output_read(XMLDocument1,
                                 EditAnsys2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 TotalStrain1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        ansys_input_read(EditAnsys3.text,
                          Nodes2,
                          Elements2);
        ansys_input_integration_points_read(EditAnsys4.text,
                                            Nodes2Integration);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarAnsys1.Position := 100;
end;
BitBtnAnsysCalculate.Enabled := true;
BitBtnAnsysSave.Enabled := true;
//===================== Activate Check boxes for mapping =======================
if Stress1 <> nil then
CheckBoxAnsysStress.Enabled := true;
if Displacements1 <> nil then
CheckBoxAnsysDisplacement.Enabled := true;
if PlasticStrain1 <> nil then
CheckBoxAnsysPlasticStrain.Enabled := true;
if TotalStrain1 <> nil then
CheckBoxAnsysTotalStrain.Enabled := true;
if AccumulatedStrain1 <> nil then
CheckBoxAnsysAccumulatedStrain.Enabled := true;
//==================== Activate Edit boxes for the scale factor ================
if Stress1 <> nil then
EditAnsysStress.Enabled := true;
if Displacements1 <> nil then
EditAnsysDisplacement.Enabled := true;
if PlasticStrain1 <> nil then
EditAnsysPlasticStrain.Enabled := true;
if TotalStrain1 <> nil then
EditAnsysTotalStrain.Enabled := true;
if AccumulatedStrain1 <> nil then
EditAnsysAccumulatedStrain.Enabled := true;
end
else
if EditAnsys1.Text = '' then
   showmessage('Please append an input file for model one!')
   else if EditAnsys2.Text = '' then
   showmessage('Please append an output file for model one!')
   else if EditAnsys3.Text = '' then
   showmessage('Please append an input file for model two!')
   else if EditAnsys4.Text = '' then
   showmessage('Please append an input file with the coordinates of the integration points for model two!');
end;



procedure TMainForm.BitBtnAnsysCalculateClick(Sender: TObject);
begin
MainForm.Caption := 'Calculating......';
application.Title := 'Calculating......';


 if RadioButtonAnsysDMUFP.Checked then
 begin
           DMUFPWrapper(strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxAnsysDisplacement.Enabled)and(CheckBoxAnsysDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);


           DMUFPWrapper(strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAnsysStress.Enabled)and(CheckBoxAnsysStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAnsysTotalStrain.Enabled)and(CheckBoxAnsysTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAnsysPlasticStrain.Enabled)and(CheckBoxAnsysPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAnsysAccumulatedStrain.Enabled)and(CheckBoxAnsysAccumulatedStrain.Checked));
 end;
 if RadioButtonAnsysNPM.Checked then
 begin
           NPMWrapper(  strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxAnsysDisplacement.Enabled)and(CheckBoxAnsysDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);


           NPMWrapper(  strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAnsysStress.Enabled)and(CheckBoxAnsysStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAnsysTotalStrain.Enabled)and(CheckBoxAnsysTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAnsysPlasticStrain.Enabled)and(CheckBoxAnsysPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAnsysAccumulatedStrain.Enabled)and(CheckBoxAnsysAccumulatedStrain.Checked));
 end;
 if RadioButtonAnsysDMUE.Checked then
 begin
          obtain_nodes_in_element(Elements1,NodesInElement1);
          DMUEWrapper  (strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxAnsysDisplacement.Enabled)and(CheckBoxAnsysDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);


           DMUEWrapper (strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAnsysStress.Enabled)and(CheckBoxAnsysStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAnsysTotalStrain.Enabled)and(CheckBoxAnsysTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAnsysPlasticStrain.Enabled)and(CheckBoxAnsysPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAnsysAccumulatedStrain.Enabled)and(CheckBoxAnsysAccumulatedStrain.Checked));
 end;
 if RadioButtonAnsysMUESF.Checked then
 begin
          obtain_nodes_in_element(Elements1,NodesInElement1);
          MUESFWrapper (strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxAnsysDisplacement.Enabled)and(CheckBoxAnsysDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);


           MUESFWrapper(strtoreal(EditStresses.text),
                 strtoreal(EditDisplacements.text),
                 strtoreal(EditTotalStrains.text),
                 strtoreal(EditPlasticStrains.text),
                 strtoreal(EditAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxAnsysStress.Enabled)and(CheckBoxAnsysStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxAnsysTotalStrain.Enabled)and(CheckBoxAnsysTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxAnsysPlasticStrain.Enabled)and(CheckBoxAnsysPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxAnsysAccumulatedStrain.Enabled)and(CheckBoxAnsysAccumulatedStrain.Checked));

 end;
BitBtnAnsysSave.Enabled := true;
MainForm.Caption := 'FEDES';
application.Title := 'FEDES';
end;

procedure TMainForm.BitBtnAnsysClearClick(Sender: TObject);
begin
ClearRAM;
CheckBoxAnsysStress.Enabled := false;
CheckBoxAnsysDisplacement.Enabled := false;
CheckBoxAnsysPlasticStrain.Enabled := false;
CheckBoxAnsysTotalStrain.Enabled := false;
CheckBoxAnsysAccumulatedStrain.Enabled := false;

CheckBoxAnsysStress.Checked := true;
CheckBoxAnsysDisplacement.Checked := true;
CheckBoxAnsysPlasticStrain.Checked := true;
CheckBoxAnsysTotalStrain.Checked := true;
CheckBoxAnsysAccumulatedStrain.Checked := true;

EditAnsysStress.Enabled := false;
EditAnsysDisplacement.Enabled := false;
EditAnsysTotalStrain.Enabled := false;
EditAnsysPlasticStrain.Enabled := false;
EditAnsysAccumulatedStrain.Enabled := false;

EditAnsysStress.text := '0';
EditAnsysDisplacement.text := '0';
EditAnsysTotalStrain.text := '0';
EditAnsysPlasticStrain.text := '0';
EditAnsysAccumulatedStrain.text := '0';

ProgressBarAnsys1.Position := 0;

BitBtnAnsysCalculate.Enabled := false;
BitBtnAnsysSave.Enabled := false;
end;

procedure TMainForm.BitBtnAnsysCloseClick(Sender: TObject);
begin
MainForm.Close;
end;

procedure TMainForm.BitBtnAnsysSaveClick(Sender: TObject);
begin
  if savedialogAnsys1.Execute then
    CreateAnsysFiles(SaveDialogAnsys1.FileName,
                 Nodes2,
                 Nodes2Integration,
                 Elements2,
                 NodesInElement2,
                 Stress2,
                 Displacements2,
                 TotalStrain2,
                 PlasticStrain2,
                 AccumulatedStrain2)
end;

procedure TMainForm.BitBtnClearClick(Sender: TObject);
begin
ClearRAM;
CheckBoxAbaqusStress.Enabled := false;
CheckBoxAbaqusDisplacement.Enabled := false;
CheckBoxAbaqusPlasticStrain.Enabled := false;
CheckBoxAbaqusTotalStrain.Enabled := false;
CheckBoxAbaqusAccumulatedStrain.Enabled := false;

CheckBoxAbaqusStress.Checked := True;
CheckBoxAbaqusDisplacement.Checked := True;
CheckBoxAbaqusPlasticStrain.Checked := True;
CheckBoxAbaqusTotalStrain.Checked := True;
CheckBoxAbaqusAccumulatedStrain.Checked := True;

EditStresses.Enabled := false;
EditDisplacements.Enabled := false;
EditTotalStrains.Enabled := false;
EditPlasticStrains.Enabled := false;
EditAccumulatedStrain.Enabled := false;

EditStresses.text := '0';
EditDisplacements.text := '0';
EditTotalStrains.text := '0';
EditPlasticStrains.text := '0';
EditAccumulatedStrain.text := '0';

ProgressBarAbaqus1.Position := 0;

BitBtnAbaqusCalculate.Enabled := false;
BitBtnSave1.Enabled := false;
BitBtnSave2.Enabled := false;
end;

procedure TMainForm.BitBtnDeform1Click(Sender: TObject);
begin
if opendialogDeform1.Execute then
begin
editDeform1.Text := opendialogDeform1.FileName;
but1Deformclick := true;
end;
end;

procedure TMainForm.BitBtnDeform3Click(Sender: TObject);
begin
if opendialogDeform3.Execute then
begin
editDeform3.Text := opendialogDeform3.FileName;
but3Deformclick := true;
end;
end;

procedure TMainForm.BitBtnDeform4Click(Sender: TObject);
begin
if ((EditDeform1.Text <> '')or(EditDeform1.Enabled=false)) and (EditDeform2.Text <> '') and (EditDeform3.Text <> '') then
begin
ClearRAM;
CheckBoxDeformStress.Enabled := false;
CheckBoxDeformDisplacement.Enabled := false;
CheckBoxDeformPlasticStrain.Enabled := false;
CheckBoxDeformTotalStrain.Enabled := false;
CheckBoxDeformAccumulatedStrain.Enabled := false;

CheckBoxDeformStress.Checked := True;
CheckBoxDeformDisplacement.Checked := True;
CheckBoxDeformPlasticStrain.Checked := True;
CheckBoxDeformTotalStrain.Checked := True;
CheckBoxDeformAccumulatedStrain.Checked := True;

EditDeformStress.Enabled := false;
EditDeformDisplacement.Enabled := false;
EditDeformTotalStrain.Enabled := false;
EditDeformPlasticStrain.Enabled := false;
EditDeformAccumulatedStrain.Enabled := false;

ProgressBarDeform1.Position := 0;

BitBtnDeformCalculate.Enabled := false;
BitBtnDeformSave.Enabled := false;
if RadioButtonDeform1.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        abaqus_input_read(EditDeform1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        abaqus_output_read(EditDeform2.text,
                           Length(nodes1),
                           Stress1,
                           Displacements1,
                           TotalStrain1,
                           PlasticStrain1,
                           AccumulatedStrain1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        deform_input_read(EditDeform3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarDeform1.Position := 100;
end;
if RadioButtonDeform2.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        Ansys_input_read(EditDeform1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Ansys_output_read(EditDeform2.text,
                           length(Nodes1),
                           Displacements1,
                           TotalStrain1,
                           Stress1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        deform_input_read(EditDeform3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarDeform1.Position := 100;
end;
if RadioButtonDeform3.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        Marc_input_output_read(EditDeform1.text,
                               Nodes1,
                               Elements1,
                               Displacements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Marc_stress_output_read(EditDeform2.text,
                                Stress1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        deform_input_read(EditDeform3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarDeform1.Position := 100;
end;
if RadioButtonDeform4.checked  then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        deform_input_output_read(EditDeform2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        deform_input_read(EditDeform3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarDeform1.Position := 100;
end;
if RadioButtonDeform5.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        vulcan_input_read(EditDeform1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        vulcan_output_read(EditDeform2.text,
                           Stress1,
                           Displacements1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        deform_input_read(EditDeform3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarDeform1.Position := 100;
end;
if RadioButtonDeform6.checked then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        morpheo_input_output_read(XMLDocument1,
                                 EditDeform2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 TotalStrain1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        deform_input_read(EditDeform3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarDeform1.Position := 100;
end;
//===================== Activate Check boxes for mapping =======================
if Stress1 <> nil then
CheckBoxDeformStress.Enabled := true;
if Displacements1 <> nil then
CheckBoxDeformDisplacement.Enabled := true;
if PlasticStrain1 <> nil then
CheckBoxDeformPlasticStrain.Enabled := true;
if TotalStrain1 <> nil then
CheckBoxDeformTotalStrain.Enabled := true;
if AccumulatedStrain1 <> nil then
CheckBoxDeformAccumulatedStrain.Enabled := true;
//==================== Activate Edit boxes for the scale factor ================
if Stress1 <> nil then
EditDeformStress.Enabled := true;
if Displacements1 <> nil then
EditDeformDisplacement.Enabled := true;
if PlasticStrain1 <> nil then
EditDeformPlasticStrain.Enabled := true;
if TotalStrain1 <> nil then
EditDeformTotalStrain.Enabled := true;
if AccumulatedStrain1 <> nil then
EditDeformAccumulatedStrain.Enabled := true;
end
else
begin
   if EditDeform1.Text = '' then
   showmessage('Please append an input file for model one!')
   else if EditDeform2.Text = '' then
   showmessage('Please append an output file for model one!')
   else if EditDeform3.Text = '' then
   showmessage('Please append an input file for model two!');
end;
end;

procedure TMainForm.BitBtnDeformSaveClick(Sender: TObject);
begin
if SaveDialogDeform1.Execute then
CreateDeformFile(EditDeform3.Text,
                 SaveDialogDeform1.FileName,
                 Nodes2,
                 Elements2,
                 NodesInElement2,
                 Stress2,
                 Displacements2,
                 TotalStrain2,
                 PlasticStrain2,
                 AccumulatedStrain2);
end;

procedure TMainForm.BitBtnDefrom2Click(Sender: TObject);
begin
if opendialogDeform2.Execute then
begin
editDeform2.Text := opendialogDeform2.FileName;
but2Deformclick := true;
end;
end;



procedure TMainForm.BitBtnMorpheo1Click(Sender: TObject);
begin
if opendialogMorpheo1.Execute then
begin
editMorpheo1.Text := opendialogMorpheo1.FileName;
but1Morpheoclick := true;
end;
end;

procedure TMainForm.BitBtnMorpheo2Click(Sender: TObject);
begin
if opendialogMorpheo2.Execute then
begin
editMorpheo2.Text := opendialogMorpheo2.FileName;
but2Morpheoclick := true;
end;
end;

procedure TMainForm.BitBtnMorpheo3Click(Sender: TObject);
begin
if opendialogMorpheo3.Execute then
begin
editMorpheo3.Text := opendialogMorpheo3.FileName;
but3Morpheoclick := true;
end;
end;

procedure TMainForm.BitBtnMorpheo4Click(Sender: TObject);
begin
if ((EditMorpheo1.Text <> '')or(EditMorpheo1.Enabled=false)) and (EditMorpheo2.Text <> '') and (EditMorpheo3.Text <> '') then
begin
ClearRAM;
CheckBoxMorpheoStress.Enabled := false;
CheckBoxMorpheoDisplacement.Enabled := false;
CheckBoxMorpheoPlasticStrain.Enabled := false;
CheckBoxMorpheoTotalStrain.Enabled := false;
CheckBoxMorpheoAccumulatedStrain.Enabled := false;

CheckBoxMorpheoStress.Checked := True;
CheckBoxMorpheoDisplacement.Checked := True;
CheckBoxMorpheoPlasticStrain.Checked := True;
CheckBoxMorpheoTotalStrain.Checked := True;
CheckBoxMorpheoAccumulatedStrain.Checked := True;

EditMorpheoStress.Enabled := false;
EditMorpheoDisplacement.Enabled := false;
EditMorpheoTotalStrain.Enabled := false;
EditMorpheoPlasticStrain.Enabled := false;
EditMorpheoAccumulatedStrain.Enabled := false;

EditMorpheoStress.text := '0';
EditMorpheoDisplacement.text := '0';
EditMorpheoTotalStrain.text := '0';
EditMorpheoPlasticStrain.text := '0';
EditMorpheoAccumulatedStrain.text := '0';

ProgressBarMorpheo1.Position := 0;

BitBtnMorpheoCalculate.Enabled := false;
BitBtnMorpheoSave.Enabled := false;
if RadioButtonMorpheo1.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        abaqus_input_read(EditMorpheo1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        abaqus_output_read(EditMorpheo2.text,
                           Length(nodes1),
                           Stress1,
                           Displacements1,
                           TotalStrain1,
                           PlasticStrain1,
                           AccumulatedStrain1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        morpheo_input_read(XMLDocument1,
                          EditMorpheo3.text,
                          Nodes2,
                          Elements2);
        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarMorpheo1.Position := 100;
end;
if RadioButtonMorpheo2.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        Ansys_input_read(EditMorpheo1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Ansys_output_read(EditMorpheo2.text,
                           length(Nodes1),
                           Displacements1,
                           TotalStrain1,
                           Stress1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        morpheo_input_read(XMLDocument1,
                          EditMorpheo3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarMorpheo1.Position := 100;
end;
if RadioButtonMorpheo3.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        Marc_input_output_read(EditMorpheo1.text,
                               Nodes1,
                               Elements1,
                               Displacements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        Marc_stress_output_read(EditMorpheo2.text,
                                Stress1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        morpheo_input_read(XMLDocument1,
                          EditMorpheo3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarMorpheo1.Position := 100;
end;
if RadioButtonMorpheo4.checked  then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        deform_input_output_read(EditMorpheo2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        morpheo_input_read(XMLDocument1,
                          EditMorpheo3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarMorpheo1.Position := 100;
end;
if RadioButtonMorpheo5.checked  then
begin
        MainForm.Caption := 'Reading the input file for model one';
        application.Title := 'Reading the input file for model one';
        vulcan_input_read(EditMorpheo1.text,
                          Nodes1,
                          Elements1);
        MainForm.Caption := 'Reading the output file for model one';
        application.Title := 'Reading the output file for model one';
        vulcan_output_read(EditMorpheo2.text,
                           Stress1,
                           Displacements1);
        InsertTotalDisplacements();
       MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        morpheo_input_read(XMLDocument1,
                          EditMorpheo3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarMorpheo1.Position := 100;
end;
if RadioButtonMorpheo6.checked then
begin
        MainForm.Caption := 'Reading the input and the output file for model one';
        application.Title := 'Reading the input and the output file for model one';
        morpheo_input_output_read(XMLDocument1,
                                 EditMorpheo2.text,
                                 Nodes1,
                                 Elements1,
                                 Stress1,
                                 Displacements1,
                                 TotalStrain1,
                                 AccumulatedStrain1);
        InsertTotalDisplacements();
        MainForm.Caption := 'Reading the input file for model two';
        application.Title := 'Reading the input file for model two';
        morpheo_input_read(XMLDocument1,
                          EditMorpheo3.text,
                          Nodes2,
                          Elements2);

        MainForm.Caption := 'FEDES';
        application.Title := 'FEDES';
        ProgressBarMorpheo1.Position := 100;
end
else
begin
   if EditMorpheo1.Text = '' then
   showmessage('Please append an input file for model one!')
   else if EditMorpheo2.Text = '' then
   showmessage('Please append an output file for model one!')
   else if EditMorpheo3.Text = '' then
   showmessage('Please append an input file for model two!');
end;
end;
//===================== Activate Check boxes for mapping =======================
if Stress1 <> nil then
CheckBoxMorpheoStress.Enabled := true;
if Displacements1 <> nil then
CheckBoxMorpheoDisplacement.Enabled := true;
if PlasticStrain1 <> nil then
CheckBoxMorpheoPlasticStrain.Enabled := true;
if TotalStrain1 <> nil then
CheckBoxMorpheoTotalStrain.Enabled := true;
if AccumulatedStrain1 <> nil then
CheckBoxMorpheoAccumulatedStrain.Enabled := true;
//==================== Activate Edit boxes for the scale factor ================
if Stress1 <> nil then
EditMorpheoStress.Enabled := true;
if Displacements1 <> nil then
EditMorpheoDisplacement.Enabled := true;
if PlasticStrain1 <> nil then
EditMorpheoPlasticStrain.Enabled := true;
if TotalStrain1 <> nil then
EditMorpheoTotalStrain.Enabled := true;
if AccumulatedStrain1 <> nil then
EditMorpheoAccumulatedStrain.Enabled := true;
end;

procedure TMainForm.BitBtnMorpheoCalculateClick(Sender: TObject);
begin
MainForm.Caption := 'Calculating......';
application.Title := 'Calculating......';


 if RadioButtonMorpheoDMUFP.Checked then
 begin
           DMUFPWrapper(strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxMorpheoDisplacement.Enabled)and(CheckBoxMorpheoDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           DMUFPWrapper(strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxMorpheoStress.Enabled)and(CheckBoxMorpheoStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxMorpheoTotalStrain.Enabled)and(CheckBoxMorpheoTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxMorpheoPlasticStrain.Enabled)and(CheckBoxMorpheoPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxMorpheoAccumulatedStrain.Enabled)and(CheckBoxMorpheoAccumulatedStrain.Checked));
 end;
 if RadioButtonMorpheoNPM.Checked then
 begin
           NPMWrapper(  strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
                 nodes1,
                 nodes2,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             false,
                 Displacements2,      (CheckBoxMorpheoDisplacement.Enabled)and(CheckBoxMorpheoDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           NPMWrapper(  strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
                 Nodes1,
                 Nodes2Integration,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxMorpheoStress.Enabled)and(CheckBoxMorpheoStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxMorpheoTotalStrain.Enabled)and(CheckBoxMorpheoTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxMorpheoPlasticStrain.Enabled)and(CheckBoxMorpheoPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxMorpheoAccumulatedStrain.Enabled)and(CheckBoxMorpheoAccumulatedStrain.Checked));
 end;
 if RadioButtonMorpheoDMUE.Checked then
 begin
    obtain_nodes_in_element(Elements1,NodesInElement1);
          DMUEWrapper  (strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxMorpheoDisplacement.Enabled)and(CheckBoxMorpheoDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           DMUEWrapper (strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxMorpheoStress.Enabled)and(CheckBoxMorpheoStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxMorpheoTotalStrain.Enabled)and(CheckBoxMorpheoTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxMorpheoPlasticStrain.Enabled)and(CheckBoxMorpheoPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxMorpheoAccumulatedStrain.Enabled)and(CheckBoxMorpheoAccumulatedStrain.Checked));
 end;
 if RadioButtonMorpheoMUESF.Checked then
 begin
    obtain_nodes_in_element(Elements1,NodesInElement1);
          MUESFWrapper (strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
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
                 Displacements2,      (CheckBoxMorpheoDisplacement.Enabled)and(CheckBoxMorpheoDisplacement.Checked),
                 TotalStrain2 ,       false,
                 PlasticStrain2 ,     false,
                 AccumulatedStrain2,  false);

          convert_coordinates(Nodes2Integration,
                              Nodes2,
                              Elements2);

           MUESFWrapper(strtoreal(EditMorpheoStress.text),
                 strtoreal(EditMorpheoDisplacement.text),
                 strtoreal(EditMorpheoTotalStrain.text),
                 strtoreal(EditMorpheoPlasticStrain.text),
                 strtoreal(EditMorpheoAccumulatedStrain.text),
                 nodes1,
                 Nodes2Integration,
                 Elements1,
                 NodesInElement1,
                 Stress1,
                 Displacements1,
                 TotalStrain1,
                 PlasticStrain1,
                 AccumulatedStrain1,
                 Stress2,             (CheckBoxMorpheoStress.Enabled)and(CheckBoxAbaqusStress.Checked),
                 Displacements2,      false,
                 TotalStrain2 ,       (CheckBoxMorpheoTotalStrain.Enabled)and(CheckBoxMorpheoTotalStrain.Checked),
                 PlasticStrain2 ,     (CheckBoxMorpheoPlasticStrain.Enabled)and(CheckBoxMorpheoPlasticStrain.Checked),
                 AccumulatedStrain2,  (CheckBoxMorpheoAccumulatedStrain.Enabled)and(CheckBoxMorpheoAccumulatedStrain.Checked));

 end;

BitBtnMorpheoSave.Enabled := true;
MainForm.Caption := 'FEDES';
application.Title := 'FEDES';
end;

procedure TMainForm.BitBtnMorpheoSaveClick(Sender: TObject);
begin
if SaveDialogMorpheo1.Execute then
CreateMorpheoFile(EditMorpheo3.Text,
                 SaveDialogMorpheo1.FileName,
                 Nodes2,
                 Elements2,
                 NodesInElement2,
                 Stress2,
                 Displacements2,
                 TotalStrain2,
                 PlasticStrain2,
                 AccumulatedStrain2);
end;

procedure TMainForm.BitBtnSave1Click(Sender: TObject);
begin
if SaveDialogAbaqusMethodB.Execute then
begin
  if RadioButtonNPM.Checked then
  begin
    CreateFortranAbaqusFile(EditAbaqus3.Text,
                        SaveDialogAbaqusMethodB.FileName,
                        Nodes2,
                        Displacements2,
                        Stress2,
                        AccumulatedStrain2);
    FortranNPM(SaveDialogAbaqusMethodB.FileName + '.for',
           EditStresses.Text,
           Nodes1,
           Stress1,
           AccumulatedStrain1);
  end
  else if RadioButtonDMUFP.Checked then
  begin
    CreateFortranAbaqusFile(EditAbaqus3.Text,
                        SaveDialogAbaqusMethodB.FileName,
                        Nodes2,
                        Displacements2,
                        Stress2,
                        AccumulatedStrain2);
    FortranDMUFP(SaveDialogAbaqusMethodB.FileName + '.for',
             EditStresses.Text,
             Nodes1,
             Stress1,
             AccumulatedStrain1);
  end
  else if RadioButtonDMUE.Checked then
  begin
    CreateFortranAbaqusFile(EditAbaqus3.Text,
                        SaveDialogAbaqusMethodB.FileName,
                        Nodes2,
                        Displacements2,
                        Stress2,
                        AccumulatedStrain2);
    FortranDMUE (SaveDialogAbaqusMethodB.FileName + '.for',
             EditStresses.Text,
             Nodes1,
             Elements1,
             NodesInElement1,
             Stress1,
             AccumulatedStrain1);
  end
  else if RadioButtonMUSF.Checked then
  begin
    CreateFortranAbaqusFile(EditAbaqus3.Text,
                        SaveDialogAbaqusMethodB.FileName,
                        Nodes2,
                        Displacements2,
                        Stress2,
                        AccumulatedStrain2);
    FortranMUESF (SaveDialogAbaqusMethodB.FileName + '.for',
             EditStresses.Text,
             Nodes1,
             Elements1,
             NodesInElement1,
             Stress1,
             AccumulatedStrain1);
  end;
end;
end;

procedure TMainForm.BitBtnSave2Click(Sender: TObject);
begin
if SaveDialogAbaqusMethodB.Execute then
  CreateAbaqusFile(EditAbaqus3.Text,
                 SaveDialogAbaqusMethodB.FileName,
                 Nodes2,
                 Elements2,
                 Stress2,
                 Displacements2,
                 TotalStrain2,
                 PlasticStrain2,
                 AccumulatedStrain2);
end;

end.



