unit Dialog.Message;

interface

uses
  Common.Messages,
  Windows, SysUtils, StrUtils, Forms, Dialogs;

type
  TDialogMessage = class
  public
    class procedure Erro(pstMsg: string);
    class procedure Aviso(pstMsg: string);
    class function Excluir(const pstPergunta: string = ''): boolean;
  end;

implementation

{ TDialogMessage }

class procedure TDialogMessage.Aviso(pstMsg: string);
begin
  MessageBox(Application.Handle, PAnsiChar(pstMsg), 'Notificação', MB_OK +
    MB_ICONWARNING);
end;

class procedure TDialogMessage.Erro(pstMsg: string);
begin
  MessageBox(Application.Handle, PAnsiChar(pstMsg), 'Erro', MB_OK +
    MB_ICONERROR);
end;

class function TDialogMessage.Excluir(const pstPergunta: string): boolean;
var
  lstPergunta: string;
begin
  lstPergunta := ifthen(pstPergunta=EmptyStr,MSG_DEL_CONFIRM, pstPergunta);
  result := MessageDlg(lstPergunta, mtConfirmation, [mbYes, mbNo], 0) = ID_YES;
end;

end.
