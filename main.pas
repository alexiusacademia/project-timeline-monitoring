unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, LCLType,
           Menus, StdCtrls, ComCtrls, ExtCtrls,
           DateTimePicker, TAGraph,
           project_settings, preference, fpjson;
type

  { TmainForm }

  TmainForm = class(TForm)
    chartSCurve: TChart;
    dpStartDate: TDateTimePicker;
    dpProjectedCompletionDate: TDateTimePicker;
    gbProjectInformation: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mainMenu: TMainMenu;
    mnuProjectSettings: TMenuItem;
    mnuWorkSuspension: TMenuItem;
    mnuAdd: TMenuItem;
    mnuExitProject: TMenuItem;
    MenuItem2: TMenuItem;
    mnuOpenProject: TMenuItem;
    mnuNewProject: TMenuItem;
    mnuProject: TMenuItem;
    saveDlg: TSaveDialog;
    sbMain: TStatusBar;
    stContractId: TStaticText;
    stImplementationYear: TStaticText;
    stOriginalContractAmount: TStaticText;
    stRevisedContractAmount: TStaticText;
    stProjectName: TStaticText;
    stProjectLocation: TStaticText;
    stDuration: TStaticText;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure gbProjectInformationClick(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure mnuExitProjectClick(Sender: TObject);
    procedure mnuNewProjectClick(Sender: TObject);
    procedure mnuProjectSettingsClick(Sender: TObject);
    procedure stContractIdClick(Sender: TObject);
    procedure stDurationClick(Sender: TObject);
    procedure stImplementationYearClick(Sender: TObject);
    procedure stProjectLocationClick(Sender: TObject);
    procedure stProjectNameClick(Sender: TObject);
    procedure stRevisedContractAmountClick(Sender: TObject);

  private

  public

  end;

var
  mainForm: TmainForm;

// Dialogs
procedure showExitDialog;
function createEmptyProject : UTF8String;

implementation


{$R *.lfm}

{ TmainForm }

procedure TmainForm.FormCreate(Sender: TObject);
begin
  // Maximize the window
  mainForm.WindowState:=TWindowState.wsMaximized;
  stProjectName.Caption := getString;
  // Application.MessageBox(pchar(getPreferenceString), pchar('Dir'));
end;

procedure TmainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  reply, boxStyle: integer;
begin
  boxStyle := MB_ICONQUESTION + MB_YESNO;
  reply := Application.MessageBox('Are you sure you want to quit the application?',
           'Quit', boxStyle);
  if reply = IDNO then
     // Prevent the form from closing
     CanClose := false
  else
     setProjectNew(false);
     Application.Terminate;
end;

procedure TmainForm.gbProjectInformationClick(Sender: TObject);
begin

end;

procedure TmainForm.GroupBox1Click(Sender: TObject);
begin

end;

procedure TmainForm.Label7Click(Sender: TObject);
begin

end;

// Exit menu clicked
procedure TmainForm.mnuExitProjectClick(Sender: TObject);
begin
  // Close the application
  showExitDialog;
end;

procedure TmainForm.mnuNewProjectClick(Sender: TObject);
var
    tFile: TextFile;
begin
  saveDlg.DefaultExt := 'ptm';
  saveDlg.Filter := 'Project Timeline Monitoring|*.ptm';
  if saveDlg.Execute then
     { Now create a new project file }
     AssignFile(tFile, saveDlg.Filename);
     try
        Rewrite(tFile);
        Write(tFile, createEmptyProject);

        setProjectNew(true);

     finally
        CloseFile(tFile);
     end;
end;

{ Initialize and returns new json for the new file }
function createEmptyProject : UTF8String;
var
  jData : TJSONData;
  jObject : TJSONObject;
begin
  jData := GetJSON('{}');
  jObject := TJSONObject(jData);
  { Add elements }
  jObject.Add('project_name', '');
  jObject.Add('contract_id', '');
  jObject.Add('project_location', '');
  jObject.Add('implementation_year', '');
  createEmptyProject := jData.FormatJSON;
end;

procedure TmainForm.mnuProjectSettingsClick(Sender: TObject);
begin
  formProjectSettings.ShowModal;
end;

procedure TmainForm.stContractIdClick(Sender: TObject);
begin

end;

procedure TmainForm.stDurationClick(Sender: TObject);
begin

end;

procedure TmainForm.stImplementationYearClick(Sender: TObject);
begin

end;

procedure TmainForm.stProjectLocationClick(Sender: TObject);
begin

end;

procedure TmainForm.stProjectNameClick(Sender: TObject);
begin

end;

procedure TmainForm.stRevisedContractAmountClick(Sender: TObject);
begin

end;

// -----------------------
// Message box procedures
// -----------------------
// Quit message dialog
procedure showExitDialog;
var
  reply, boxStyle: integer;
begin
  boxStyle := MB_ICONQUESTION + MB_YESNO;
  reply := Application.MessageBox('Are you sure you want to quit the application?',
           'Quit', boxStyle);
  {*
  if reply = IDYES then
     setProjectNew(false);
     Application.Terminate; *}
  Application.MessageBox(pChar(reply), 'Reply');

end;
// End of quit dialog

end.

