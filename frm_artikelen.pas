unit frm_artikelen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, DBCtrls,
  DBGrids, ExtDlgs, StdCtrls, ExtCtrls, dm_main, MPlayerCtrl;

type

  { TfrmArtikelen }

  TfrmArtikelen = class(TForm)
    btn_afb: TButton;
    btn_play: TButton;
    btn_video: TButton;
    btn_select: TButton;
    data_artikelen: TDataSource;
    edit_afb: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    edit_afb1: TDBEdit;
    Image1: TImage;
    MPlayerControl1: TMPlayerControl;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TPageControl;
    tbs_media: TTabSheet;
    tbs_detail: TTabSheet;
    tbs_afb: TTabSheet;
    tbs_artikelen: TTabSheet;
    procedure btn_afbClick(Sender: TObject);
    procedure btn_playClick(Sender: TObject);
    procedure btn_videoClick(Sender: TObject);
    procedure data_artikelenDataChange(Sender: TObject; Field: TField);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormShow(Sender: TObject);
  private



  public
    class procedure showform();
    class function artFrmShowmodal(): integer;

  end;

var
  frmArtikelen: TfrmArtikelen;

implementation

{$R *.lfm}

{ TfrmArtikelen }

procedure TfrmArtikelen.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
begin

end;

procedure TfrmArtikelen.FormShow(Sender: TObject);
begin
  MPlayerControl1.MPlayerPath:= 'C:\ProgamFiles\mplayer\mplayer.exe';
end;

procedure TfrmArtikelen.btn_afbClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if fileExists(OpenPictureDialog1.Filename) then
    begin
      with dmMain do
      begin
        if not (qry_art.State in [dsEdit, dsInsert])then
          qry_art.Edit;

        qry_artart_afb.AsString := OpenPictureDialog1.Filename;
      end;
    end
    else
      ShowMessage('No file selected');

  end;
end;

procedure TfrmArtikelen.btn_playClick(Sender: TObject);
begin
  MPlayerControl1.Filename := dmMain.qry_artart_media.AsString;
  MPlayerControl1.Play;
end;

procedure TfrmArtikelen.btn_videoClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
  begin
    if fileExists(OpenDialog1.Filename) then
    begin
      with dmMain do
      begin
        if not (qry_art.State in [dsEdit, dsInsert])then
          qry_art.Edit;

        qry_artart_media.AsString := OpenDialog1.Filename;
      end;
    end
    else
      ShowMessage('No file selected');

  end;
end;

procedure TfrmArtikelen.data_artikelenDataChange(Sender: TObject; Field: TField
  );
begin
  if FileExists( dmMain.qry_artart_afb.AsString) then
       Image1.Picture.LoadFromFile(dmMain.qry_artart_afb.AsString);
end;

class procedure TfrmArtikelen.showform();
begin
  if not Assigned(frmArtikelen) then
    frmArtikelen := TfrmArtikelen.Create(Application);
  frmArtikelen.Show();
end;

class function TfrmArtikelen.artFrmShowmodal() : integer;
var
  Lart_form : TfrmArtikelen;
begin
  result :=0;
  Lart_form := TfrmArtikelen.Create(Application);
  if Lart_form.showmodal = mrOK then
     begin
        result := dmMain.qry_artid.AsLongint;
     end;
  Lart_form.Free;
end;

end.


