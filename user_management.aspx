<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user_management.aspx.cs" Inherits="LISP.user_management" %>

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

                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h4>User Details</h4>
                                        </center>
                                    </div>
                                </div>

                                <div class="row">



                                    <div class="col-md-12">
                                        <div class="form-group">

                                            <label>Search User</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="textbox2" CssClass="form-control" placeholder="User Name" runat="server"></asp:TextBox>
                                                <asp:Button class="btn btn-success" ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" />

                                            </div>
                                        </div>
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
                                            <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" Enabled="False">
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
                                        <asp:Button type="button" class="btn btn-danger btn-block " ID="Button1" runat="server" Text="Delete User" OnClick="Button1_Click" Visible="False"></asp:Button>
                                    </div>
                            </div>

                        </div>
                    </div>
                

                
            </div></div>
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Subscriptions</h4>
                                </center>
                                </div>
                            </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-hover table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False">

                                    <Columns>
                                            <asp:BoundField DataField="pid" HeaderText="Package ID" ReadOnly="True" SortExpression="pid" />
                                
                                            <asp:BoundField DataField="pkg_amount" HeaderText="Amount" ReadOnly="True" SortExpression="pkg_amount" />
                                            <asp:BoundField DataField="ip_type" HeaderText="IP Type" SortExpression="ip_type" />
                                            <asp:BoundField DataField="price" HeaderText="Price (Taka)" ReadOnly="True" SortExpression="id" />
                                             <asp:BoundField DataField="flg" HeaderText="Status" SortExpression="flg" />
                                        </Columns>

                                </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
        </div>
    </div>
</asp:Content>
