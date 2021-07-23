unit frm_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  frm_klanten_orders, frm_artikelen;

type

  { Tfrm_main_form }

  Tfrm_main_form = class(TForm)
    btn_klanten: TButton;
    btn_file: TButton;
    btn_artikelen: TButton;
    OpenDialog1: TOpenDialog;
    procedure btn_artikelenClick(Sender: TObject);
    procedure btn_fileClick(Sender: TObject);
    procedure btn_klantenClick(Sender: TObject);
  private

  public



  end;

var
  frm_main_form: Tfrm_main_form;

implementation

{$R *.lfm}

{ Tfrm_main_form }

procedure Tfrm_main_form.btn_klantenClick(Sender: TObject);
begin
  TfrmKlanten_orders.showformmodal();

end;

procedure Tfrm_main_form.btn_fileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if fileExists(OpenDialog1.Filename) then
      ShowMessage(OpenDialog1.Filename);
  end
  else
    ShowMessage('No file selected');
end;

procedure Tfrm_main_form.btn_artikelenClick(Sender: TObject);
begin
  TfrmArtikelen.showform();
end;


end.
