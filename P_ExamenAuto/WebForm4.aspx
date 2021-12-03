<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="P_ExamenAuto.WebForm4" %>

<%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" media="screen" href="~/styles/StyleSheet1.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id ="centru">
        	<cc1:ZedGraphWeb ID="ZedGraphWeb1" runat="server" Height="300">
			</cc1:ZedGraphWeb>
			<br />
			<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbScoalaAutoConnectionString %>" SelectCommand="SELECT COUNT(IdExamen) AS NrExamene, MONTH(Data) AS Luna FROM tblExamene GROUP BY MONTH(Data)"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
