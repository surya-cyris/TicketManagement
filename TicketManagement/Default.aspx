<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="TicketManagement._Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:blueviolet;font-size:xx-large;color:white" align="center">
        Ticket Management System
    </div>

    <br />
    <style>tbody tr {
        margin-bottom: 10px; /* Adjust the desired space between rows here */
    }
    </style>
    <div style="padding:15px">

        <table class="nav-justified">
            <tr>
                <td style="width: 329px">
                    <strong>
                    <asp:Label ID="lblTicketID" runat="server" Text="Ticket ID" Font-Bold="True" Font-Size="Medium"></asp:Label>
                    </strong>
                </td>
                <td>
                    <asp:TextBox ID="txtTicketID" runat="server" Width="200px"></asp:TextBox>
                &nbsp;&nbsp;
                    <asp:Button ID="btnSearch" runat="server" BackColor="#9900FF" BorderColor="Black" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="White" Height="39px" Text="Search" Width="91px" />
                </td>
            </tr>
            <tr>
                <td style="width: 329px">
                    <strong>
                    <asp:Label ID="lblTicketTitle" runat="server" Text="Ticket Title" Font-Bold="True" Font-Size="Medium"></asp:Label>
                    </strong>
                </td>
                <td>
                    <asp:TextBox ID="txtTicketTitle" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblTicketDescription" runat="server" Text="Description" Font-Bold="True" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblRaisedBy" runat="server" Text="Raised By" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:TextBox ID="txtRaisedBy" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblEmailID" runat="server" Text="Email ID" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:TextBox ID="txtEmailId" runat="server" TextMode="Email" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblSeverity" runat="server" Text="Severity" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListSeverity" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Low</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>High</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblPriority" runat="server" Text="Priority" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:DropDownList ID="DropDownListPriority" runat="server" Font-Size="Medium">
                        <asp:ListItem>P1</asp:ListItem>
                        <asp:ListItem>P2</asp:ListItem>
                        <asp:ListItem>P3</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblDate" runat="server" Text="Issue Date" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:TextBox ID="txtIssueDate" runat="server" Width="200px"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtIssueDate_CalendarExtender" runat="server" BehaviorID="txtIssueDate_CalendarExtender" TargetControlID="txtIssueDate">
                    </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblEnvironment" runat="server" Text="Environment" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListEnvironment" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>DEV</asp:ListItem>
                        <asp:ListItem>UAT</asp:ListItem>
                        <asp:ListItem>PROD</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblCategory" runat="server" Text="Category" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:DropDownList ID="DropDownListCategory" runat="server" Font-Size="Medium" Width="200px">
                        <asp:ListItem>Software</asp:ListItem>
                        <asp:ListItem>Hardware</asp:ListItem>
                        <asp:ListItem>Network</asp:ListItem>
                        <asp:ListItem>Security</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 22px; width: 329px"><strong>
                    <asp:Label ID="lblSubCategory" runat="server" Text="Sub Category" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td style="height: 22px">
                    <asp:DropDownList ID="DropDownListSubCategory" runat="server" Font-Size="Medium" Width="200px">
                        <asp:ListItem>IP Blocked</asp:ListItem>
                        <asp:ListItem>Site Not Accessible</asp:ListItem>
                        <asp:ListItem>Storage Full</asp:ListItem>
                        <asp:ListItem>High Network Load</asp:ListItem>
                        <asp:ListItem>Network Not accessible</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 329px"><strong>
                    <asp:Label ID="lblSubChildCategory" runat="server" Text="Sub Child Category" Font-Size="Medium"></asp:Label>
                    </strong></td>
                <td>
                    <asp:DropDownList ID="DropDownListSubChildCategory" runat="server" Font-Size="Medium" Width="200px">
                        <asp:ListItem>MS SQL Server</asp:ListItem>
                        <asp:ListItem>IIS Server</asp:ListItem>
                        <asp:ListItem>Outlook</asp:ListItem>
                        <asp:ListItem>SSD</asp:ListItem>
                        <asp:ListItem>HDD</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 329px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnInsert" runat="server" BackColor="#9900FF" BorderColor="Black" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="White" Height="39px" Text="Insert" Width="91px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" BackColor="#9900FF" BorderColor="Black" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="White" Height="39px" Text="Update" Width="91px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" BackColor="#9900FF" BorderColor="Black" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="White" Height="39px" Text="Delete" Width="91px" OnClientClick="return confirm('Are you confirm to delete?')" />
                </td>
            </tr>
        </table>

        <div align="center">
            <h3>Opened tickets</h3>
            <hr />
            <asp:GridView ID="GridViewOpenTickets" runat="server" Width="80%" CellSpacing="3">
                <HeaderStyle BackColor="#9933FF" ForeColor="White" />
            </asp:GridView>

        </div>

    </div>
</asp:Content>
