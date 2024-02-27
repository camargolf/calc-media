unit untMedia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg;

type
  TfrmMedia = class(TForm)
    edtN1: TEdit;
    edtN2: TEdit;
    edtRes: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCalc: TButton;
    btnLimpar: TButton;
    btnFechar: TButton;
    Label4: TLabel;
    edtN3: TEdit;
    stbDataHora: TStatusBar;
    Timer: TTimer;
    Image1: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMedia: TfrmMedia;

implementation

{$R *.dfm}

procedure TfrmMedia.btnCalcClick(Sender: TObject);
var n1,n2,n3,res: real;
begin
    if (edtN1.Text = '') or (edtN2.Text = '') or (edtN3.Text = '') then
    begin
        Application.MessageBox('Nota inválida!','Atenção',MB_OK);
        edtN1.SetFocus;
    end
    else
    begin
       n1 := StrToFloat(edtN1.Text);
       n2 := StrToFloat(edtN2.Text);
       n3 := StrToFloat(edtN3.Text);
       res := (n1 + n2 + n3) / 3;
       if res >= 5 then
          edtRes.Text := FormatFloat('#.0',res) + ' - Aprovado!'
       else
          edtRes.Text := FormatFloat('#.0',res) + ' - Reprovado';
    end;
end;

procedure TfrmMedia.btnFecharClick(Sender: TObject);
begin
   if Application.MessageBox('Deseja Fechar?','Atenção',
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = idyes then

     close;
end;

procedure TfrmMedia.btnLimparClick(Sender: TObject);
begin
    edtN1.Clear;
    edtN2.Clear;
    edtN3.Clear;
    edtRes.Clear;
    edtN1.SetFocus;
end;

procedure TfrmMedia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = vk_f2 then
        btnCalc.Click;
     if key = vk_f3 then
        btnLimpar.Click;
     if key = VK_ESCAPE then
        btnFechar.Click;
end;

procedure TfrmMedia.TimerTimer(Sender: TObject);
begin
     stbDataHora.Panels[0].Text := DateToStr(date);
     stbDataHora.Panels[1].Text := FormatDateTime('hh:mm',time);
end;

end.

