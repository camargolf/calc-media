program prjMedia;

uses
  Vcl.Forms,
  untMedia in 'untMedia.pas' {frmMedia},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmMedia, frmMedia);
  Application.Run;
end.
