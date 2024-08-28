<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Employee_Registration.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        body{
            background-color: aliceblue;
        }
        #form1 {
            border: 1px solid skyblue;
            border-radius: 5px;
            padding: 2rem;
            width: 50%;
            margin: 2rem auto;
            background-color: white;
        }

        h1 {
            margin: 2rem 0;
        }

        .text-center {
            text-align: center;
        }

        .inline-flex{
            display:inline-flex;
        }

        .form-control {
            display: flex;
            justify-content: space-around;
            width: 100%;
            margin-left: auto;
            margin-right: auto;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .input-text {
            padding: 0.4rem 0.6rem;
            border: 1px solid grey;
            border-radius: 5px;
            outline: none;
            min-width: 15rem;
        }

            .input-text:hover, :focus {
                border: 1px solid blue;
            }

        .form-control-left {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .form-control-right {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .btn-group {
            display: flex;
            gap: 20px;
            margin-top: 1.2rem;
            margin-left: 4rem;
        }

        .btn {
            padding: 0.4rem 0.6rem;
            outline: none;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: blue;
            border: 1px solid blue;
            color: white;
        }

            .btn-primary:hover {
                background-color: mediumblue;
                border: 1px solid blue;
                color: white;
            }

        .btn-secondary {
            background-color: white;
            border: 1px solid blue;
            color: black;
        }

            .btn-secondary:hover {
                background-color: whitesmoke;
                border: 1px solid blue;
                color: black;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="text-center">Employee Registration</h1>
            <div class="form-control">
                <div class="form-control-left">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="TextBox1" CssClass="input-text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Date of Birth"></asp:Label>
                        <asp:TextBox ID="TextBox2" CssClass="input-text" TextMode="Date" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label9" runat="server" Text="Country"></asp:Label>
                        <asp:DropDownList ID="ddlCountries" DataTextField="country_name" AutoPostBack="true" DataValueField="country_id" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged" CssClass="input-text" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label11" runat="server" Text="City"></asp:Label>
                        <asp:DropDownList ID="ddlCities" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label7" runat="server" Text="Pincode"></asp:Label>
                        <asp:TextBox ID="tb_Pincode" CssClass="input-text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>
                        <div>
                            <asp:RadioButtonList ID="rblGender" runat="server">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>

                <div class="form-control-right">
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="TextBox3" CssClass="input-text" TextMode="Email" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Mobile"></asp:Label>
                        <asp:TextBox ID="TextBox4" CssClass="input-text" TextMode="Phone" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label10" runat="server" Text="State"></asp:Label>
                        <asp:DropDownList ID="ddlStates" DataTextField="state_name" AutoPostBack="true" DataValueField="state_id" OnSelectedIndexChanged="ddlStates_SelectedIndexChanged" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="tb_Address" CssClass="input-text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label12" runat="server" Text="Job Type"></asp:Label>
                        <asp:DropDownList ID="ddlJobType" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label13" runat="server" Text="Employee Type"></asp:Label>
                        <asp:DropDownList ID="ddlEmployeeType" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="btn-group">
                <asp:Button CssClass="btn btn-primary" ID="Submit" runat="server" Text="Submit" />
                <asp:Button CssClass="btn btn-secondary" ID="Cancel" runat="server" Text="Cancel" />
            </div>
        </div>
    </form>
</body>
</html>
