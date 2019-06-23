<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemEdit.aspx.cs" Inherits="USAMarketingWebForms.ItemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 406px">
    
        <asp:DetailsView ID="dvItemDetails" runat="server" AutoGenerateRows="False" DataKeyNames="ItemID" DataSourceID="dsItemDetails" Height="50px" style="z-index: 1; left: 13px; top: 97px; position: absolute; height: 67px; width: 579px" OnItemInserted="dvItemDetails_ItemInserted" OnItemUpdated="dvItemDetails_ItemUpdated">
            <Fields>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="ItemNumber" HeaderText="ItemNumber" SortExpression="ItemNumber" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsItemDetails" runat="server" ConnectionString="<%$ ConnectionStrings:USAMarketingConnectionStringDetails %>" DeleteCommand="DELETE FROM [tblItem] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [tblItem] ([ItemNumber], [Description], [UnitPrice]) VALUES (@ItemNumber, @Description, @UnitPrice)" SelectCommand="SELECT * FROM [tblItem] WHERE ([ItemID] = @ItemID)" UpdateCommand="UPDATE [tblItem] SET [ItemNumber] = @ItemNumber, [Description] = @Description, [UnitPrice] = @UnitPrice WHERE [ItemID] = @ItemID">
            <DeleteParameters>
                <asp:Parameter Name="ItemID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ItemID" QueryStringField="itemID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemNumber" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="ItemID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:HyperLink ID="hlBackToItem" runat="server" NavigateUrl="~/ItemList.aspx" style="z-index: 1; left: 624px; top: 31px; position: absolute">Back to Item List</asp:HyperLink>
        <asp:SqlDataSource ID="dsItemLineItem" runat="server" ConnectionString="<%$ ConnectionStrings:USAMarketingConnectionString2 %>" DeleteCommand="DELETE FROM [tblLineItem] WHERE [LineItemID] = @LineItemID" InsertCommand="INSERT INTO [tblLineItem] ([Quantity], [UnitPrice], [Amount], [InvoiceID], [ItemID]) VALUES (@Quantity, @UnitPrice, @Amount, @InvoiceID, @ItemID)" SelectCommand="SELECT * FROM [tblLineItem] WHERE ([ItemID] = @ItemID)" UpdateCommand="UPDATE [tblLineItem] SET [Quantity] = @Quantity, [UnitPrice] = @UnitPrice, [Amount] = @Amount, [InvoiceID] = @InvoiceID, [ItemID] = @ItemID WHERE [LineItemID] = @LineItemID">
            <DeleteParameters>
                <asp:Parameter Name="LineItemID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter Name="InvoiceID" Type="Int32" />
                <asp:Parameter Name="ItemID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ItemID" QueryStringField="itemID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter Name="InvoiceID" Type="Int32" />
                <asp:Parameter Name="ItemID" Type="Int32" />
                <asp:Parameter Name="LineItemID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LineItemID" DataSourceID="dsItemLineItem" style="z-index: 1; left: 16px; top: 237px; position: absolute; height: 133px; width: 577px">
            <Columns>
                <asp:BoundField DataField="LineItemID" HeaderText="LineItemID" InsertVisible="False" ReadOnly="True" SortExpression="LineItemID" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" SortExpression="InvoiceID" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
