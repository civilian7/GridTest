object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 473
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnDestroy = FormDestroy
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 24
    Top = 32
    Width = 409
    Height = 177
    DrawingStyle = gdsClassic
    TabOrder = 0
  end
  object VirtualStringTree1: TVirtualStringTree
    Left = 25
    Top = 247
    Width = 408
    Height = 178
    DefaultNodeHeight = 19
    Header.AutoSizeIndex = 0
    Header.Height = 28
    Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
    TabOrder = 1
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines]
    OnFreeNode = VirtualStringTree1FreeNode
    OnGetText = VirtualStringTree1GetText
    OnInitNode = VirtualStringTree1InitNode
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Columns = <
      item
        Position = 0
        Text = 'Col1'
      end
      item
        Position = 1
      end
      item
        Position = 2
      end
      item
        Position = 3
      end
      item
        Position = 4
      end>
  end
  object Button1: TButton
    Left = 358
    Top = 215
    Width = 75
    Height = 25
    Caption = 'Fill Data'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 439
    Top = 247
    Width = 442
    Height = 210
    TabOrder = 3
  end
  object Button2: TButton
    Left = 277
    Top = 431
    Width = 75
    Height = 25
    Caption = 'Fill Data'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 5
    Text = '10000'
  end
  object Button3: TButton
    Left = 358
    Top = 431
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 6
    OnClick = Button3Click
  end
  object cxVirtualTreeList1: TcxVirtualTreeList
    Left = 440
    Top = 32
    Width = 441
    Height = 177
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsView.ShowRoot = False
    ScrollbarAnnotations.CustomAnnotations = <>
    TabOrder = 7
    OnGetChildCount = cxVirtualTreeList1GetChildCount
    OnGetNodeValue = cxVirtualTreeList1GetNodeValue
    object cxVirtualTreeList1Column1: TcxTreeListColumn
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxVirtualTreeList1Column2: TcxTreeListColumn
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxVirtualTreeList1Column3: TcxTreeListColumn
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxVirtualTreeList1Column4: TcxTreeListColumn
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxVirtualTreeList1Column5: TcxTreeListColumn
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object Button4: TButton
    Left = 800
    Top = 216
    Width = 75
    Height = 25
    Caption = 'FillData'
    TabOrder = 8
    OnClick = Button4Click
  end
end
