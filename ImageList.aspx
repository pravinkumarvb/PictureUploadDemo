<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageList.aspx.cs" Inherits="ImageList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2"><strong>
                            <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text='<%# Eval("ProductName") %>'></asp:Label>
                            </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Image ID="Image1" runat="server" Height="105px" ImageUrl='<%# Eval("Pic") %>' Width="172px" />
                            <asp:HiddenField ID="hdfPictureID" runat="server" Value='<%# Eval("ProductID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Price: Rs.<strong><asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:LinkButton ID="LinkButton1" runat="server">Add To Cart</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    
    </div>
    </form>
</body>
</html>
