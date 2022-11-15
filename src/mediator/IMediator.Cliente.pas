unit IMediator.Cliente;

interface

uses
  Entity.Cliente;

type
  IMediatorCliente = interface
    ['{A1A281C6-9EF9-45B8-8182-0061461EE255}']
    function GetById(pinId: Integer): TEntityCliente;
    function GetByCodigo(pinCodigo: Integer): TEntityCliente;
    function GetByNome(pstNome: string): TEntityCliente;
  end;

implementation

end.
