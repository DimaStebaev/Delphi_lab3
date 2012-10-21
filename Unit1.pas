unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    EditUser: TEdit;
    Button1: TButton;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditUserKeyPress(Sender: TObject; var Key: Char);
  private
    users: TStringlist;
    counter: integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  unit2;

procedure TForm1.FormCreate(Sender: TObject);
var
f: textfile;
str: string;
begin
counter:=0;
users := tstringlist.Create;
assignfile(f, 'users.txt');
try
  reset(f);
  while not eof(f) do
  begin
      readln(f, str);
      users.Add(str);
  end;
  closefile(f);
except
  messagedlg('Не могу открыть файл с паролями', mtError, [mbok], 0);
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
i, j: integer;
f: textfile;
begin
for i:=0 to users.Count-1 do
  if edituser.Text = users[i] then
  begin
    hide;

    form2.LabelUser.Caption:=users[i];
    form2.LabelUser.Left := (form2.ClientWidth - form2.LabelUser.Width) div 2;

    {
    for j:=0 to users.Count-1 do
      form2.ListBoxGost.Items.Add(users[j]);
    }
    try
      form2.ListBoxGost.Items.LoadFromFile('gost.txt');
    except
      messagedlg('Не могу открыть файл с гостями в гостинной.', mtError, [mbok], 0);
      show;
      exit;
    end;

    try
      form2.ListBoxKuh.Items.LoadFromFile('kuh.txt');
    except
      messagedlg('Не могу открыть файл с гостями на кухне.', mtError, [mbok], 0);
      show;
      exit;
    end;

    form2.Show;
    form2.CheckKit;
    exit;
  end;

inc(counter);

if counter>=3 then
begin
    messagedlg('Вы не приглашены.'+#13+'Давай, до свидания!', mtInformation, [mbok], 0);
    close;
    exit;
end;

messagedlg('Неправильный пароль.', mtWarning, [mbok], 0);
edituser.Text:='';
edituser.SetFocus;

end;

procedure TForm1.EditUserKeyPress(Sender: TObject; var Key: Char);
begin
if key = char(vk_return) then button1.Click;
end;

end.
 