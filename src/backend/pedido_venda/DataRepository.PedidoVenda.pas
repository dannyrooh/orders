unit DataRepository.PedidoVenda;

interface

uses
  Data.Main,
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmdDataRepositoryPedidoVenda = class(TDataModule)
    qryAddPedidoVenda: TSQLQuery;
    qryUpdPedidoVenda: TSQLQuery;
    qryPedidoVendaGet: TSQLQuery;
    qryAddPedidoVendaItem: TSQLQuery;
    qryUpdPedidoVendaItem: TSQLQuery;
    qryPedidoVendaItemGet: TSQLQuery;
    qryNextNumeroPedido: TSQLQuery;
    qryPedidoVendaDel: TSQLQuery;
    qryPedidoVendaItemDel: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdDataRepositoryPedidoVenda: TdmdDataRepositoryPedidoVenda;

implementation

{$R *.dfm}

end.
