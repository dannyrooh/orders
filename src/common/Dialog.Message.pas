unit Dialog.Message;

interface

uses
  Windows, forms;

type
  TDialogMessage = class
  public
    class procedure Erro(pstMsg: string);
  end;

implementation

{ TDialogMessage }

class procedure TDialogMessage.Erro(pstMsg: string);
begin
   MessageBox(Application.Handle,PAnsiChar(pstMsg), 'Erro',MB_OK +MB_ICONERROR);
end;

end.
