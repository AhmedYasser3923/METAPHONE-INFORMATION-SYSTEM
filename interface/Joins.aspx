<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Joins.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            height: 253px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Black" Text="Table 1 EMPLOYEE:"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="DEPN_NAME,EMP_ID" DataSourceID="SqlDataSource1" style="text-align: center" Width="1226px" CssClass="grid1">
                    <Columns>
                        <asp:BoundField DataField="Employee NAME" HeaderText="Employee NAME" ReadOnly="True" SortExpression="Employee NAME" />
                        <asp:BoundField DataField="DEPN_NAME" HeaderText="DEPN_NAME" ReadOnly="True" SortExpression="DEPN_NAME" />
                        <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" ReadOnly="True" SortExpression="EMP_ID" />
                        <asp:BoundField DataField="B_DATE" HeaderText="B_DATE" SortExpression="B_DATE" />
                        <asp:BoundField DataField="RELATIONSHIP" HeaderText="RELATIONSHIP" SortExpression="RELATIONSHIP" />
                        <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
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
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Black" Text="Table 2 Customer:" style="text-align: center"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT EMPLOYEE.EMP_FNAME + ' '+ EMPLOYEE.EMP_LNAME AS 'Employee NAME' , DEPENDENT_EMP.*
FROM DEPENDENT_EMP
INNER JOIN EMPLOYEE ON EMPLOYEE.EMP_ID = DEPENDENT_EMP.EMP_ID;"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" style="text-align: center" Height="160px" Width="1231px" CssClass="grid1">
                    <Columns>
                        <asp:BoundField DataField="CUST_NAME" HeaderText="CUST_NAME" SortExpression="CUST_NAME" />
                        <asp:BoundField DataField="CUST_ADDRESS" HeaderText="CUST_ADDRESS" SortExpression="CUST_ADDRESS" />
                        <asp:BoundField DataField="ORDE_DATE" HeaderText="ORDE_DATE" SortExpression="ORDE_DATE" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="SELECT CUST_NAME,CUST_ADDRESS , ORDERR.ORDE_DATE
FROM CUSTOMER
 left OUTER JOIN ORDERR ON CUSTOMER.CUST_ID = ORDERR.CUST_ID;"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="text-align: center">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Table 3 Customer :"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" style="text-align: center; margin-bottom: 0px;" Height="181px" Width="1248px" CssClass="grid1" >
                    <Columns>
                        <asp:BoundField DataField="CUST_NAME" HeaderText="CUST_NAME" SortExpression="CUST_NAME" />
                        <asp:BoundField DataField="PHONE_NUM" HeaderText="PHONE_NUM" SortExpression="PHONE_NUM" />
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:COMPANY_PROJConnectionString %>" SelectCommand="select CUST_NAME, CUST_PHONE AS PHONE_NUM from CUSTOMER
right join CUST_PHONE on customer.CUST_ID = CUST_PHONE.CUST_CODE
WHERE CUST_PHONE LIKE '%4';
"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

