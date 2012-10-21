unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, Buttons, XPMan;

type
  TForm3 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ListBox: TListBox;
    Memo: TMemo;
    Button1: TButton;
    XPManifest1: TXPManifest;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Label31: TLabel;
    Edit31: TEdit;
    Label32: TLabel;
    Edit32: TEdit;
    Edit33: TEdit;
    Label33: TLabel;
    Memo2: TMemo;
    Label10: TLabel;
    LabelName: TLabel;
    EditName: TEdit;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
var
f: textfile;
begin
form2.MoveForm3;
try
  listbox.Items.LoadFromFile('Повар.txt');
except
  MessageDlg('Не могу открыть файл с рецептами', mtError, [mbok], 0);
end;
end;

procedure TForm3.N4Click(Sender: TObject);
begin
close;
end;

{Begin of china style}

procedure TForm3.FormResize(Sender: TObject);
var
d: integer;
begin
d:=8;
listbox.Left:=d;
listbox.Top:=d;
listbox.Height := clientheight - button1.Height - 3*d;
button1.Left:=d;
button1.Top:=listbox.Top+listbox.Height+d;
memo.Top:=d;
memo.Left:=listbox.Width+listbox.Left+d;
memo.Width := clientwidth - memo.Left - d;
memo.Height := clientheight - 2*d;

//Второй вариант
label11.Left:=0;
edit11.Left:=label11.Left;
label21.Left:=label11.Left;
edit21.Left:=label11.Left;
label31.Left:=label11.Left;
edit31.Left:=label11.Left;

label11.Width := clientwidth div 3;
edit11.Width:=label11.Width;
label21.Width := label11.Width;
edit21.Width:=label11.Width;
label21.Width := label11.Width;
edit31.Width:=label11.Width;
label12.Width := label11.Width;
edit12.Width:=label11.Width;
label22.Width := label11.Width;
edit22.Width:=label11.Width;
label32.Width := label11.Width;
edit32.Width:=label11.Width;

label13.Width := clientwidth - label11.Width*2;
edit13.Width:=label13.Width;
label23.Width := label13.Width;
edit23.Width:=label13.Width;
label33.Width := label13.Width;
edit33.Width:=label13.Width;

label11.Top:=0;
label12.Top:=label11.Top;
label13.Top:=label11.Top;
edit11.Top:=label11.Top+label11.Height;
edit12.Top := edit11.Top;
edit13.Top := edit11.Top;
label21.Top:=edit11.Top + edit11.Height;
label22.Top:=label21.Top;
label23.Top:=label21.Top;
edit21.Top:=label21.Top+label21.Height;
edit22.Top := edit21.Top;
edit23.Top := edit21.Top;
label31.Top:=edit21.Top + edit21.Height;;
label32.Top:=label31.Top;
label33.Top:=label31.Top;
edit31.Top:=label31.Top+label31.Height;
edit32.Top := edit31.Top;
edit33.Top := edit31.Top;

label12.Left:=label11.Left+label11.Width;
edit12.Left:=label12.Left;
label22.Left:=label12.Left;
edit22.Left:=label12.Left;
label32.Left:=label12.Left;
edit32.Left:=label12.Left;

label13.Left:=label12.Left+label12.Width;
edit13.Left:=label13.Left;
label23.Left:=label13.Left;
edit23.Left:=label13.Left;
label33.Left:=label13.Left;
edit33.Left:=label13.Left;

label10.top := edit31.Top+edit31.Height;
label10.Left:=(clientwidth - label10.Width) div 2;
memo2.Left:=0;
memo2.Width := clientwidth;
memo2.Top:=label10.Top+label10.Height;
memo2.Height:=clientheight - memo2.Top - labelname.Height- editname.Height - button2.Height;
labelname.Top := memo2.Top+memo2.Height;
labelname.Left := (clientwidth - labelname.Width) div 2;
editname.Top:=labelname.Top+labelname.Height;
editname.Left := (clientwidth - editname.Width) div 2;
button2.Top:=clientheight - button2.Height;
button2.left := 0;
button2.Width:=clientwidth;
end;

{End of china style}

procedure TForm3.FormHide(Sender: TObject);
begin
  listbox.Items.SaveToFile('Повар.txt');
end;

procedure TForm3.Button1Click(Sender: TObject);
var
i: integer;
begin
for i:=listbox.Items.Count - 1 downto 0 do
  if listbox.Selected[i] then
    listbox.Items.delete(i);
end;

procedure TForm3.ListBoxClick(Sender: TObject);
var
f: textfile;
begin
if listbox.ItemIndex <0 then exit;
try
    memo.Lines.LoadFromFile('kuh\'+listbox.Items[listbox.itemindex]+'.txt');
except
    MessageDlg('Файл рецепта '+listbox.Items[listbox.itemindex]+' отсутствует', mtError, [mbok], 0);
end;
end;

{Begin of china style}

procedure TForm3.N2Click(Sender: TObject);
begin
listbox.Visible := true;
memo.Visible:=true;
button1.Visible:=true;

label11.Visible:=false;
label12.Visible:=false;
label13.Visible:=false;
label21.Visible:=false;
label22.Visible:=false;
label23.Visible:=false;
label31.Visible:=false;
label32.Visible:=false;
label33.Visible:=false;

edit11.Visible:=false;
edit12.Visible:=false;
edit13.Visible:=false;
edit21.Visible:=false;
edit22.Visible:=false;
edit23.Visible:=false;
edit31.Visible:=false;
edit32.Visible:=false;
edit33.Visible:=false;

label10.Visible:=false;
memo2.Visible:=false;
labelname.Visible:=false;
editname.Visible:=false;
button2.Visible:=false;
end;

procedure TForm3.N3Click(Sender: TObject);
begin
listbox.Visible := false;
memo.Visible:=false;
button1.Visible:=false;

label11.Visible:=true;
label12.Visible:=true;
label13.Visible:=true;
label21.Visible:=true;
label22.Visible:=true;
label23.Visible:=true;
label31.Visible:=true;
label32.Visible:=true;
label33.Visible:=true;

edit11.Visible:=true;
edit12.Visible:=true;
edit13.Visible:=true;
edit21.Visible:=true;
edit22.Visible:=true;
edit23.Visible:=true;
edit31.Visible:=true;
edit32.Visible:=true;
edit33.Visible:=true;

label10.Visible:=true;
memo2.Visible:=true;
labelname.Visible:=true;
editname.Visible:=true;
button2.Visible:=true;
end;

{End of china style}

procedure TForm3.Button2Click(Sender: TObject);
var
name: string;
f: textfile;
i: integer;
begin
name := editname.Text;
if name = '' then
begin
    messagedlg('Вы не ввели название', mtInformation, [mbok], 0);
    exit;
end;
assignfile(f, 'kuh\'+name+'.txt');
try
  rewrite(f);
  writeln(f, 'Ингридиенты:');
  writeln(f, 'Название: '+edit11.text+', количество '+edit12.text+'('+edit13.text+')');
  writeln(f, 'Название: '+edit21.text+', количество '+edit22.text+'('+edit23.text+')');
  writeln(f, 'Название: '+edit31.text+', количество '+edit32.text+'('+edit33.text+')');
  writeln(f, 'Последовательность действий:');
  for i := 0 to memo2.Lines.Count-1 do
    writeln(f, memo2.lines[i]);
  closefile(f);
  listbox.Items.Add(name);
except
messagedlg('Не получилось открыть файл на запись', mterror, [mbok], 0);
end;
end;

end.
