unit Base.ControlRepository;

interface

uses
  Classes, SysUtils, DB;

{$M+}

type
  TClassDataModule = class of TDataModule;
  TBaseControlRepository = class
  private
    FDM: TDataModule;
    procedure SetDM(const Value: TDataModule);
  public
    constructor Create; reintroduce;
    procedure BeforeDestruction; override;
  published
    property DM: TDataModule read FDM write SetDM;
  end;

implementation

{ TBaseControl }

procedure TBaseControlRepository.BeforeDestruction;
begin
  inherited;
  if Assigned(FDM) then
    FreeAndNil(FDM);;
end;

constructor TBaseControlRepository.Create;
var
  lstClassName: string;
  c: TClassDataModule;
begin
  inherited;

  if FDM = nil then
  begin

    lstClassName := StringReplace( Self.ClassName ,'TWrapControl','TdmdData',[rfIgnoreCase]);
    c := TClassDataModule(FindClass(lstClassName));
    if c <> nil then
    begin
      FDM := c.Create(nil);
      FDM.Name := FDM.Name + inttostr(Random(MaxInt));
    end;
  end;

end;

procedure TBaseControlRepository.SetDM(const Value: TDataModule);
begin
  if FDM <> nil then
    FreeAndNil(FDM);
  FDM := Value;
end;

end.
