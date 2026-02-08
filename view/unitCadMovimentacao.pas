unit unitCadMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TformCadMovimentacao = class(TForm)
    Label1: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    btInserir: TButton;
    btDeletar: TButton;
    btSalvar: TButton;
    btCancelar: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    btAbrir: TButton;
    btFechar: TButton;
    DBNavigator2: TDBNavigator;
    Label6: TLabel;
    Label7: TLabel;
    Quantidade: TLabel;
    DBGrid2: TDBGrid;
    Label8: TLabel;
    txtTotalProdutos: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btAbrirClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadMovimentacao: TformCadMovimentacao;

implementation

{$R *.dfm}

uses unitDM;

procedure TformCadMovimentacao.btCancelarClick(Sender: TObject);
begin
  btInserir.enabled := True;
  btDeletar.Enabled := True;
  btSalvar.Enabled := False;
  btCancelar.Enabled := False;

  DM.tbMovimentacao.Cancel;
end;

procedure TformCadMovimentacao.btDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente deletar o registro?','ATENÇÃO',MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      DM.tbMovimentacao.Delete;
    end;

end;

procedure TformCadMovimentacao.btFecharClick(Sender: TObject);
begin
  DM.tbMovimentacao.Close;
end;

procedure TformCadMovimentacao.btInserirClick(Sender: TObject);
begin
  btInserir.enabled := False;
  btDeletar.Enabled := False;
  btSalvar.Enabled := True;
  btCancelar.Enabled := True;

  DM.tbMovimentacao.Append;
end;

procedure TformCadMovimentacao.btSalvarClick(Sender: TObject);
begin
  btInserir.enabled := True;
  btDeletar.Enabled := True;
  btSalvar.Enabled := False;
  btCancelar.Enabled := False;

  DM.tbMovimentacao.Post;
end;

procedure TformCadMovimentacao.Button5Click(Sender: TObject);
begin
  DM.tbMovimentacao.Prior;
end;

procedure TformCadMovimentacao.Button6Click(Sender: TObject);
begin
  DM.tbMovimentacao.Next;
end;

procedure TformCadMovimentacao.Button7Click(Sender: TObject);
begin
  DM.tbMovimentacao.Last;
end;

procedure TformCadMovimentacao.Button8Click(Sender: TObject);
begin
  DM.tbMovimentacao.First;
end;

procedure TformCadMovimentacao.btAbrirClick(Sender: TObject);
begin
  DM.tbMovimentacao.Open;
end;

procedure TformCadMovimentacao.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    begin
      DM.tbMovimentacaodataHora.Value := Now;
    end;
end;

procedure TformCadMovimentacao.FormShow(Sender: TObject);
begin
  txtTotalProdutos.Caption := IntToStr(DM.tbMovProdutos.RecordCount);
  DM.CalcularTotais;
end;

end.
