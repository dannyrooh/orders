unit Entity.Cliente;

interface

{$M+}

type
  TEntityCliente = class
  private
    Fuf: string;
    Fcodigo: integer;
    Fid: integer;
    Fnome: string;
    Fcidade: string;
  published
    property Id: integer read Fid write FId;
    property Codigo: integer read Fcodigo write Fcodigo;
    property Nome: string read Fnome write Fnome;
    property Cidade: string read Fcidade write Fcidade;
    property Uf: string read Fuf write Fuf;
  end;

implementation

{ TEntityCliente }


end.
