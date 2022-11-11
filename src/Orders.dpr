program Orders;

uses
  Forms,
  View.Main in 'View.Main.pas' {frmViewMain},
  Data.Main in 'Data.Main.pas' {dmdDataMain: TDataModule},
  Base.ControlRepository in 'lib\Base.ControlRepository.pas',
  FView.PedidoVenda in 'fontend\FView.PedidoVenda.pas' {frmViewPedidoVenda},
  FViewData.PedidoVenda in 'fontend\FViewData.PedidoVenda.pas' {dmdViewDataPedidoVenda: TDataModule},
  Control.Cliente in 'fontend\Control.Cliente.pas',
  Control.Produto in 'fontend\Control.Produto.pas',
  Control.PedidoVenda in 'fontend\Control.PedidoVenda.pas',
  ControlRepository.Cliente in 'backend\cliente\ControlRepository.Cliente.pas',
  DataRepository.Cliente in 'backend\cliente\DataRepository.Cliente.pas' {dmdDataRepositoryCliente: TDataModule},
  Entity.Cliente in 'common\Entity.Cliente.pas',
  Entity.PedidoVenda in 'common\Entity.PedidoVenda.pas',
  Entity.PedidoVendaItem in 'common\Entity.PedidoVendaItem.pas',
  Entity.Produto in 'common\Entity.Produto.pas',
  ControlRepository.PedidoVenda in 'backend\pedido_venda\ControlRepository.PedidoVenda.pas',
  DataRepository.PedidoVenda in 'backend\pedido_venda\DataRepository.PedidoVenda.pas' {dmdDataRepositoryPedidoVenda: TDataModule},
  Mediator.PedidoVenda in 'mediator\Mediator.PedidoVenda.pas',
  IMediator.PedidoVenda in 'mediator\IMediator.PedidoVenda.pas',
  Global.Main in 'Global.Main.pas',
  IMediator.Cliente in 'mediator\IMediator.Cliente.pas',
  Mediator.Cliente in 'mediator\Mediator.Cliente.pas',
  Common.Messages in 'common\Common.Messages.pas',
  Convert.Cliente in 'common\Convert.Cliente.pas',
  FView.ItensPedidoVenda in 'fontend\FView.ItensPedidoVenda.pas' {frmViewItensPedidoVenda},
  ControlRepository.Produto in 'backend\produto\ControlRepository.Produto.pas',
  DataRepository.Produto in 'backend\produto\DataRepository.Produto.pas' {dmdDataRepositoryProduto: TDataModule},
  Mediator.Produto in 'mediator\Mediator.Produto.pas',
  IMediator.Produto in 'mediator\IMediator.Produto.pas',
  Convert.Produto in 'common\Convert.Produto.pas',
  ControlRepository.PedidoVendaItem in 'backend\pedido_venda\ControlRepository.PedidoVendaItem.pas',
  Convert.PedidoVenda in 'fontend\Convert.PedidoVenda.pas',
  ConvertRepository.PedidoVenda in 'backend\pedido_venda\ConvertRepository.PedidoVenda.pas',
  ConvertRepository.PedidoVendaItem in 'backend\pedido_venda\ConvertRepository.PedidoVendaItem.pas',
  Convert.PedidoVendaItem in 'fontend\Convert.PedidoVendaItem.pas',
  Validate.Pedido in 'fontend\Validate.Pedido.pas',
  Dialog.Message in 'common\Dialog.Message.pas',
  Constantes.FrontEnd in 'fontend\Constantes.FrontEnd.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmViewMain, frmViewMain);
  Application.CreateForm(TdmdDataMain, dmdDataMain);
  Application.CreateForm(TdmdDataRepositoryProduto, dmdDataRepositoryProduto);
  Application.Run;
end.
