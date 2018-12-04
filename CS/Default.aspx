<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>1 ASPxGridView - How to implement navigation by Up/Left/Down/Right buttons when the Batch Edit mode is used</title>
    <script type="text/javascript">
        var FocusedCellColumnIndex = 0;
        var FocusedCellRowIndex = 0;
        var lastRecordIndex;
        var colCount;
        var firstRecordIndex;

        function OnInit(s, e) {
            lastRecordIndex = Grid.GetTopVisibleIndex() + Grid.GetVisibleRowsOnPage() - 1;
            colCount = Grid.GetColumnCount();
            firstRecordIndex = Grid.GetTopVisibleIndex();
            ASPxClientUtils.AttachEventToElement(Grid.GetMainElement(), "keydown", function (evt) {
                if (evt.keyCode === ASPxClientUtils.StringToShortcutCode("UP"))
                    UpPressed();
                else if (evt.keyCode === ASPxClientUtils.StringToShortcutCode("DOWN"))
                    DownPressed();
                else if (evt.keyCode === ASPxClientUtils.StringToShortcutCode("RIGHT"))
                    RightPressed();
                else if (evt.keyCode === ASPxClientUtils.StringToShortcutCode("LEFT"))
                    LeftPressed();
            });
        }
        function OnEndCallback(s, e) {
            lastRecordIndex = Grid.GetTopVisibleIndex() + Grid.GetVisibleRowsOnPage() - 1;
            firstRecordIndex = Grid.GetTopVisibleIndex();
        }
        function OnStartEditCell(s, e) {
            FocusedCellColumnIndex = e.focusedColumn.index;
            FocusedCellRowIndex = e.visibleIndex;
        }
        function OnEndEditCell(s, e) {
            FocusedCellColumnIndex = 0;
            FocusedCellRowIndex = 0;
        }
        function UpPressed() {
            if (FocusedCellRowIndex > firstRecordIndex)
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex - 1, FocusedCellColumnIndex);
            else if (FocusedCellColumnIndex > 0)
                Grid.batchEditApi.StartEdit(lastRecordIndex, FocusedCellColumnIndex - 1);
        }
        function DownPressed() {
            if (FocusedCellRowIndex < lastRecordIndex)
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex + 1, FocusedCellColumnIndex);
            else if (FocusedCellColumnIndex < colCount - 1)
                Grid.batchEditApi.StartEdit(firstRecordIndex, FocusedCellColumnIndex + 1);
        }
        function RightPressed() {
            if (FocusedCellColumnIndex < colCount - 1)
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex, FocusedCellColumnIndex + 1);
            else if (FocusedCellRowIndex < lastRecordIndex)
                    Grid.batchEditApi.StartEdit(FocusedCellRowIndex + 1, 0);
        }
        function LeftPressed() {
            if (FocusedCellColumnIndex > 0)
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex, FocusedCellColumnIndex - 1);
            else if (FocusedCellRowIndex > firstRecordIndex)
                    Grid.batchEditApi.StartEdit(FocusedCellRowIndex - 1, colCount - 1);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="Grid" runat="server" ClientInstanceName="Grid">
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <ClientSideEvents Init="OnInit" BatchEditStartEditing="OnStartEditCell" BatchEditEndEditing="OnEndEditCell" EndCallback="OnEndCallback" />
            </dx:ASPxGridView>
        </div>
    </form>
</body>
</html>
