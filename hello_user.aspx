<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hello_user.aspx.cs" Inherits="LISP.hello_user" %>

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
                                    <img src="imgs/login.png" alt="..." width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Profile</h4>
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
                                    <asp:TextBox ID="textbox3" CssClass="form-control" placeholder="Full Name" runat="server" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Date Of Birth</label>
                                    <asp:TextBox ID="textbox4" CssClass="form-control" placeholder="Full Name" runat="server" TextMode="Date" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Contact Number</label>
                                    <asp:TextBox ID="textbox5" CssClass="form-control" placeholder="Contact Number" runat="server" TextMode="Phone" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email ID</label>
                                    <asp:TextBox ID="textbox6" CssClass="form-control" placeholder="Email ID" runat="server" TextMode="Email" ReadOnly="True"></asp:TextBox>

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
                                    <asp:TextBox ID="textbox7" class="form-control" placeholder="City" runat="server" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Zip code</label>
                                    <asp:TextBox ID="textbox8" class="form-control" placeholder="Zip code" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>

                        </div>



                        <div class="row">

                            <div class="col">
                                <div class="form-group">
                                    <label>Full Address</label>
                                    <asp:TextBox ID="textbox9" class="form-control" placeholder="City" runat="server" Rows="2" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <formview>



                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>User Name</label>
                                        <asp:TextBox ID="textbox1" CssClass="form-control" placeholder="User Name" runat="server" ReadOnly="True"></asp:TextBox>

                                    </div>
                                </div>



                            </div>
                            <div class="form-group">
                                <asp:Button type="button" class="btn btn-outline-info btn-block " ID="Button1" runat="server" Text="Update Profile" OnClick="Button1_Click"></asp:Button>
                            </div>


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">

                                        <asp:Button type="button" class="btn btn-outline-info btn-block " ID="Button4" runat="server" Text="Save" Visible="false" OnClick="Button4_Click" />
                                    </div>

                                    <div class="col-md-6">

                                        <asp:Button type="button" class="btn btn-outline-info btn-block " ID="Button5" runat="server" Text="Cancel" Visible="false" OnClick="Button5_Click" />
                                    </div>

                                </div>
                            </div>
                        </formview>


                    </div>
                </div>
            </div>

            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12 mx-auto">
                                            <div class="card">

                                                <div class="card-body">
                                                    <div id="old_pass" runat="server" visible="true">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h4><span class="badge badge-warning">Change Password</span></h4>
                                                                </center>

                                                            </div>
                                                        </div>



                                                        <div class="row">
                                                            <div class="col">

                                                                <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Old Password" TextMode="Password"></asp:TextBox>
                                                            </div>
                                                        </div>










                                                        <div class="row">
                                                            <div class="col">
                                                                <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" BorderColor="Red"></asp:Label>

                                                        <div class="row">
                                                            <div class="col">

                                                                <asp:Button CssClass="btn btn-outline-info btn-block" ID="Button2" runat="server" Text="Change" OnClick="Button2_Click" />
                                                            </div>
                                                        </div>








                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
