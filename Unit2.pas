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
    procedure CheckKit();
    procedure MoveForm3();
    procedure FormResize(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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
  unit1, Unit3;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
listboxgost.Items.SaveToFile('gost.txt');
listboxkuh.Items.SaveToFile('kuh.txt');
form1.Close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm2.ListBoxKuhDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if (source is TComponent) and ((source as TComponent).Name = 'ListBoxGost')or ((source is TLabel) and ((source as Tlabel).Name = 'LabelUser')) then
  accept := true
else
  accept := false;
end;

procedure TForm2.ListBoxKuhDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
i: integer;
flag: boolean;
lb: TListBox;
begin
if source is TlistBox then
begin
    for i:=(source as TlistBox).Items.Count-1 downto 0 do
      if (source as TlistBox).Selected[i] then
      begin
          (sender as TlistBox).Items.Add((source as TlistBox).Items[i]);
          (source as TlistBox).Items.Delete(i);
      end;
end
else if (source is TLabel) and ((source as Tlabel).Name = 'LabelUser') then
begin
  lb := sender as TListBox;
  flag := true;
  for i := 0 to lb.Items.Count-1 do
    if lb.Items[i] = (source as Tlabel).Caption then
      begin
          flag := false;
          break;
      end;
  if flag then
    lb.Items.Add((source as Tlabel).Caption);

  if lb.Name = 'ListBoxGost' then lb := ListBoxKuh
  else lb := ListBoxGost;

  for i := 0 to lb.Items.Count-1 do
    if lb.Items[i] = (source as Tlabel).Caption then
      begin
          lb.Items.Delete(i);
          break;
      end;
end;
CheckKit;
end;

procedure TForm2.ListBoxGostDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (source is TComponent) and ((source as TComponent).Name = 'ListBoxKuh')or ((source is TLabel) and ((source as Tlabel).Name = 'LabelUser')) then
  accept := true
else
  accept := false;
end;

procedure TForm2.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if (source is TlistBox) or ((source is TLabel) and ((source as Tlabel).Name = 'LabelUser')) then
  accept:=true
else
  accept:=false;
end;

procedure TForm2.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var
lb: TListBox;
i: integer;
begin
if source is TListBox then
begin
  lb := source as TlistBox;

  for i:=lb.Items.Count-1 downto 0 do
      if lb.Selected[i] then
          lb.Items.Delete(i);
end else if (source is TLabel) and ((source as Tlabel).Name = 'LabelUser') then
begin
    //formdragdrop(sender, ListBoxGost, x, y);
    //formdragdrop(sender, ListBoxKuh, x, y);
    i := listboxgost.Items.IndexOf((source as Tlabel).Caption);
    if i>=0 then listboxgost.Items.delete(i);
    i := listboxkuh.Items.IndexOf((source as Tlabel).Caption);
    if i>=0 then listboxkuh.Items.delete(i);
end;
CheckKit;
end;

procedure TForm2.CheckKit;
begin
//if listboxkuh.Items.Count = 0 then
if Boolean(listboxkuh.Items.Count) then form3.Show else form3.Hide;
end;

procedure TForm2.MoveForm3;
begin
form3.Top := top;
form3.Left := left + width;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
MoveForm3;
end;

procedure TForm2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
MoveForm3;
end;

end.
