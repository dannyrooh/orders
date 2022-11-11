unit IMediator.Produto;

interface

uses
  Entity.Produto;

type
  IMediatorProduto = interface
    ['{28AD259E-158A-4BD1-AE66-41C634890C49}']
    function GetByCodigo(piCodigo: Integer): TEntityProduto;
  end;

implementation

end.
