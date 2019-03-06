unit preference;

{$mode objfpc}{$H+}

interface
  function getPreferenceString : string;
  procedure setProjectNew(state : Boolean);
  function getString : string;

implementation

uses
  Classes, SysUtils, fpJSON, jsonparser;

{ Get the string content of pref.json }
function getPreferenceString : string;
var
  fName, content: string;
  str: TStringList;
  length, i: integer;
begin
  fName := GetCurrentDir + PathDelim + 'pref.json';
  str := TStringList.Create;
  content := '';
  try
    str.LoadFromFile(fName);
    length := str.Count;
    for i := 0 to length-1 do
        content := content + str[i];
  finally
    str.Free;
  end;

  getPreferenceString := content;
end;

{ Sets the project_new to true or false }
procedure setProjectNew(state: boolean);
var
  str : TJSONStringType;
  jData : TJSONData;
  jObject : TJSONObject;
  tFile : TextFile;        // Text file containing the json string

begin
  // Get the json string
  str := getPreferenceString;

  // Create a JSONData object
  jData := GetJSON(str, true);

  // Create JSONObject
  jObject := TJSONObject(jData);

  { Change value of key project_new }
  jObject.Booleans['project_new'] := true;
  AssignFile(tFile, GetCurrentDir + PathDelim + 'pref.json');
  try
    Rewrite(tFile);
    Write(tFile, jData.FormatJSON);
  finally
    CloseFile(tFile);
  end;
end;

function getString : string;
var
  str : string;
  jData : TJSONData;
  jObject : TJSONObject;
begin
  str := getPreferenceString;
  jData := GetJSON(str);
  jObject := TJSONObject(jData);
  { Change value of key project_new }
  jObject.Booleans['project_new'] := true;
  getString := jData.AsJSON;
end;

end.

