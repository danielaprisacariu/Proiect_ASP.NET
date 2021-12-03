<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="P_ExamenAuto.WebForm2" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" media="screen" href="~/styles/StyleSheet1.css" />
</head>
<body>
    <form id="form1" runat="server">
		<div><asp:ImageButton ID="btnInapoi" runat="server" Height="22px" ImageUrl="~/arrow.png" OnClick="btnInapoi_Click1" Width="29px" />
     </div>
        <div id ="main">
        	<br />
			<br />
        	<asp:Label ID="titlu" runat="server" ForeColor="#003399" Text="Adauga cursant"></asp:Label>
			<br />
			<br />
			<br />
			&nbsp;&nbsp;
			<asp:Label ID="Label1" runat="server" Text="Nume:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbNume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label2" runat="server" Text="Prenume:"></asp:Label>
&nbsp;<asp:TextBox ID="tbPrenume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			&nbsp;&nbsp; &nbsp;&nbsp;
			<asp:Label ID="Label3" runat="server" Text="CNP:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbCNP" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbCNP" ErrorMessage="CNP invalid!" ForeColor="Red" ValidationExpression="\b[1-8]\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])(0[1-9]|[1-4]\d|5[0-2]|99)\d{4}\b">*</asp:RegularExpressionValidator>
			<br />
			&nbsp;<br />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label4" runat="server" Text="Telefon:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbTelefon" runat="server" Height="22px" style="margin-left: 0px" Width="169px"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbTelefon" Display="Dynamic" ErrorMessage="Nr de telefon invalid" ForeColor="Red" ValidationExpression="(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$">*</asp:RegularExpressionValidator>
			&nbsp;
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;
			<asp:Label ID="Label5" runat="server" Text="Adresa:"></asp:Label>
&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbAdresa" runat="server" Height="63px" style="margin-left: 0px" TextMode="MultiLine" Width="169px"></asp:TextBox>
			&nbsp;
			<br />
			<asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
			<br />
			<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btnAduga" runat="server" Text="Adauga" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="77px" OnClick="btnAduga_Click" />
			<br />
			<br />
			<br />
			<div id="main1">
			<asp:GridView ID="GridView1" runat="server" Height="166px" Width="1063px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdCursant" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="IdCursant" HeaderText="IdCursant" ReadOnly="True" SortExpression="IdCursant" />
					<asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
					<asp:BoundField DataField="Prenume" HeaderText="Prenume" SortExpression="Prenume" />
					<asp:BoundField DataField="CNP" HeaderText="CNP" SortExpression="CNP" />
					<asp:BoundField DataField="Adresa" HeaderText="Adresa" SortExpression="Adresa" />
					<asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
					<asp:CommandField ButtonType="Button" ShowEditButton="True" />
					<asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
				</Columns>
				<EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
			</asp:GridView>
        	&nbsp;
        	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" DeleteCommand="DELETE FROM [tblCursanti] WHERE [IdCursant] = @IdCursant" InsertCommand="INSERT INTO [tblCursanti] ([IdCursant], [Nume], [Prenume], [CNP], [Adresa], [Telefon]) VALUES (@IdCursant, @Nume, @Prenume, @CNP, @Adresa, @Telefon)" SelectCommand="SELECT * FROM [tblCursanti]" UpdateCommand="UPDATE tblCursanti SET Nume = @Nume, Prenume = @Prenume, CNP = @CNP, Adresa = @Adresa, Telefon = @Telefon WHERE (IdCursant = @IdCursant) AND (@Nume IS NOT NULL) AND (@Prenume IS NOT NULL) AND (@CNP IS NOT NULL) AND (@Telefon IS NOT NULL)">
				<DeleteParameters>
					<asp:Parameter Name="IdCursant" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="IdCursant" Type="Int32" />
					<asp:Parameter Name="Nume" Type="String" />
					<asp:Parameter Name="Prenume" Type="String" />
					<asp:Parameter Name="CNP" Type="String" />
					<asp:Parameter Name="Adresa" Type="String" />
					<asp:Parameter Name="Telefon" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="Nume" Type="String" />
					<asp:Parameter Name="Prenume" Type="String" />
					<asp:Parameter Name="CNP" Type="String" />
					<asp:Parameter Name="Adresa" Type="String" />
					<asp:Parameter Name="Telefon" Type="String" />
					<asp:Parameter Name="IdCursant" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
				</div>
        </div>
    </form>
</body>
</html>
