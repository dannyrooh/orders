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
  //Ler o par�metro para indicar se o acesso ser� MVC Desktop ou via APIRest
  result := false;
end;

end.
