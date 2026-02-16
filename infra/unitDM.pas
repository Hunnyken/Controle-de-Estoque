unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    tbProdutos: TFDTable;
    dsProdutos: TDataSource;
    tbMovimentacao: TFDTable;
    dsMovimentacao: TDataSource;
    tbMovProdutos: TFDTable;
    dsMovProdutos: TDataSource;
    sqlAumentaEstoque: TFDCommand;
    sqlDiminuiEstoque: TFDCommand;
    sqlMovimentacoes: TFDQuery;
    dsSqlMovimentacoes: TDataSource;
    tbProdutosid: TFDAutoIncField;
    tbProdutosnome: TStringField;
    tbProdutosfabricante: TStringField;
    tbProdutosvalidade: TDateField;
    tbProdutosestoque_atual: TIntegerField;
    tbMovimentacaoid: TFDAutoIncField;
    tbMovimentacaotipo: TStringField;
    tbMovimentacaodataHora: TDateTimeField;
    tbMovimentacaoresponsavel: TStringField;
    tbMovimentacaoobservacoes: TMemoField;
    tbMovProdutosid: TFDAutoIncField;
    tbMovProdutosid_movimentacao: TIntegerField;
    tbMovProdutosid_produto: TIntegerField;
    tbMovProdutosqtd: TIntegerField;
    tbMovProdutosnomeProduto: TStringField;
    procedure tbMovProdutosAfterPost(DataSet: TDataSet);
    procedure tbMovProdutosAfterDelete(DataSet: TDataSet);
    procedure CalcularTotais;
    procedure tbMovProdutosBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unitCadMovimentacao;

{$R *.dfm}

procedure TDM.CalcularTotais;
var
  totais : Integer;
begin

  if tbMovProdutos.State in [dsBrowse] then
    begin
      totais := 0;
      tbMovProdutos.First;

      while not tbMovProdutos.Eof do
        begin
          totais := totais + tbMovProdutos.FieldByName('qtd').Value;
          tbMovProdutos.Next;
        end;

        formCadMovimentacao.txtTotalProdutos.Caption := IntToStr(totais);
    end;
end;

procedure TDM.tbMovProdutosAfterDelete(DataSet: TDataSet);
begin
  CalcularTotais;
end;

procedure TDM.tbMovProdutosAfterPost(DataSet: TDataSet);
begin
  CalcularTotais;

  if (tbMovimentacao.FieldByName('tipo').Value  = 'Entrada de Estoque')  then
    begin
      sqlAumentaEstoque.ParamByName('pId').Value := tbMovProdutos.FieldByName('id_produto').Value;
      sqlAumentaEstoque.ParamByName('pQtd').Value := tbMovProdutos.FieldByName('qtd').Value;
      sqlAumentaEstoque.Execute;
    end;

  if (tbMovimentacao.FieldByName('tipo').Value  = 'Saída de Estoque')  then
    begin
      sqlDiminuiEstoque.ParamByName('pId').Value := tbMovProdutos.FieldByName('id_produto').Value;
      sqlDiminuiEstoque.ParamByName('pQtd').Value := tbMovProdutos.FieldByName('qtd').Value;
      sqlDiminuiEstoque.Execute;
    end;
end;

procedure TDM.tbMovProdutosBeforeDelete(DataSet: TDataSet);
begin

  if (tbMovimentacao.FieldByName('tipo').Value  = 'Entrada de Estoque')  then
    begin
      sqlDiminuiEstoque.ParamByName('pId').Value := tbMovProdutos.FieldByName('id_produto').Value;
      sqlDiminuiEstoque.ParamByName('pQtd').Value := tbMovProdutos.FieldByName('qtd').Value;
      sqlDiminuiEstoque.Execute;
    end;

  if (tbMovimentacao.FieldByName('tipo').Value  = 'Saída de Estoque')  then
    begin
      sqlAumentaEstoque.ParamByName('pId').Value := tbMovProdutos.FieldByName('id_produto').Value;
      sqlAumentaEstoque.ParamByName('pQtd').Value := tbMovProdutos.FieldByName('qtd').Value;
      sqlAumentaEstoque.Execute;
    end;
end;

end.
