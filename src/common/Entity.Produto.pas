unit Entity.Produto;

interface

{$M+}

type
  TEntityProduto = class
  private
    Fpreco_venda: double;
    Fdescricao: string;
    Fcodigo: integer;
    Fid: integer;
  published
    property id: integer read Fid write Fid;
    property codigo: integer read Fcodigo write Fcodigo;
    property descricao: string read Fdescricao write Fdescricao;
    property preco_venda: double read Fpreco_venda write Fpreco_venda;
  end;


implementation

end.
