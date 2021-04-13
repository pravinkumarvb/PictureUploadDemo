<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
        }
    </style>
    <script src="Scripts/jquery-3.5.0.min.js"></script>
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#Image1').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#filePhoto").change(function () {
            readURL(this);
        });
   </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Product Master</h2>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Enter Product Name:</td>
                <td>
                    <asp:TextBox ID="txtProductName" runat="server" Width="301px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Enter Product Price:</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Select Picture:</td>
                <td>
                    <asp:FileUpload ID="filePhoto" runat="server" onchange="readURL(this)" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="96px" ImageUrl="~/images/NoImage.png" Width="166px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
