<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SUB QUERY.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            height: 223px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Table 1 products:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PROD_ID" DataSourceID="SqlDataSource1" style="text-align: center" Width="1129px" CssClass="grid1">
                    <Columns>
                        <asp:BoundField DataField="PROD_ID" HeaderText="PROD_ID" InsertVisible="False" ReadOnly="True" SortExpression="PROD_ID" />
                        <asp:BoundField DataField="PROD_NAME" HeaderText="PROD_NAME" SortExpression="PROD_NAME" />
                        <asp:BoundField DataField="PROD_PRICE" HeaderText="PROD_PRICE" SortExpression="PROD_PRICE" />
                        <asp:BoundField DataField="PROD_QUANT" HeaderText="PROD_QUANT" SortExpression="PROD_QUANT" />
                        <asp:BoundField DataField="SUPP_ID" HeaderText="SUPP_ID" SortExpression="SUPP_ID" />
                        <asp:BoundField DataField="PROD_CATEGORY" HeaderText="PROD_CATEGORY" SortExpression="PROD_CATEGORY" />
                        <asp:BoundField DataField="PROD_DESCRIPT" HeaderText="PROD_DESCRIPT" SortExpression="PROD_DESCRIPT" />
                    </Columns>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT *
FROM Products
WHERE PROD_ID IN
(SELECT PROD_ID
FROM ORDER_DETAILS
WHERE Quantity &lt;10 );"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Table 2 ORDER:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ORDE_ID" DataSourceID="SqlDataSource2" ForeColor="Black" style="text-align: center" Width="947px" CssClass="grid1">
                    <Columns>
                        <asp:BoundField DataField="ORDE_ID" HeaderText="ORDE_ID" InsertVisible="False" ReadOnly="True" SortExpression="ORDE_ID" />
                        <asp:BoundField DataField="ORDE_DATE" HeaderText="ORDE_DATE" SortExpression="ORDE_DATE" />
                        <asp:BoundField DataField="CUST_ID" HeaderText="CUST_ID" SortExpression="CUST_ID" />
                        <asp:BoundField DataField="DELIVERY_ID" HeaderText="DELIVERY_ID" SortExpression="DELIVERY_ID" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT * FROM ORDERR
WHERE DELIVERY_ID IN (SELECT EMP_ID FROM EMPLOYEE
WHERE EMP_FNAME LIKE '%M');"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Black" Text="Table 3 EMPLOYEE:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="grid1" DataKeyNames="EMP_ID" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" InsertVisible="False" ReadOnly="True" SortExpression="EMP_ID" />
                        <asp:BoundField DataField="EMP_FNAME" HeaderText="EMP_FNAME" SortExpression="EMP_FNAME" />
                        <asp:BoundField DataField="EMP_LNAME" HeaderText="EMP_LNAME" SortExpression="EMP_LNAME" />
                        <asp:BoundField DataField="EMP_GENDER" HeaderText="EMP_GENDER" SortExpression="EMP_GENDER" />
                        <asp:BoundField DataField="Emp_EMAIL" HeaderText="Emp_EMAIL" SortExpression="Emp_EMAIL" />
                        <asp:BoundField DataField="EMP_BDATE" HeaderText="EMP_BDATE" SortExpression="EMP_BDATE" />
                        <asp:BoundField DataField="EMP_SALARY" HeaderText="EMP_SALARY" SortExpression="EMP_SALARY" />
                        <asp:BoundField DataField="DEPT_CODE" HeaderText="DEPT_CODE" SortExpression="DEPT_CODE" />
                        <asp:BoundField DataField="EMP_STATUS" HeaderText="EMP_STATUS" SortExpression="EMP_STATUS" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT * FROM EMPLOYEE 
WHERE DEPT_CODE IN (SELECT DEPT_CODE FROM DEPARTMENT
WHERE DEPT_NAME = 'IT DEPARTMENT');
"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

