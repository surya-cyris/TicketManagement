<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="TicketManagement.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Dashboard</h2>
            <h3>Ticket Summary</h3>
            <table>
                <tr>
                    <td>P1 Tickets:</td>
                    <td><asp:Label ID="lblP1Count" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>P2 Tickets:</td>
                    <td><asp:Label ID="lblP2Count" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>P3 Tickets:</td>
                    <td><asp:Label ID="lblP3Count" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Total Tickets:</td>
                    <td><asp:Label ID="lblTotalCount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Total High Priority Tickets:</td>
                    <td><asp:Label ID="lblHighPriorityCount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Total Medium Priority Tickets:</td>
                    <td><asp:Label ID="lblMediumPriorityCount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Total Low Priority Tickets:</td>
                    <td><asp:Label ID="lblLowPriorityCount" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
