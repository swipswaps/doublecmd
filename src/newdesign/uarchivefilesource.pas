unit uArchiveFileSource;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uLocalFileSource;

type

  TArchiveFileSource = class(TLocalFileSource)
  private

  protected
    procedure SetCurrentPath(NewPath: String); override;

  public
    constructor Create(anArchiveFileName: String); virtual reintroduce overload;
    constructor Create(anArchiveFileName: String; aPath: String); virtual reintroduce overload;

    property ArchiveFileName: String read FCurrentAddress;
  end;

implementation

constructor TArchiveFileSource.Create(anArchiveFileName: String);
begin
  Create(anArchiveFileName, PathDelim);
end;

constructor TArchiveFileSource.Create(anArchiveFileName: String; aPath: String);
begin
  FCurrentAddress := anArchiveFileName;
  SetCurrentPath(aPath);
end;

procedure TArchiveFileSource.SetCurrentPath(NewPath: String);
begin
  if (NewPath = '') or (NewPath[1] <> PathDelim) then
  begin
    ; // error - invalid path (throw exception?)
  end
  else
    inherited SetCurrentPath(NewPath);
end;

end.

