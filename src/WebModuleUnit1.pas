unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

// Обработчик "по умолчанию" для всех запросов к DLL
procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  // Возвращаем HTML в кодировке UTF-8
  Response.ContentType := 'text/html; charset=utf-8';

  // Простейшая HTML-страница прототипа системы заявок
  Response.Content :=
    '<!DOCTYPE html>' +
    '<html>' +
    '<head>' +
    '  <meta charset="utf-8">' +
    '  <title>Система заявок</title>' +
    '  <style>' +
    '    body { font-family: Arial, sans-serif; margin: 20px; }' +
    '    h1 { color: #333; }' +
    '    table { border-collapse: collapse; margin-top: 10px; }' +
    '    th, td { border: 1px solid #ccc; padding: 5px 10px; }' +
    '    th { background-color: #f0f0f0; }' +
    '  </style>' +
    '</head>' +
    '<body>' +
    '  <h1>Прототип WEB-приложения "Система заявок"</h1>' +
    '  <p>Страница сгенерирована WebBroker-приложением на Delphi 10.2, ' +
    '     размещённым под управлением IIS.</p>' +

    '  <h2>Примеры заявок (демо-данные)</h2>' +
    '  <table>' +
    '    <tr><th>ID</th><th>Пользователь</th><th>Тема</th><th>Статус</th></tr>' +
    '    <tr><td>1</td><td>Иван Петров</td><td>Не работает принтер</td><td>Открыта</td></tr>' +
    '    <tr><td>2</td><td>Анна Смирнова</td><td>Нужен доступ к CRM</td><td>В обработке</td></tr>' +
    '  </table>' +

    '  <p style="margin-top:20px; font-size: 0.9em; color:#666;">' +
    '    В реальной системе данные подгружаются из базы WebRequests (MS SQL Server).' +
    '  </p>' +

    '</body>' +
    '</html>';

  Handled := True;
end;

end.