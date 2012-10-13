unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    LabelUser: TLabel;
    ListBoxGost: TListBox;
    ListBoxKuh: TListBox;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ListBoxKuhDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBoxKuhDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBoxGostDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  unit1;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.Close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm2.ListBoxKuhDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if (source is TComponent) and ((source as TComponent).Name = 'ListBoxGost') then
  accept := true
else
  accept := false;
end;

procedure TForm2.ListBoxKuhDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
i: integer;
begin
if source is TlistBox then
    for i:=(source as TlistBox).Items.Count-1 downto 0 do
      if (source as TlistBox).Selected[i] then
      begin
          (sender as TlistBox).Items.Add((source as TlistBox).Items[i]);
          (source as TlistBox).Items.Delete(i);
      end;
end;

procedure TForm2.ListBoxGostDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (source is TComponent) and ((source as TComponent).Name = 'ListBoxKuh') then
  accept := true
else
  accept := false;
end;

procedure TForm2.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if source is TlistBox then
  accept:=true
else
  accept:=false;
end;

procedure TForm2.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
if source is TListBox then
begin
    
end;
end;

end.
 