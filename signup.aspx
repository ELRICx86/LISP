<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="LISP.signup" %>

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
                                        <img src="imgs/login.png" alt="..." width="100px"/>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>SignUp</h4>
                                    </center>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <asp:TextBox ID="textbox3" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Date Of Birth</label>
                                        <asp:TextBox ID="textbox4" CssClass="form-control" placeholder="Full Name" runat="server" TextMode="Date"></asp:TextBox>

                                    </div>
                                </div>

                            </div>



                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Contact Number</label>
                                        <asp:TextBox ID="textbox5" CssClass="form-control" placeholder="Contact Number" runat="server" TextMode="Phone"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email ID</label>
                                        <asp:TextBox ID="textbox6" CssClass="form-control" placeholder="Email ID" runat="server" TextMode="Email"></asp:TextBox>

                                    </div>
                                </div>



                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Division</label>
                                        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                                            <asp:ListItem Text="Dhaka" Value="Dhaka"></asp:ListItem>
                                            <asp:ListItem Text="Chittagong" Value="Chittagong"></asp:ListItem>
                                            <asp:ListItem Text="Khulna" Value="Khulna"></asp:ListItem>
                                            <asp:ListItem Text="Barishal" Value="Barishal"></asp:ListItem>
                                            <asp:ListItem Text="Rajshahi" Value="Rajshahi"></asp:ListItem>
                                            <asp:ListItem Text="Rangpur" Value="Rangpur"></asp:ListItem>
                                            <asp:ListItem Text="Shylet" Value="Shylet"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>District</label>
                                        <asp:TextBox ID="textbox9" class="form-control" placeholder="City" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Zip code</label>
                                        <asp:TextBox ID="textbox8" class="form-control" placeholder="Zip code" runat="server" TextMode="Number"></asp:TextBox>

                                    </div>
                                </div>

                            </div>



                            <div class="row">

                                <div class="col">
                                    <div class="form-group">
                                        <label>Full Address</label>
                                        <asp:TextBox ID="textbox7" class="form-control" placeholder="City" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                            <formview>

                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h4><span class="badge badge-warning">Login Credentials</span></h4>
                                        </center>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>User Name</label>
                                            <asp:TextBox ID="textbox1" CssClass="form-control" placeholder="User Name" runat="server"></asp:TextBox>

                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Password</label>


                                            <asp:TextBox ID="textbox2" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password" ValidateRequestMode="Inherit"></asp:TextBox>


                                        </div>
                                        <br />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Button type="button" class="btn btn-outline-info btn-block " ID="Button1" runat="server" Text="SignUp" OnClick="Button1_Click"></asp:Button>
                                </div>
                            </formview>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    

</asp:Content>
