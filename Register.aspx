<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Employee_Registration.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap" rel="stylesheet" />
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

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

            #grid-view h2 {
                margin: 0 0 0.6rem 0;
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

        #register-form > h1 {
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

        .btn-lg {
            display: inline-block;
            width: fit-content;
            margin: 1rem auto 0 auto;
            padding: 0.8rem 1rem;
            outline: none;
            font-size: 1.2rem;
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

        .modal {
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        .sweet-alert {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fefefe;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            text-align: center;
            border-radius: 8px;
        }

        .success-animation {
            margin: 1rem auto;
        }

        .checkmark {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            display: block;
            stroke-width: 2;
            stroke: #4bb71b;
            stroke-miterlimit: 10;
            box-shadow: inset 0px 0px 0px #4bb71b;
            animation: fill .4s ease-in-out .4s forwards, scale .3s ease-in-out .9s both;
            position: relative;
            top: 5px;
            right: 5px;
            margin: 0 auto;
        }

        .checkmark__circle {
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            stroke-width: 2;
            stroke-miterlimit: 10;
            stroke: #4bb71b;
            fill: #fff;
            animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }

        .checkmark__check {
            transform-origin: 50% 50%;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards;
        }

        @keyframes stroke {
            100% {
                stroke-dashoffset: 0;
            }
        }

        @keyframes scale {
            0%, 100% {
                transform: none;
            }

            50% {
                transform: scale3d(1.1, 1.1, 1);
            }
        }

        @keyframes fill {
            100% {
                box-shadow: inset 0px 0px 0px 30px #4bb71b;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="PanelModal" CssClass="modal" runat="server" Visible="false">
            <asp:Panel ID="PanelToast" CssClass="sweet-alert" runat="server">
                <asp:Panel ID="PanelCheckmark" runat="server" CssClass="success-animation">
                    <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                        <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                        <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                    </svg>
                </asp:Panel>

                <asp:Label ID="LabelSweetAlertHeading" runat="server" Text="Success" ForeColor="Black" Font-Bold="true" Font-Size="X-Large">
                </asp:Label>
                <asp:Label ID="LabelSweetAlert" runat="server" Text="" ForeColor="Green" Font-Bold="true">
                </asp:Label>
                <asp:Button ID="btnSweetAlertClose" CssClass="btn-lg" runat="server" Text="OK" BackColor="Green" ForeColor="White" BorderStyle="None" OnClick="btnSweetAlertClose_Click" />
            </asp:Panel>
        </asp:Panel>
        <div id="register-form">
            <h1 class="text-center">Employee Registration</h1>
            <div class="form-control">
                <div class="form-column">
                    <asp:HiddenField ID="hfEmpId" runat="server" />
                    <div class="form-group">
                        <asp:Label ID="LabelFullname" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="tbName" CssClass="input-text" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                            ControlToValidate="tbName"
                            ErrorMessage="Name is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="tbName"
                            ID="revName"
                            ErrorMessage="Name cannot contain number or extra-spaces"
                            ValidationGroup="required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationExpression="^[^ ][a-zA-Z\s]{1,50}[^ ]$"
                            ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelGender" runat="server" Text="Gender"></asp:Label>
                        <asp:RadioButtonList CssClass="gender" ID="rblGender" runat="server">
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server"
                            ControlToValidate="rblGender"
                            ErrorMessage="Gender is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelState" runat="server" Text="State"></asp:Label>
                        <asp:DropDownList ID="ddlStates" DataTextField="state_name" AutoPostBack="true" DataValueField="state_id" OnSelectedIndexChanged="ddlStates_SelectedIndexChanged" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvState" runat="server"
                            ControlToValidate="ddlStates"
                            ErrorMessage="State is required"
                            ValidationGroup="required"
                            Display="Dynamic"
                            Font-Size="Small"
                            InitialValue="0"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelPincode" runat="server" Text="Pincode"></asp:Label>
                        <asp:TextBox ID="tbPincode" CssClass="input-text" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPincode" runat="server"
                            ControlToValidate="tbPincode"
                            ErrorMessage="Pincode is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="tbPincode"
                            ID="revPincode"
                            ErrorMessage="Pincode must be 6 digit i.e. 400004"
                            ValidationGroup="required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationExpression="^\d{6}$"
                            ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="tbEmail" CssClass="input-text" TextMode="Email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="tbEmail"
                            ErrorMessage="Email is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            Display="Dynamic"
                            Font-Size="Small"
                            ControlToValidate="tbEmail"
                            ValidationGroup="required"
                            ErrorMessage="Email must be in format i.e. example@gmail.com"
                            ValidationExpression="^[^ ][a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}[^ ]$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelDOB" runat="server" Text="Date of Birth"></asp:Label>
                        <asp:TextBox ID="tbDOB" CssClass="input-text" TextMode="Date" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDOB" runat="server"
                            ControlToValidate="tbDOB"
                            Display="Dynamic"
                            Font-Size="Small"
                            ErrorMessage="DOB is required"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvDOB" runat="server"
                            ControlToValidate="tbDOB"
                            ErrorMessage="You must be at least 18 years old."
                            ValidationGroup="required"
                            Display="Dynamic"
                            Font-Size="Small"
                            OnServerValidate="cvDOB_ServerValidate"
                            ForeColor="Red" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="LabelCity" runat="server" Text="City"></asp:Label>
                        <asp:DropDownList ID="ddlCities" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                            ControlToValidate="ddlCities"
                            InitialValue="0"
                            Display="Dynamic"
                            Font-Size="Small"
                            ErrorMessage="City is required"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelEmployeeType" runat="server" Text="Employee Type"></asp:Label>
                        <asp:DropDownList ID="ddlEmployeeType" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEmployeeType" runat="server"
                            ControlToValidate="ddlEmployeeType"
                            ErrorMessage="Employee Type is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <asp:Label ID="LabelMobile" runat="server" Text="Mobile"></asp:Label>
                        <asp:TextBox ID="tbMobile" CssClass="input-text" TextMode="Phone" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                            ControlToValidate="tbMobile"
                            ErrorMessage="Mobile is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="revMobile"
                            runat="server"
                            ControlToValidate="tbMobile"
                            ValidationGroup="required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ErrorMessage="Please enter a valid 10-digit mobile number."
                            ValidationExpression="^\d{10}$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelCountry" runat="server" Text="Country"></asp:Label>
                        <asp:DropDownList ID="ddlCountries" DataTextField="country_name" AutoPostBack="true" DataValueField="country_id" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged" CssClass="input-text" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCountry" runat="server"
                            ControlToValidate="ddlCountries"
                            ErrorMessage="Country is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            InitialValue="0"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelAddress" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="tbAddress" CssClass="input-text" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                            ControlToValidate="tbAddress"
                            ErrorMessage="Address is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="revAddress"
                            runat="server"
                            ControlToValidate="tbAddress"
                            ValidationGroup="required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ErrorMessage="Address cannot have extra-spaces."
                            ValidationExpression="^[^ ][\W\S]{1,50}[^ ]$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LabelJobType" runat="server" Text="Job Type"></asp:Label>
                        <asp:DropDownList ID="ddlJobType" CssClass="input-text" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvJobType" runat="server"
                            ControlToValidate="ddlJobType"
                            ErrorMessage="Job Type is required"
                            Display="Dynamic"
                            Font-Size="Small"
                            ValidationGroup="required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="btn-group">
                <asp:Button CssClass="btn btn-primary" ID="btnUpdate" ValidationGroup="required" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
                <asp:Button CssClass="btn btn-primary" ID="btnSubmit" ValidationGroup="required" OnClick="btnSubmit_Click" runat="server" Text="Submit" />
                <asp:Button CssClass="btn btn-secondary" ID="btnCancel" OnClick="btnCancel_Click" runat="server" Text="Cancel" />
            </div>
        </div>
        <div id="grid-view">
            <h2>Employee Details</h2>
            <asp:GridView ID="EmployeeDetails" runat="server" AllowCustomPaging="true" EnableModelValidation="true" EmptyDataText="No Records" AutoGenerateColumns="false" DataKeyNames="emp_id" OnRowCommand="EmployeeDetails_RowCommand">
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
                                <asp:Button ID="btnEdit" CssClass="btn-sm btn-primary" runat="server" CommandName="EditEmployee" CommandArgument='<%# Eval("emp_id") %>' Text="Edit" />
                                <asp:Button ID="btnDelete" runat="server" CssClass="btn-sm btn-denger" CommandName="DeleteEmployee" CommandArgument='<%# Eval("emp_id") %>' Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
