<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="P_ExamenAuto.WebForm1" %>

<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
			<link rel="stylesheet" media="screen" href="~/styles/StyleSheet1.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 1247px" class ="home">
			<asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px">
				<DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
				<DynamicMenuStyle BackColor="#B5C7DE" />
				<DynamicSelectedStyle BackColor="#507CD1" />
				<DynamicItemTemplate>
					<%# Eval("Text") %>
				</DynamicItemTemplate>
				<Items>
					<asp:MenuItem Text="Adaugă Cursant" Value="Adaugă Cursant" NavigateUrl="~/WebForm2.aspx"></asp:MenuItem>
					<asp:MenuItem Text="Adaugă Instructor" Value="Adaugă instructor" NavigateUrl="~/WebForm3.aspx"></asp:MenuItem>
					<asp:MenuItem NavigateUrl="~/WebForm4.aspx" Text="Grafic " Value="Grafic"></asp:MenuItem>
				</Items>
				<StaticHoverStyle BackColor="#284E98" ForeColor="White" />
				<StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
				<StaticSelectedStyle BackColor="#507CD1" />
			</asp:Menu>
			

			
			<br />
			

			
			<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" Height="24px" Width="775px" DataKeyNames="IdExamen" GridLines="None" AllowPaging="True" AllowSorting="True" >
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:BoundField DataField="IdExamen" HeaderText="IdExamen" SortExpression="IdExamen" ReadOnly="True" />
					<asp:BoundField DataField="Nume cursant" HeaderText="Nume cursant" ReadOnly="True" SortExpression="Nume cursant" />
					<asp:BoundField DataField="Nume instructor" HeaderText="Nume instructor" ReadOnly="True" SortExpression="Nume instructor" />
					<asp:BoundField DataField="Calificativ" HeaderText="Calificativ" SortExpression="Calificativ" />
					<asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
					 <asp:CommandField ShowEditButton="True" ButtonType="Button" />
					<asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
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
			<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" SelectCommand="SELECT COUNT(IdExamen) AS NrExamene, MONTH(Data) AS Luna FROM tblExamene GROUP BY MONTH(Data)"></asp:SqlDataSource>
			<br />
			<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Adaugă calificativ" BackColor="#336699" BorderColor="Black" />
			<br />
			<br />
			<asp:Label ID="Label6" runat="server" Text="Cauta cursanti dupa calificativ"></asp:Label>
&nbsp;
			<asp:DropDownList ID="ddlCalificativ" runat="server" Height="17px" Width="159px">
				<asp:ListItem>Respins</asp:ListItem>
				<asp:ListItem>Admis</asp:ListItem>
			</asp:DropDownList>
			<asp:Button ID="tbnProcedura" runat="server" BackColor="#336699" BorderColor="Black" Height="27px" Text="Cauta" Width="83px" OnClick="tbnProcedura_Click" />
			<br />
			<br />
			<br />
			
			<br />
        	<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" SelectCommand="SELECT t2.IdExamen, { fn CONCAT({ fn CONCAT(t0.Nume, ' ') }, t0.Prenume) } AS [Nume cursant], { fn CONCAT({ fn CONCAT(t1.Nume, ' ') }, t1.Prenume) } AS [Nume instructor], t2.Calificativ, t2.Data FROM tblCursanti AS t0 INNER JOIN tblExamene AS t2 ON t0.IdCursant = t2.IdCursant INNER JOIN tblInstructori AS t1 ON t2.IdInstructor = t1.IdInstructor" DeleteCommand="DELETE FROM tblExamene WHERE (IdExamen = @IdExamen)" UpdateCommand="UPDATE [tblExamene] SET [calificativ] = @Calificativ, [data] = @data WHERE [IdExamen] = @IdExamen" InsertCommand="INSERT INTO tblExamene(IdExamen, IdCursant, IdInstructor, Calificativ, Data) VALUES (@IdExamen, @IdCursant, @IdInstructor, @Calificativ, @Data)">
				<DeleteParameters>
					<asp:Parameter Name="IdExamen" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="Calificativ" />
					<asp:Parameter Name="data" />
					<asp:Parameter Name="IdExamen" />
				</UpdateParameters>
			</asp:SqlDataSource>
        	<asp:MultiView ID="MultiView1" runat="server">
				<asp:View ID="View1" runat="server">
					<div class ="home"> 
						&nbsp;<asp:Label ID="titlu" runat="server" Text="Adaugă notă cursant" ForeColor="#003399"></asp:Label>
					<br />
					<br />
					<asp:Label ID="Label4" runat="server" Text="Instructor:"></asp:Label>
						&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nume instructor" DataValueField="Nume instructor" Height="19px" Width="162px">
					</asp:DropDownList>
						<br />
					<br />
					<asp:Label ID="Label2" runat="server" Text="Cursant:"></asp:Label>
						&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nume cursant" DataValueField="Nume cursant" Height="22px" Width="161px">
					</asp:DropDownList>
						<br />
					<br />
					<asp:Label ID="Label3" runat="server" Text="Calificativ"></asp:Label>
						&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" Height="17px" Width="159px">
							<asp:ListItem>Respins</asp:ListItem>
							<asp:ListItem>Admis</asp:ListItem>
						</asp:DropDownList>
						<br />
						<br />
						<asp:Label ID="Label5" runat="server" Text="Data:"></asp:Label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="tbData" runat="server" Width="157px" ReadOnly="True"></asp:TextBox>
						<br />
					<br />
					<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Width="200px">
						<DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
						<NextPrevStyle VerticalAlign="Bottom" />
						<OtherMonthDayStyle ForeColor="#808080" />
						<SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
						<SelectorStyle BackColor="#CCCCCC" />
						<TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
						<TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
						<WeekendDayStyle BackColor="#FFFFCC" />
						</asp:Calendar>
					<br />
					<br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:Button ID="AdaugaCursant" runat="server" OnClick="Button1_Click" Text="Adauga Nota" BackColor="#336699" BorderColor="Black" />
					<br />
					<br />
					<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" SelectCommand="SELECT { fn CONCAT({ fn CONCAT(Nume, ' ') }, Prenume) } AS [Nume instructor] FROM tblInstructori"></asp:SqlDataSource>
					<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" SelectCommand="SELECT { fn CONCAT({ fn CONCAT(Nume, ' ') }, Prenume) } AS [Nume cursant] FROM tblCursanti AS t0"></asp:SqlDataSource>
						</div>
				</asp:View>
				<asp:View ID="View2" runat="server">
					<asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
						<FooterStyle BackColor="White" ForeColor="#000066" />
						<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
						<RowStyle ForeColor="#000066" />
						<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
						<SortedAscendingCellStyle BackColor="#F1F1F1" />
						<SortedAscendingHeaderStyle BackColor="#007DBB" />
						<SortedDescendingCellStyle BackColor="#CAC9C9" />
						<SortedDescendingHeaderStyle BackColor="#00547E" />
					</asp:GridView>
					<br />
					<asp:Label ID="lNrCursanti" runat="server" Text="Label"></asp:Label>
				</asp:View>
			</asp:MultiView>
			<br />
			<br />
			<br />
			<asp:TextBox ID="tbMes" runat="server" BackColor="#C8DFE6" Height="102px" TextMode="MultiLine" Width="390px"></asp:TextBox>
        </div>
    </form>
</body>
</html>
