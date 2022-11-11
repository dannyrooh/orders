unit Data.Main;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, ADODB, FMTBcd;

type
  TdmdDataMain = class(TDataModule)
    conexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdDataMain: TdmdDataMain;

implementation

{$R *.dfm}

end.
