unit Global.Main;

interface

type
  TGlobalMain = class
  public
    class function IsRest: boolean;
  end;

implementation

{ TGlobalMain }

class function TGlobalMain.IsRest: boolean;
begin
  //Ler o parâmetro para indicar se o acesso será MVC Desktop ou via APIRest
  result := false;
end;

end.
