unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, LCLType,
  {$IFDEF WINDOWS}MMSystem;{$ELSE};{$ENDIF}
  //added LCLType for KeyPress events
  //added MMSystem for sndPlaySound method

type

  { TForm1 }

  TForm1 = class(TForm)
    lbAct3: TLabel;
    lbActions: TLabel;
    lbAct1: TLabel;
    lbAct2: TLabel;
    lbStory: TLabel;
    Timer1: TTimer;
    tStory: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure loadScene();
    procedure hidelbActions();
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }

  end;

var
  Form1: TForm1;
  Sc: integer;
  soundAddress: string;
implementation
{$R *.lfm}

{ TForm1 }
procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Sc:=1;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  //Hello world;

end;


procedure TForm1.loadScene();
begin
  If Sc = 1 then
  begin
    tStory.Lines.Clear;
    tStory.Lines.Add('Mancipi vero res sunt, quae per mancipationem ad alium transferuntur.');
    tStory.Lines.Add('Res mobiles non nisi praesentes mancipari possunt, et non plures, quam quot manu capi possunt. Immobiles autem etiam plures simul, et quae diversis locis sunt, mancipari possunt.');
    lbAct1.Caption := 'please, continue';
    lbAct2.Caption := 'run from here, now';
    lbAct3.Caption := '';
    hidelbActions();
    soundAddress:='content/eng/'+'v1.wav';
    sndPlaySound(PChar(soundAddress),SND_NODEFAULT Or SND_SYNC);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled :=False;
  loadScene();
end;

procedure TForm1.hidelbActions();
begin
  if lbAct2.Caption = '' then
    lbAct2.Visible := False;
  if lbAct3.Caption = '' then
    lbAct3.Visible := False;
end;

end.

