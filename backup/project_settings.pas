unit project_settings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TFormProjectSettings }

  TFormProjectSettings = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  formProjectSettings: TFormProjectSettings;

implementation

{$R *.lfm}

{ TFormProjectSettings }

procedure TFormProjectSettings.FormCreate(Sender: TObject);
begin

end;

end.

