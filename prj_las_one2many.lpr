program prj_las_one2many;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, frm_main, frm_klanten_orders, dm_main, frm_artikelen, mplayercontrollaz
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(Tfrm_main_form, frm_main_form);
  Application.CreateForm(TfrmArtikelen, frmArtikelen);
  Application.Run;
end.

