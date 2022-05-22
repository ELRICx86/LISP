<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LISP.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/login.png" alt="..." width="150px">
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Login</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <formview>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>User Name</label>
                                        <asp:TextBox ID="textbox1" CssClass="form-control" placeholder="User Name" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <label>Password</label>


                                <asp:TextBox ID="textbox2" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>


                            </div>
                            <br />

                            <div class="form-group">
                                <asp:Button type="button" class="btn btn-outline-success btn-block " ID="Button1" runat="server" Text="LogIn" OnClick="Button1_Click"></asp:Button>
                            </div>
                        </formview>


                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
