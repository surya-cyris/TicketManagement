Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Dim connectionString As String = "Data Source=castle\SQLEXPRESS;Initial Catalog=TicketManagementSystem;Integrated Security=True"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ListTickets()
    End Sub

    Protected Sub ListTickets()
        Dim connection As New SqlConnection(connectionString)
        Dim command As New SqlCommand("select * from TicketInfo", connection)
        Dim sd As New SqlDataAdapter(command)
        Dim dt As New DataTable
        sd.Fill(dt)
        GridViewOpenTickets.DataSource = dt
        GridViewOpenTickets.DataBind()
    End Sub
    Protected Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click
        Dim ticketID As Integer = txtTicketID.Text
        Dim ticketTitle As String = txtTicketTitle.Text
        Dim description As String = txtDescription.Text
        Dim raisedBy As String = txtRaisedBy.Text
        Dim EmailId As String = txtEmailId.Text
        Dim severity As String = RadioButtonListSeverity.SelectedValue
        Dim priority As String = DropDownListPriority.SelectedValue
        Dim issueDate As String = txtIssueDate.Text
        Dim environment As String = RadioButtonListEnvironment.SelectedValue
        Dim category As String = DropDownListCategory.SelectedValue
        Dim subCategory As String = DropDownListSubCategory.SelectedValue
        Dim subChildCategory As String = DropDownListSubChildCategory.SelectedValue

        Dim insertCommand As String = "INSERT INTO TicketInfo (TicketID, TicketTitle, Description, RaisedBy, EmailId, Severity, Priority, IssueDate, Environment, Category, SubCategory, SubChildCategory) " &
                              "VALUES (@TicketID, @TicketTitle, @Description, @RaisedBy, @EmailId, @Severity, @Priority, @IssueDate, @Environment, @Category, @SubCategory, @SubChildCategory)"

        Using connection As New SqlConnection(connectionString)
            connection.Open()
            Using command As New SqlCommand(insertCommand, connection)
                command.Parameters.AddWithValue("@TicketID", ticketID)
                command.Parameters.AddWithValue("@TicketTitle", ticketTitle)
                command.Parameters.AddWithValue("@Description", description)
                command.Parameters.AddWithValue("@RaisedBy", raisedBy)
                command.Parameters.AddWithValue("@EmailId", EmailId)
                command.Parameters.AddWithValue("@Severity", severity)
                command.Parameters.AddWithValue("@Priority", priority)
                command.Parameters.AddWithValue("@IssueDate", DateTime.Parse(issueDate))
                command.Parameters.AddWithValue("@Environment", environment)
                command.Parameters.AddWithValue("@Category", category)
                command.Parameters.AddWithValue("@SubCategory", subCategory)
                command.Parameters.AddWithValue("@SubChildCategory", subChildCategory)
                command.ExecuteNonQuery()
                MsgBox("Successfully Inserted", MsgBoxStyle.Information, "Message")

            End Using
            connection.Close()
        End Using
        ListTickets()
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim ticketID As Integer = Integer.Parse(txtTicketID.Text)
        Dim ticketTitle As String = txtTicketTitle.Text
        Dim description As String = txtDescription.Text
        Dim raisedBy As String = txtRaisedBy.Text
        Dim emailId As String = txtEmailId.Text
        Dim severity As String = RadioButtonListSeverity.SelectedValue
        Dim priority As String = DropDownListPriority.SelectedValue
        Dim issueDate As String = txtIssueDate.Text
        Dim environment As String = RadioButtonListEnvironment.SelectedValue
        Dim category As String = DropDownListCategory.SelectedValue
        Dim subCategory As String = DropDownListSubCategory.SelectedValue
        Dim subChildCategory As String = DropDownListSubChildCategory.SelectedValue

        Dim updateCommand As String = "UPDATE TicketInfo SET TicketTitle = @TicketTitle, Description = @Description, RaisedBy = @RaisedBy, EmailId = @EmailId, " &
                              "Severity = @Severity, Priority = @Priority, IssueDate = @IssueDate, Environment = @Environment, Category = @Category, " &
                              "SubCategory = @SubCategory, SubChildCategory = @SubChildCategory WHERE TicketID = @TicketID"

        Using connection As New SqlConnection(connectionString)
            connection.Open()
            Using command As New SqlCommand(updateCommand, connection)
                command.Parameters.AddWithValue("@TicketID", ticketID)
                command.Parameters.AddWithValue("@TicketTitle", ticketTitle)
                command.Parameters.AddWithValue("@Description", description)
                command.Parameters.AddWithValue("@RaisedBy", raisedBy)
                command.Parameters.AddWithValue("@EmailId", emailId)
                command.Parameters.AddWithValue("@Severity", severity)
                command.Parameters.AddWithValue("@Priority", priority)
                command.Parameters.AddWithValue("@IssueDate", DateTime.Parse(issueDate))
                command.Parameters.AddWithValue("@Environment", environment)
                command.Parameters.AddWithValue("@Category", category)
                command.Parameters.AddWithValue("@SubCategory", subCategory)
                command.Parameters.AddWithValue("@SubChildCategory", subChildCategory)
                command.ExecuteNonQuery()
                MsgBox("Successfully Updated", MsgBoxStyle.Information, "Message")
            End Using
            connection.Close()
        End Using

        ListTickets()

    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        Dim deleteCommand As String = "DELETE FROM TicketInfo WHERE TicketID = @TicketID"
        Using connection As New SqlConnection(connectionString)
            connection.Open()

            Using command As New SqlCommand(deleteCommand, connection)
                command.Parameters.AddWithValue("@TicketID", txtTicketID.Text)
                Dim rowsAffected As Integer = command.ExecuteNonQuery()
                If rowsAffected > 0 Then
                    MsgBox("Record deleted successfully", MsgBoxStyle.Information, "Message")
                Else
                    MsgBox("Ticket ID not found", MsgBoxStyle.Information, "Message")
                End If
            End Using
            connection.Close()
        End Using

        ListTickets()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim ticketID As Integer

        If Integer.TryParse(txtTicketID.Text, ticketID) Then
            'Dim connectionString As String = ""

            Using connection As New SqlConnection(connectionString)
                Dim command As New SqlCommand("SELECT * FROM TicketInfo WHERE TicketID = @TicketID", connection)
                command.Parameters.AddWithValue("@TicketID", ticketID)

                Using adapter As New SqlDataAdapter(command)
                    Dim dt As New DataTable()
                    adapter.Fill(dt)
                    GridViewOpenTickets.DataSource = dt
                    GridViewOpenTickets.DataBind()
                End Using
            End Using
        Else
        End If
    End Sub

End Class