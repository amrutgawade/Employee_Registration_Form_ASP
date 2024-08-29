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

        #register-form {
            border: 1px solid skyblue;
            border-radius: 5px;
            padding: 2rem;
            width: 90%;
            margin: 2rem auto;
            background-color: white;
        }

        #grid-view {
            border: 1px solid skyblue;
            border-radius: 5px;
            padding: 2rem;
            width: 90%;
            overflow: auto;
            margin: 2rem auto;
            background-color: white;
        }

        #EmployeeDetails {
            font-weight: normal;
            font-style: normal;
            font-size: 0.7rem;
            border-collapse: collapse;
            width: 100%;
        }

            #EmployeeDetails tbody th, td {
                padding: 0.4rem;
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
            height: 1.8rem;
        }

        .form-control {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-column-gap: 4rem
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

        .form-column {
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
        }

        .btn-group {
            display: flex;
            gap: 2rem;
            margin: 1.6rem 0 1rem 0;
        }

        .btn-group-action {
            display: flex;
            gap: 0.6rem;
        }

        .btn {
            padding: 0.4rem 0.6rem;
            outline: none;
            border-radius: 5px;
        }
        
        .btn-sm {
            padding: 0.2rem 0.4rem;
            outline: none;
            font-size: 0.7rem;
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
            border: 1px solid black;
            color: black;
        }

            .btn-secondary:hover {
                background-color: black;
                border: 1px solid white;
                color: white;
            }

        .btn-denger {
            background-color: white;
            border: 1px solid red;
            color: red;
        }

            .btn-denger:hover {
                background-color: red;
                border: 1px solid white;
                color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="register-form">
            <h1 class="text-center">Employee Registration</h1>
            <div class="form-control">
                <div class="form-column">
                    <div class="form-group">
                        <asp:Label ID="LabelFullname" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="tbName" CssClass="input-text" runat="server"></asp:TextBox>
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
                        <asp:Label ID="LabelPincode" runat="server" Text="Pincode"></asp:Label>
                        <asp:TextBox ID="tbPincode" CssClass="input-text" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="tbEmail" CssClass="input-text" TextMode="Email" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelDOB" runat="server" Text="Date of Birth"></asp:Label>
                        <asp:TextBox ID="tbDOB" CssClass="input-text" TextMode="Date" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelCity" runat="server" Text="City"></asp:Label>
                        <asp:DropDownList ID="ddlCities" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelEmployeeType" runat="server" Text="Employee Type"></asp:Label>
                        <asp:DropDownList ID="ddlEmployeeType" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <asp:Label ID="LabelMobile" runat="server" Text="Mobile"></asp:Label>
                        <asp:TextBox ID="tbMobile" CssClass="input-text" TextMode="Phone" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelCountry" runat="server" Text="Country"></asp:Label>
                        <asp:DropDownList ID="ddlCountries" DataTextField="country_name" AutoPostBack="true" DataValueField="country_id" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged" CssClass="input-text" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelAddress" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="tbAddress" CssClass="input-text" runat="server"></asp:TextBox>
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
        <div id="grid-view">
            <h2>Employee Details</h2>
            <asp:GridView ID="EmployeeDetails" runat="server" AllowCustomPaging="true" EnableModelValidation="true" EmptyDataText="No Records" AutoGenerateColumns="false" DataKeyNames="emp_id" OnRowCommand="btnDelete_Click">
                <Columns>
                    <asp:BoundField DataField="emp_id" HeaderText="Id" />
                    <asp:BoundField DataField="emp_name" HeaderText="Name" />
                    <asp:BoundField DataField="emp_email" HeaderText="Email" />
                    <asp:BoundField DataField="emp_mobile" HeaderText="Mobile" />
                    <asp:BoundField DataField="dob" HeaderText="DOB" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" />
                    <asp:BoundField DataField="address" HeaderText="Address" />
                    <asp:BoundField DataField="country" HeaderText="Country" />
                    <asp:BoundField DataField="state" HeaderText="State" />
                    <asp:BoundField DataField="city" HeaderText="City" />
                    <asp:BoundField DataField="pincode" HeaderText="Pincode" />
                    <asp:BoundField DataField="emp_type" HeaderText="Employee Type" />
                    <asp:BoundField DataField="job_type" HeaderText="Job Type" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <div class="btn-group-action">
                                <asp:Button ID="btnEdit" CssClass="btn-sm btn-primary" runat="server" Text="Edit" />
                                <asp:Button ID="btnDelete" runat="server" CssClass="btn-sm btn-denger" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
