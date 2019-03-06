unit project_settings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DateTimePicker;

type

  { TformProjectProperties }

  TformProjectProperties = class(TForm)
    etProjectName: TEdit;
    etProjectLocation: TEdit;
    exContractId: TEdit;
    etImplementationYear: TEdit;
    etOriginalContractAmount: TEdit;
    etRevisedContractAmount: TEdit;
    etDuration: TEdit;
    gbBasicInformation: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private

  public

  end;

var
  formProjectProperties: TformProjectProperties;

implementation

{$R *.lfm}

{ TformProjectProperties }

procedure TformProjectProperties.FormCreate(Sender: TObject);
begin

end;

procedure TformProjectProperties.FormMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  str : string;
  i : integer;
begin
  for i := 0 to gbBasicInformation.ControlCount-1 do
  begin
    etProjectName.Text := etProjectName.Text + string(i);
  end;

end;

end.

