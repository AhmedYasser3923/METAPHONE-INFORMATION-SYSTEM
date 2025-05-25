<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="aggregate functions.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style4 {
        height: 52px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Table 1 EMPLOYEE :"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" style="text-align: center" Width="1115px" CssClass="grid1">
                    <Columns>
                        <asp:BoundField DataField="EMP_SALARY" HeaderText="EMP_SALARY" SortExpression="EMP_SALARY" />
                        <asp:BoundField DataField="Min Salary" HeaderText="Min Salary" ReadOnly="True" SortExpression="Min Salary" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT EMP_SALARY, MIN(EMP_SALARY) AS 'Min Salary' , EMP_FNAME + ' ' +EMP_LNAME
AS 'NAME'
FROM EMPLOYEE
GROUP BY EMP_SALARY , EMP_FNAME , EMP_LNAME
HAVING MIN(EMP_SALARY) = (SELECT MIN(EMP_SALARY) FROM EMPLOYEE)
ORDER BY 'Min Salary' ASC;"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="select  PROD_CATEGORY,max(prod_price) AS PRICE , PROD_NAME from PRODUCTS
 group by PROD_CATEGORY , PROD_NAME
 having PROD_NAME LIKE'I%'
 order by PROD_CATEGORY DESC ;"></asp:SqlDataSource>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Table 2 PRODUCTS:" style="text-align: center"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" style="text-align: center" Width="1121px" CssClass="grid1">
                    <Columns>
                        <asp:BoundField DataField="PROD_CATEGORY" HeaderText="PROD_CATEGORY" SortExpression="PROD_CATEGORY" />
                        <asp:BoundField DataField="PRICE" HeaderText="PRICE" ReadOnly="True" SortExpression="PRICE" />
                        <asp:BoundField DataField="PROD_NAME" HeaderText="PROD_NAME" SortExpression="PROD_NAME" />
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
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="text-align: center">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT DATEDIFF(YY, B_DATE , GETDATE()) AS AGE , DEPN_NAME , RELATIONSHIP , GENDER   
FROM DEPENDENT_EMP
GROUP BY  B_DATE ,DEPN_NAME , RELATIONSHIP , GENDER
HAVING  GENDER ='m'
ORDER BY AGE ASC;
"></asp:SqlDataSource>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Table 3 DEPENDENT_EMP:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource3" GridLines="Vertical" style="text-align: center" Width="1126px" CssClass="grid1">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="AGE" HeaderText="AGE" ReadOnly="True" SortExpression="AGE" />
                        <asp:BoundField DataField="DEPN_NAME" HeaderText="DEPN_NAME" SortExpression="DEPN_NAME" />
                        <asp:BoundField DataField="RELATIONSHIP" HeaderText="RELATIONSHIP" SortExpression="RELATIONSHIP" />
                        <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                </td>
        </tr>
    </table>
</asp:Content>

