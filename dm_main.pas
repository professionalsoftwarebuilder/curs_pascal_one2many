unit dm_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, Dialogs;

type

  { TdmMain }

  TdmMain = class(TDataModule)
    ds_orders: TDataSource;
    ds_klanten: TDataSource;
    qry_artart_afb: TStringField;
    qry_artart_code: TStringField;
    qry_artart_media: TStringField;
    qry_artart_naam: TStringField;
    qry_artart_omschrijving: TMemoField;
    qry_artid: TLongintField;
    qry_klantenid: TAutoIncField;
    qry_klantenklant_id: TLongintField;
    qry_klantenkl_achternaam: TStringField;
    qry_klantenkl_code: TStringField;
    qry_klantenkl_voonaam: TStringField;
    qry_ordersfk_klanten: TLongintField;
    qry_ordersid: TAutoIncField;
    qry_ordersorder_id: TLongintField;
    qry_ordersor_code: TStringField;
    qry_ordersor_naam: TStringField;
    qry_regelsaantal: TLongintField;
    qry_regelsart_naam: TStringField;
    qry_regelsfk_artikelen: TLongintField;
    qry_regelsfk_orders: TLongintField;
    qry_regelsid: TAutoIncField;
    SQLite3Connection1: TSQLite3Connection;
    qry_klanten: TSQLQuery;
    qry_orders: TSQLQuery;
    qry_art: TSQLQuery;
    qry_regels: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_klantenAfterPost(DataSet: TDataSet);
    procedure qry_ordersAfterInsert(DataSet: TDataSet);
    procedure qry_ordersAfterPost(DataSet: TDataSet);
    procedure qry_regelsAfterInsert(DataSet: TDataSet);
  private
    procedure updateall(asqlquery: TSQLQuery);
  public

  end;

var
  dmMain: TdmMain;

implementation

{$R *.lfm}

{ TdmMain }

uses frm_artikelen;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  SQLite3Connection1.Connected:=true;
  SQLTransaction1.Active:=true;
  qry_klanten.Active:=true;
  qry_orders.Active:=true;
  qry_art.active:=true;
  qry_regels.Active:=true;
end;

procedure TdmMain.qry_klantenAfterPost(DataSet: TDataSet);
begin
       updateall(dataset as TSQLQuery);
end;

procedure TdmMain.qry_ordersAfterInsert(DataSet: TDataSet);
begin
  qry_ordersfk_klanten.AsLongint:= qry_klantenid.AsLongint;
end;

procedure TdmMain.qry_ordersAfterPost(DataSet: TDataSet);
begin
    updateall(dataset as TSQLQuery);
end;

procedure TdmMain.qry_regelsAfterInsert(DataSet: TDataSet);
begin
  qry_regelsfk_orders.AsLongint:= qry_ordersid.AsLongint;

end;


procedure TdmMain.updateall(asqlquery: TSQLQuery);
begin
  try
    try
      asqlquery.DisableControls;
      asqlquery.ApplyUpdates(-1);
      SQLTransaction1.CommitRetaining;
    except
      ShowMessage('er ging iets fout');
    end;
  finally
    asqlquery.EnableControls;
  end;
end;

end.

