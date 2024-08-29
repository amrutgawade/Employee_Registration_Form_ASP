<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Employee_Registration.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap" rel="stylesheet">
    <style>
        html {
            font-family: "Comfortaa", sans-serif;
            font-optical-sizing: auto;
            font-weight: normal;
            font-style: normal;
        }

        body {
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
            margin: 1rem 0 3rem 0;
        }

        .text-center {
            text-align: center;
        }

        .gender tbody {
            display: flex;
            flex-direction: row;
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
            padding: 0 4rem;
            margin: 1.6rem 0 1rem 0;
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
                        <asp:Label ID="LabelFullname" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="tbName" CssClass="input-text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelDOB" runat="server" Text="Date of Birth"></asp:Label>
                        <asp:TextBox ID="tbDOB" CssClass="input-text" TextMode="Date" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelGender" runat="server" Text="Gender"></asp:Label>
                        <asp:RadioButtonList CssClass="gender" ID="rblGender" runat="server">
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelState" runat="server" Text="State"></asp:Label>
                        <asp:DropDownList ID="ddlStates" DataTextField="state_name" AutoPostBack="true" DataValueField="state_id" OnSelectedIndexChanged="ddlStates_SelectedIndexChanged" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelAddress" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="tbAddress" CssClass="input-text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelEmployeeType" runat="server" Text="Employee Type"></asp:Label>
                        <asp:DropDownList ID="ddlEmployeeType" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-control-right">
                    <div class="form-group">
                        <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="tbEmail" CssClass="input-text" TextMode="Email" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelMobile" runat="server" Text="Mobile"></asp:Label>
                        <asp:TextBox ID="tbMobile" CssClass="input-text" TextMode="Phone" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelCountry" runat="server" Text="Country"></asp:Label>
                        <asp:DropDownList ID="ddlCountries" DataTextField="country_name" AutoPostBack="true" DataValueField="country_id" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged" CssClass="input-text" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelCity" runat="server" Text="City"></asp:Label>
                        <asp:DropDownList ID="ddlCities" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelPincode" runat="server" Text="Pincode"></asp:Label>
                        <asp:TextBox ID="tbPincode" CssClass="input-text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelJobType" runat="server" Text="Job Type"></asp:Label>
                        <asp:DropDownList ID="ddlJobType" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="btn-group">
                <asp:Button CssClass="btn btn-primary" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Submit" />
                <asp:Button CssClass="btn btn-secondary" ID="btnCancel" OnClick="btnCancel_Click" runat="server" Text="Cancel" />
            </div>
        </div>
    </form>
</body>
</html>
