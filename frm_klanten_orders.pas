unit frm_klanten_orders;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBGrids, ComCtrls,
  DBCtrls, StdCtrls;

type

  { TfrmKlanten_orders }

  TfrmKlanten_orders = class(TForm)
    Button1: TButton;
    btn_toe: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    PageControl1: TPageControl;
    tbr_regels: TTabSheet;
    tbs_orders: TTabSheet;
    tbs_klanten: TTabSheet;
    procedure btn_toeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private


  public
    class procedure showform();
    class procedure showformmodal();

  end;

var
  frmKlanten_orders: TfrmKlanten_orders;

implementation

{$R *.lfm}

{ TfrmKlanten_orders }
uses dm_main, frm_artikelen;

procedure TfrmKlanten_orders.FormCreate(Sender: TObject);
begin
     PageControl1.ActivePageIndex:=0;
end;

procedure TfrmKlanten_orders.btn_toeClick(Sender: TObject);
begin
  with dmMain do
       begin
         qry_regels.Insert;
         qry_regelsfk_artikelen.AsLongint:= TfrmArtikelen.artFrmShowmodal();
         qry_regels.post;
       end;
end;

procedure TfrmKlanten_orders.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tbs_orders then
     DBNavigator1.DataSource := DataSource2
  else if PageControl1.ActivePage = tbs_klanten then
     DBNavigator1.DataSource := DataSource1
  else if PageControl1.ActivePage = tbr_regels then
     DBNavigator1.DataSource := DataSource3;
end;

class procedure TfrmKlanten_orders.showform();
begin
  if NOT Assigned(frmklanten_orders) then
         frmklanten_orders := Tfrmklanten_orders.Create(Application);
      frmklanten_orders.show();
end;

class procedure TfrmKlanten_orders.showformmodal();
var
  theform : Tfrmklanten_orders;
begin
theform := Tfrmklanten_orders.Create(Application);
theform.Button1.Visible:=true;
if theform.ShowModal = mrOK then
         ShowMessage('ok gedrukt');
end;

end.

