unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Grids,

  VirtualTrees.BaseAncestorVCL,
  VirtualTrees.BaseTree,
  VirtualTrees.AncestorVCL,
  VirtualTrees, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, cxFilter, cxCustomData, cxStyles, dxScrollbarAnnotations, cxTL,
  cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData;

type
  PNodeData = ^TNodeData;
  TNodeData = record
    a, b, c, d: string;
  end;

  TData = class
    a, b, c, d: string;
  end;
  TForm6 = class(TForm)
    StringGrid1: TStringGrid;
    VirtualStringTree1: TVirtualStringTree;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    cxVirtualTreeList1: TcxVirtualTreeList;
    cxVirtualTreeList1Column1: TcxTreeListColumn;
    cxVirtualTreeList1Column2: TcxTreeListColumn;
    cxVirtualTreeList1Column3: TcxTreeListColumn;
    cxVirtualTreeList1Column4: TcxTreeListColumn;
    cxVirtualTreeList1Column5: TcxTreeListColumn;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure VirtualStringTree1GetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: string);
    procedure VirtualStringTree1FreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure VirtualStringTree1InitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cxVirtualTreeList1GetChildCount(Sender: TcxCustomTreeList;
      AParentNode: TcxTreeListNode; var ACount: Integer);
    procedure cxVirtualTreeList1GetNodeValue(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; AColumn: TcxTreeListColumn; var AValue: Variant);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FNodes: TObjectList<TData>;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form6: TForm6;

implementation

uses
  System.Diagnostics;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  var LStopWatch := TStopwatch.StartNew;
  try
    StringGrid1.RowCount := StrToInt(Edit1.Text);
    for var i := 1 to StringGrid1.RowCount-1 do
      for var j := 1 to 4 do
        StringGrid1.Cells[j, i] := IntToStr(i * j);
  finally
    LStopWatch.Stop;
    Memo1.Lines.Add('StringGrid: ' + LStopWatch.ElapsedMilliseconds.ToString);
  end;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  var LStopWatch := TStopwatch.StartNew;
  var LNodeData: PNodeData;
  try
    VirtualStringTree1.Clear;
    VirtualStringTree1.RootNodeCount := StrToInt(Edit1.Text);
  finally
    LStopWatch.Stop;
    Memo1.Lines.Add('VirtualStringTree: ' + LStopWatch.ElapsedMilliseconds.ToString);
  end;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  var LStopWatch := TStopwatch.StartNew;
  var LNodeData: PNodeData;
  try
    VirtualStringTree1.Clear;
    VirtualStringTree1.BeginUpdate;
    for var i := 1 to StrToInt(Edit1.Text) do
    begin
      var LNode := VirtualStringTree1.AddChild(nil);
      LNodeData := VirtualStringTree1.GetNodeData(LNode);
      LNodeData.a := IntToStr(i * 1);
      LNodeData.b := IntToStr(i * 2);
      LNodeData.c := IntToStr(i * 3);
      LNodeData.d := IntToStr(i * 4);
    end;
    VirtualStringTree1.EndUpdate;
  finally
    LStopWatch.Stop;
    Memo1.Lines.Add('VirtualStringTree: ' + LStopWatch.ElapsedMilliseconds.ToString);
  end;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  var LStopWatch := TStopwatch.StartNew;
  var LNodeData: PNodeData;
  try
    cxVirtualTreeList1.BeginUpdate;
    cxVirtualTreeList1.Clear;
    FNodes.Clear;
    for var i := 1 to StrToInt(Edit1.Text) do
    begin
      var LData := TData.Create;
      LData.a := IntToStr(i * 1);
      LData.b := IntToStr(i * 2);
      LData.c := IntToStr(i * 3);
      LData.d := IntToStr(i * 4);

      FNodes.Add(LData);
      var LNode := cxVirtualTreeList1.Root.AddChild;
      //LNode.Data := LData;
    end;
    cxVirtualTreeList1.EndUpdate;
  finally
    LStopWatch.Stop;
    Memo1.Lines.Add('cxVirtualTree: ' + LStopWatch.ElapsedMilliseconds.ToString);
  end;

  cxVirtualTreeList1.FullRefresh;
end;

constructor TForm6.Create(AOwner: TComponent);
begin
  inherited;
  VirtualStringTree1.NodeDataSize := SizeOf(TNodeData);
 // VirtualStringTree1.Node
  FNodes := TObjectList<TData>.Create(True);
end;

procedure TForm6.cxVirtualTreeList1GetChildCount(Sender: TcxCustomTreeList;
  AParentNode: TcxTreeListNode; var ACount: Integer);
begin
  if FNodes = nil then exit;

  if AParentNode = Sender.Root then
    ACount := FNodes.Count;
end;

procedure TForm6.cxVirtualTreeList1GetNodeValue(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AColumn: TcxTreeListColumn; var AValue: Variant);
begin
  var LData := FNodes.Items[ANode.Index];
  if LData = nil then exit;

  case AColumn.ItemIndex of
  0:
    AValue := '';
  1:
    AValue := LData.a;
  2:
    AValue := LData.b;
  3:
    AValue := LData.c;
  4:
    AValue := LData.d;
  end;
end;

procedure TForm6.FormDestroy(Sender: TObject);
begin
  FNodes.Free;
end;

procedure TForm6.VirtualStringTree1FreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  LNodeData: PNodeData;
begin
  LNodeData := Sender.GetNodeData(Node);
  Finalize(LNodeData^);
end;

procedure TForm6.VirtualStringTree1GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  LNodeData: PNodeData;
begin
  LNodeData := Sender.GetNodeData(Node);
  case Column of
  0:
    CellText := '';
  1:
    CellText := LNodeData^.a;
  2:
    CellText := LNodeData^.b;
  3:
    CellText := LNodeData^.c;
  4:
    CellText := LNodeData^.d;
  end;
end;

procedure TForm6.VirtualStringTree1InitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PNodeData;
begin
//  with Sender do
//  begin
//    Data := GetNodeData(Node);
//    Data.a := IntToStr(Node.Index * 1);
//    Data.b := IntToStr(Node.Index * 2);
//    Data.c := IntToStr(Node.Index * 3);
//    Data.d := IntToStr(Node.Index * 4);
//  end;
end;

end.
