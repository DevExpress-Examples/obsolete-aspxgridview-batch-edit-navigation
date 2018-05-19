Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        Grid.DataSource = Data.GetData()
        Grid.KeyFieldName = "ID"
        Grid.DataBind()
    End Sub
End Class

Public Class Data
    Public Property ID() As Integer
    Public Property SomeData() As String
    Public Property AnotherData() As String
    Public Shared Function GetData() As List(Of Data)
        Return Enumerable.Range(0, 20).Select(Function(i) New Data() With {.ID = i, .SomeData = "Data " & i, .AnotherData = "AnotherData" & i}).ToList()
    End Function
End Class
