Imports System.Data.SqlClient

Public Class Dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Fetch ticket summary from the database
            Dim connectionString As String = "Data Source=castle\SQLEXPRESS;Initial Catalog=TicketManagementSystem;Integrated Security=True"

            Dim p1Count As Integer = 0
            Dim p2Count As Integer = 0
            Dim p3Count As Integer = 0
            Dim totalCount As Integer = 0
            Dim highPriorityCount As Integer = 0
            Dim mediumPriorityCount As Integer = 0
            Dim lowPriorityCount As Integer = 0

            Using connection As New SqlConnection(connectionString)
                connection.Open()
                Using command As New SqlCommand("SELECT COUNT(*) FROM TicketInfo WHERE Severity = 'High'", connection)
                    highPriorityCount = Convert.ToInt32(command.ExecuteScalar())
                End Using
                Using command As New SqlCommand("SELECT COUNT(*) FROM TicketInfo WHERE Severity = 'Medium'", connection)
                    mediumPriorityCount = Convert.ToInt32(command.ExecuteScalar())
                End Using
                Using command As New SqlCommand("SELECT COUNT(*) FROM TicketInfo WHERE Severity = 'Low'", connection)
                    lowPriorityCount = Convert.ToInt32(command.ExecuteScalar())
                End Using
                Using command As New SqlCommand("SELECT COUNT(*) FROM TicketInfo", connection)
                    totalCount = Convert.ToInt32(command.ExecuteScalar())
                End Using
                Using command As New SqlCommand("SELECT COUNT(*) FROM TicketInfo WHERE Priority = 'P1'", connection)
                    p1Count = Convert.ToInt32(command.ExecuteScalar())
                End Using
                Using command As New SqlCommand("SELECT COUNT(*) FROM TicketInfo WHERE Priority = 'P2'", connection)
                    p2Count = Convert.ToInt32(command.ExecuteScalar())
                End Using
                Using command As New SqlCommand("SELECT COUNT(*) FROM TicketInfo WHERE Priority = 'P3'", connection)
                    p3Count = Convert.ToInt32(command.ExecuteScalar())
                End Using
            End Using

            ' Display the counts in the labels
            lblP1Count.Text = p1Count.ToString()
            lblP2Count.Text = p2Count.ToString()
            lblP3Count.Text = p3Count.ToString()
            lblTotalCount.Text = totalCount.ToString()
            lblHighPriorityCount.Text = highPriorityCount.ToString()
            lblMediumPriorityCount.Text = mediumPriorityCount.ToString()
            lblLowPriorityCount.Text = lowPriorityCount.ToString()
        End If

    End Sub

End Class