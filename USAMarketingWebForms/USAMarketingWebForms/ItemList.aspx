<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemList.aspx.cs" Inherits="USAMarketingWebForms.ItemList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 390px; width: 818px">
    
        <asp:HyperLink ID="hlAdd" runat="server" style="z-index: 1; left: 17px; top: 64px; position: absolute" NavigateUrl="~/ItemEdit.aspx?mode=add">Create New</asp:HyperLink>
        <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:USAMarketingConnectionString %>" DeleteCommand="DELETE FROM [tblItem] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [tblItem] ([ItemNumber], [Description], [UnitPrice]) VALUES (@ItemNumber, @Description, @UnitPrice)" SelectCommand="SELECT * FROM [tblItem]" UpdateCommand="UPDATE [tblItem] SET [ItemNumber] = @ItemNumber, [Description] = @Description, [UnitPrice] = @UnitPrice WHERE [ItemID] = @ItemID">
            <DeleteParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="ItemID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="dsItem" style="z-index: 1; left: 15px; top: 101px; position: absolute; height: 133px; width: 187px">
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="ItemNumber" HeaderText="ItemNumber" SortExpression="ItemNumber" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="ItemID" DataNavigateUrlFormatString="~/ItemEdit.aspx?mode=edit&amp;itemID={0}" />
                <asp:HyperLinkField Text="Details" DataNavigateUrlFields="ItemID" DataNavigateUrlFormatString="~/ItemEdit.aspx?mode=read&amp;itemID={0}" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Do you want to delete this item?')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
