<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="P_ExamenAuto.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
		<link rel="stylesheet" media="screen" href="~/styles/StyleSheet1.css" />

</head>
<body>
    <form id="form1" runat="server">
		<div>
			 <asp:ImageButton ID="btnInapoi" runat="server" Height="22px" ImageUrl="~/arrow.png" OnClick="btnInapoi_Click1" Width="29px" />
		</div>
        <div id ="main">
        	<br />
			<br />
        	<asp:Label ID="titlu" runat="server" ForeColor="#003399" Text="Adauga Instructor"></asp:Label>
			<br />
			<br />
			<br />
			<asp:Label ID="Label1" runat="server" Text="Nume:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbNume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			<asp:Label ID="Label2" runat="server" Text="Prenume:"></asp:Label>
&nbsp;<asp:TextBox ID="tbPrenume" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<br />
			<br />
			&nbsp;
			<asp:Label ID="Label3" runat="server" Text="CNP:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbCNP" runat="server" Height="22px" style="margin-left: 2px" Width="169px"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbCNP" ErrorMessage="CNP invalid!" ForeColor="Red" ValidationExpression="\b[1-8]\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])(0[1-9]|[1-4]\d|5[0-2]|99)\d{4}\b">*</asp:RegularExpressionValidator>
			<br />
			&nbsp;<br />
			&nbsp;
			<asp:Label ID="Label4" runat="server" Text="Telefon:"></asp:Label>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="tbTelefon" runat="server" Height="22px" style="margin-left: 0px" Width="169px"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbTelefon" Display="Dynamic" ErrorMessage="Nr de telefon invalid" ForeColor="Red" ValidationExpression="(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$">*</asp:RegularExpressionValidator>
			&nbsp;&nbsp;
			&nbsp;
			<br />
			<br />
			<asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
			<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="btnAduga" runat="server" Text="Adauga" BackColor="#336699" BorderColor="Black" ForeColor="Black" Height="30px" Width="77px" OnClick="btnAduga_Click" />
			<br />
			<br />
			<br />
			<div id="main1">
			<asp:GridView ID="GridView1" runat="server" Height="166px" Width="1063px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdInstructor" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="IdInstructor" HeaderText="IdInstructor" ReadOnly="True" SortExpression="IdInstructor" />
					<asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
					<asp:BoundField DataField="Prenume" HeaderText="Prenume" SortExpression="Prenume" />
					<asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
					<asp:BoundField DataField="CNP" HeaderText="CNP" SortExpression="CNP" />
					<asp:CommandField ButtonType="Button" ShowEditButton="True" />
					<asp:CommandField ButtonType="Button" InsertImageUrl="~/delete.png" ShowDeleteButton="True" />
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
        	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" DeleteCommand="DELETE FROM [tblInstructori] WHERE [IdInstructor] = @IdInstructor" InsertCommand="INSERT INTO [tblInstructori] ([IdInstructor], [Nume], [Prenume], [Telefon], [CNP]) VALUES (@IdInstructor, @Nume, @Prenume, @Telefon, @CNP)" SelectCommand="SELECT * FROM [tblInstructori]" UpdateCommand="UPDATE [tblInstructori] SET [Nume] = @Nume, [Prenume] = @Prenume, [Telefon] = @Telefon, [CNP] = @CNP WHERE [IdInstructor] = @IdInstructor AND (@Nume IS NOT NULL) AND (@Prenume is not null) AND (@Telefon IS NOT NULL) AND (@CNP IS NOT NULL)">
				<DeleteParameters>
					<asp:Parameter Name="IdInstructor" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="IdInstructor" Type="Int32" />
					<asp:Parameter Name="Nume" Type="String" />
					<asp:Parameter Name="Prenume" Type="String" />
					<asp:Parameter Name="Telefon" Type="String" />
					<asp:Parameter Name="CNP" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="Nume" Type="String" />
					<asp:Parameter Name="Prenume" Type="String" />
					<asp:Parameter Name="Telefon" Type="String" />
					<asp:Parameter Name="CNP" Type="String" />
					<asp:Parameter Name="IdInstructor" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
				</div>
        </div>
		<div>
        		<asp:TextBox ID="tbMes" runat="server" BackColor="#C8DFE6" Height="44px" TextMode="MultiLine" Width="320px"></asp:TextBox>
        </div>
    </form>
    
        
    
</body>
</html>
