<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Simple Select.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style4 {
        height: 246px;
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="Black" Text="Table 1 of Employee:"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EMP_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="text-align: center" CssClass="grid1">
                <AlternatingRowStyle BackColor="White" />
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
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Table 2 of Products :"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT * FROM EMPLOYEE
WHERE EMP_SALARY BETWEEN 10000 AND 40000
ORDER BY EMP_FNAME ASC;"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PROD_ID" DataSourceID="SqlDataSource2" Height="185px" Width="1171px" style="text-align: center" CssClass="grid1">
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT * FROM PRODUCTS
WHERE PROD_QUANT &gt;= 200
ORDER BY PROD_PRICE ASC;"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" style="text-align: center">
            <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="Table 3 Suppliers:" style="text-align: center"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="SUPP_ID" DataSourceID="SqlDataSource3" ForeColor="Black" style="text-align: center" Width="1168px" CssClass="grid1">
                <Columns>
                    <asp:BoundField DataField="SUPP_ID" HeaderText="SUPP_ID" InsertVisible="False" ReadOnly="True" SortExpression="SUPP_ID" />
                    <asp:BoundField DataField="SUPP_NAME" HeaderText="SUPP_NAME" SortExpression="SUPP_NAME" />
                    <asp:BoundField DataField="MGR_CODE" HeaderText="MGR_CODE" SortExpression="MGR_CODE" />
                    <asp:BoundField DataField="SUPP_EMAIL" HeaderText="SUPP_EMAIL" SortExpression="SUPP_EMAIL" />
                    <asp:BoundField DataField="SUPP_COUNTRY" HeaderText="SUPP_COUNTRY" SortExpression="SUPP_COUNTRY" />
                    <asp:BoundField DataField="SUPP_CITY" HeaderText="SUPP_CITY" SortExpression="SUPP_CITY" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT * FROM SUPPLIERS
WHERE SUPP_COUNTRY = 'America'
ORDER BY SUPP_CITY DESC;"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style2"></td>
    </tr>
</table>
</asp:Content>

