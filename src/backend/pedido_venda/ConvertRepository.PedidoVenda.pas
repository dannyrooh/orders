unit ConvertRepository.PedidoVenda;

interface

uses
  Convert.Entity,
  Entity.PedidoVenda,
  SysUtils, DB;

type
  TConvertRepositoryPedidoVenda = class
  public
    class function ToEntity(dataset: TDataset): TEntityPedidoVenda;
    class procedure ToParams(entity: TEntityPedidoVenda; params: TParams);
  end;

implementation

{ TConvertRepositoryPedidoVenda }

class function TConvertRepositoryPedidoVenda.ToEntity(
  dataset: TDataset): TEntityPedidoVenda;
begin
  result := TEntityPedidoVenda.Create;
  TConvertEntity.toEntity(dataset,result,'ped_',false);
end;

class procedure TConvertRepositoryPedidoVenda.ToParams(entity: TEntityPedidoVenda;
  params: TParams);
begin
  TConvertEntity.toParams(entity,params);
end;

end.
