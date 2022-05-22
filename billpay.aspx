<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="billpay.aspx.cs" Inherits="LISP.billpay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/packages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                       
                        <asp:GridView Style="margin-top: 0px;" class="table table-hover table-bordered" OnRowDataBound="rw1" ID="GridView1" runat="server" AutoGenerateColumns="False"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                 <asp:BoundField DataField="pid" HeaderText="ID" ReadOnly="True" SortExpression="pid" />
                                
                                 <asp:BoundField DataField="pkg_amount" HeaderText="Amount" ReadOnly="True" SortExpression="pkg_amount" />
                                <asp:TemplateField>
                                    <ItemTemplate>

                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col">
                                                            <span>IP Type :</span>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ip_type") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <span >BDIX Speed :</span>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("bdix") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <span >Cached Servers : </span>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("server") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <span >Cached Games : </span>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("games") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <span >TorrentBD speed : </span>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("tbd") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderTemplate><center>Description</center></HeaderTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="price" HeaderText="Price (Taka)" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="flg" HeaderText="Status" SortExpression="flg" />
                                <asp:TemplateField ShowHeader="False">
                                    
                                    <ItemTemplate>
                                        <asp:LinkButton class="btn btn-success btn-block" ID="LinkButton1" runat="server" CausesValidation="False" Text="Pay Bill" OnClick="GridView1_SelectedIndexChanged" CommandArgument='<%#Eval("pid")+";"+Eval("price") %>'></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning btn-block" ID="LinkButton2" runat="server" CausesValidation="false" Text="Unsubscribe"  OnClick="LinkButton2_Click" CommandArgument='<%#Eval("uid")+";"+Eval("pid") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>




            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Payment Method</h4>
                                    
                                </center>




                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />



                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Payment Method</label>
                        <asp:DropDownList ID="DropDownList1" class="form-control" Height="37px" Width="236px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem Text="Bkash" Value="Bkash"></asp:ListItem>
                                            <asp:ListItem Text="Rocket" Value="Rocket"></asp:ListItem>
                                            <asp:ListItem Text="Nagad" Value="Nagad"></asp:ListItem>                                        
                                        </asp:DropDownList>
                                </div>
                            </div>
                        <asp:Image src="imgs/bkash.svg" width="300" height="300" ID="Image1" runat="server" Visible="False" />
                        <asp:Image src="imgs/rocket.svg" width="300" height="300" ID="Image2" runat="server" Visible="False" />
                        <div class="row">
                            <div class="col">
                                <hr />



                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Package ID</label>
                                <asp:Label class="form-control" ID="Label7" runat="server" Text="ID"></asp:Label>


                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Amount</label>
                                <asp:Label class="form-control" ID="Label6" runat="server" Text="Amount"></asp:Label>


                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Payment Number</label>
                                <asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>



                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Transaction ID</label>
                                <asp:TextBox class="form-control" ID="TextBox2" runat="server"></asp:TextBox>



                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-success btn-block" ID="Button1" runat="server" Text="Pay" OnClick="Button1_Click" Visible="False" />



                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
