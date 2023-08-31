<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewAccount.aspx.cs" Inherits="Assignment.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 454px;
        }
        .auto-style3 {
            width: 372px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Sign Up</h2>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">First Name:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox1" runat="server" Width="328px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="First Name is required." Display="Dynamic" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox2" runat="server" Width="328px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="Last Name is required." Display="Dynamic" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Age:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox3" runat="server" Width="328px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="Age is required." Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revAge" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="Age should be a valid number." ValidationExpression="^\d+$" Display="Dynamic" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Mobile Number:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox4" runat="server" Width="328px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ControlToValidate="TextBox4"
                    ErrorMessage="Mobile Number is required." Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revMobileNumber" runat="server" ControlToValidate="TextBox4"
                    ErrorMessage="Mobile Number should be 10 digits." ValidationExpression="^\d{10}$" Display="Dynamic" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Email:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox5" runat="server" Width="328px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBox5"
                    ErrorMessage="Email is required." Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TextBox5"
                    ErrorMessage="Email format is invalid." ValidationExpression="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                    Display="Dynamic" />
            </td>
            <td>&nbsp;</td>
        </tr>
   <tr>
    <td class="auto-style2">UserName:</td>
    <td class="auto-style3">
        <asp:TextBox ID="TextBox8" runat="server" Width="328px"></asp:TextBox>
        <asp:CustomValidator ID="cvUsername" runat="server"
            ControlToValidate="TextBox8"
            ErrorMessage="Username already exists."
            OnServerValidate="cvUsername_ServerValidate"
            Display="Dynamic">
        </asp:CustomValidator>
        <br />
        <br />
    </td>
    <td>&nbsp;</td>
</tr>

        <tr>
            <td class="auto-style2">Password:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" Width="328px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBox6"
                    ErrorMessage="Password is required." Display="Dynamic" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Confirm Password:</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox7" runat="server" TextMode="Password" Width="328px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="TextBox7"
                    ErrorMessage="Confirm Password is required." Display="Dynamic" />
                <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToValidate="TextBox7"
                    ControlToCompare="TextBox6" ErrorMessage="Passwords do not match." Display="Dynamic" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" BackColor="#003300" ForeColor="#33CC33" Text="Sign Up" Width="236px" OnClick="Button1_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
