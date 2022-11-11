unit DataRepository.Produto;

interface

uses
  Data.Main,
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmdDataRepositoryProduto = class(TDataModule)
    qryProdutoGet: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdDataRepositoryProduto: TdmdDataRepositoryProduto;

implementation

{$R *.dfm}

end.
