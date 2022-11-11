unit DataRepository.Cliente;

interface

uses
  Data.Main,
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr;

type
  TdmdDataRepositoryCliente = class(TDataModule)
    qryClienteGet: TSQLQuery;
    qryClienteIns: TSQLQuery;
    qryClienteUpd: TSQLQuery;
    qryClienteDel: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdDataRepositoryCliente: TdmdDataRepositoryCliente;

implementation

{$R *.dfm}

end.
