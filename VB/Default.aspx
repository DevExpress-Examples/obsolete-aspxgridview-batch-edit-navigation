<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var FocusedCellColumnIndex = 0;
        var FocusedCellRowIndex = 0;
        function OnInit(s, e) {
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
        function OnStartEditCell(s, e) {
            FocusedCellColumnIndex = e.focusedColumn.index;
            FocusedCellRowIndex = e.visibleIndex;
        }
        function OnEndEditCell(s, e) {
            FocusedCellColumnIndex = 0;
            FocusedCellRowIndex = 0;
        }
        function UpPressed() {
            if (FocusedCellRowIndex > Grid.GetTopVisibleIndex())
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex - 1, FocusedCellColumnIndex);
            else
                Grid.batchEditApi.EndEdit();
        }
        function DownPressed() {
            var lastRecordIndex = Grid.GetTopVisibleIndex() + Grid.GetVisibleRowsOnPage() - 1;
            if (FocusedCellRowIndex < lastRecordIndex)
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex + 1, FocusedCellColumnIndex);
            else
                Grid.batchEditApi.EndEdit();
        }
        function RightPressed() {
            if (FocusedCellColumnIndex < Grid.GetColumnCount())
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex, FocusedCellColumnIndex + 1);
            else
                Grid.batchEditApi.EndEdit();
        }
        function LeftPressed() {
            if (FocusedCellColumnIndex > 0)
                Grid.batchEditApi.StartEdit(FocusedCellRowIndex, FocusedCellColumnIndex - 1);
            else
                Grid.batchEditApi.EndEdit();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="Grid" runat="server" ClientInstanceName="Grid">
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <ClientSideEvents Init="OnInit" BatchEditStartEditing="OnStartEditCell" BatchEditEndEditing="OnEndEditCell" />
            </dx:ASPxGridView>
        </div>
    </form>
</body>
</html>