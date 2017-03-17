<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationXY._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  
        <div class="col-md-4">
         
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HowardtestConnectionString %>" DeleteCommand="DELETE FROM [Whiteboad] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Whiteboad] ([EmployeeID], [Name], [Company], [Department], [Workplace], [Term], [Note]) VALUES (@EmployeeID, @Name, @Company, @Department, @Workplace, @Term, @Note)" SelectCommand="SELECT [EmployeeID], [Name], [Company], [Department], [Workplace], [Term], [Note] FROM [Whiteboad]" UpdateCommand="UPDATE [Whiteboad] SET [Name] = @Name, [Company] = @Company, [Department] = @Department, [Workplace] = @Workplace, [Term] = @Term, [Note] = @Note WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Company" Type="String" />
                    <asp:Parameter Name="Department" Type="String" />
                    <asp:Parameter Name="Workplace" Type="String" />
                    <asp:Parameter Name="Term" Type="DateTime" />
                    <asp:Parameter Name="Note" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Company" Type="String" />
                    <asp:Parameter Name="Department" Type="String" />
                    <asp:Parameter Name="Workplace" Type="String" />
                    <asp:Parameter Name="Term" Type="DateTime" />
                    <asp:Parameter Name="Note" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="500px" OnRowCommand="GridView1_RowCommand" AllowSorting="True"  >
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                    <asp:BoundField DataField="Workplace" HeaderText="Workplace" SortExpression="Workplace" />
                    <asp:BoundField DataField="Term" HeaderText="Term" SortExpression="Term" />
                    
                    <asp:TemplateField HeaderText="File">
       <%--Add link download  Button from here--%>  
                        <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandArgument='<%# Eval("Note") %>'
                    CommandName="Download" Text='<%# Eval("Note") %>' OnDataBinding="LinkButton1_DataBinding"></asp:LinkButton>
       <%--Add link download Button END--%>
            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" />                 
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <br />
            <br />
            <table class="nav-justified">
                <tr>
                    <td style="height: 22px">ID</td>
                    <td style="height: 22px">
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox> </td>
                    <td style="height: 22px"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox> </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Company</td>
                    <td>
            <asp:TextBox ID="txtComp" runat="server" OnTextChanged="txtComp_TextChanged"></asp:TextBox> </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 24px">Department</td>
                    <td style="height: 24px">
            <asp:TextBox ID="txtDepart" runat="server"></asp:TextBox></td>
                    <td style="height: 24px"></td>
                </tr>
                <tr>
                    <td>Workplace</td>
                    <td>
            <asp:TextBox ID="txtWork" runat="server" OnTextChanged="txtWork_TextChanged"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 24px">Term</td>
                    <td style="height: 24px">
            <asp:TextBox ID="txtTerm" runat="server"></asp:TextBox></td>
                    <td style="height: 24px"></td>
                </tr>
                <tr>
                    <td style="height: 22px">File Upload</td>
                    <td style="height: 22px">
             <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" Height="29px" Width="199px" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="PDF Only" ControlToValidate="FileUpload1" ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F))|((d|D)(o|O)(c|C)))$"></asp:RegularExpressionValidator>
                    </td>
                    <td style="height: 22px"></td>
                </tr>
                <tr>
                    <td>
            <asp:Button ID="btnCV" runat="server" Text="Save" OnClick="btnCV_Click" ClientIDMode="AutoID" />
                    </td>
                    <td>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
           <br />
            <br />   
        </div>
</asp:Content>
