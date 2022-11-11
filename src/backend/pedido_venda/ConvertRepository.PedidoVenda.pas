unit ConvertRepository.PedidoVenda;

interface

uses
  Entity.PedidoVenda,
  SysUtils, DB;

type
  TConvertRepositoryPedidoVenda = class
  public
    class function ToEntity(dataset: TDataset): TEntityPedidoVenda;
    class function ToDataset(entity: TEntityPedidoVenda; dataSet: TDataSet): TDataSet;
    class function ToParams(entity: TEntityPedidoVenda; params: TParams): TDataSet;
  end;

implementation

{ TConvertRepositoryPedidoVenda }

class function TConvertRepositoryPedidoVenda.ToDataset(entity: TEntityPedidoVenda;
  dataSet: TDataSet): TDataSet;
begin
  result := dataSet;

  dataset.FieldByName('ped_id').AsInteger := entity.id;
  dataset.FieldByName('ped_cliente').AsInteger := entity.cliente;
  dataset.FieldByName('ped_numero').AsInteger := entity.numero;
  dataset.FieldByName('ped_emissao').AsDateTime := entity.emissao;
  dataset.FieldByName('ped_valor_total').AsFloat := entity.valor_total;
end;

class function TConvertRepositoryPedidoVenda.ToEntity(
  dataset: TDataset): TEntityPedidoVenda;
begin
  result := TEntityPedidoVenda.Create;
  
  result.id := dataset.FieldByName('ped_id').AsInteger;
  result.cliente := dataset.FieldByName('ped_cliente').AsInteger;
  result.numero := dataset.FieldByName('ped_numero').AsInteger;
  result.emissao := dataset.FieldByName('ped_emissao').AsDateTime;
  result.valor_total := dataset.FieldByName('ped_valor_total').AsFloat;
end;

class function TConvertRepositoryPedidoVenda.ToParams(entity: TEntityPedidoVenda;
  params: TParams): TDataSet;
begin

  if params.FindParam('id') <> nil then
    params.ParamByName('id').AsInteger := entity.id;

  params.ParamByName('cliente').AsInteger := entity.cliente;
  params.ParamByName('numero').AsInteger := entity.numero;
  Params.ParamByName('emissao').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss',entity.emissao);
  params.ParamByName('valor_total').AsFloat := entity.valor_total;

  result := TDataSet(params.Owner);
end;

end.
