<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hello_admin.aspx.cs" Inherits="LISP.hello_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/hello_admin.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div id="old_pass" runat="server" visible="true">
                            <div class="row">
                                <div class="col">

                                    <h4>
                                        <asp:Label ID="Label1" runat="server" Text="Old Credentials"></asp:Label></h4>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">

                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="admin id"></asp:TextBox>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col">

                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                             <asp:Label ID="Label3" runat="server"></asp:Label>


                            <div class="row">
                                <div class="col">

                                    <asp:Button CssClass="ad_button" ID="Button1" runat="server" Text="Check" OnClick="Button1_Click" />
                                </div>
                            </div>

                           

                           



                        </div>
                         <div id="new_pass" runat="server" visible="false">
                                <div class="row">
                                    <div class="col">
                                        <h4>
                                            <asp:Label ID="Label2" runat="server" Text="New Credentitials"></asp:Label></h4>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="new admin id"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="new password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:Button CssClass="ad_button" ID="Button2" runat="server" Text="Change" OnClick="Button2_Click" />
                                    </div>
                                </div>


                            </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</asp:Content>
