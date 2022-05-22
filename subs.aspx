<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="subs.aspx.cs" Inherits="LISP.subs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
     $(document).ready(function () {
         $('#<%= GridView1.ClientID%>').prepend($("<thead></thead>").append($("#<%= GridView1.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
        });
    });
        </script>
        <style type="text/css">
            .auto-style1 {
                position: relative;
                width: 100%;
                -ms-flex: 0 0 83.333333%;
                flex: 0 0 83.333333%;
                max-width: 83.333333%;
                padding-left: 15px;
                padding-right: 15px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="auto-style1">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h1>Subscriber Management</h1>
                                </center>

                                <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LISPdbConnectionString %>" SelectCommand="SELECT * FROM [subs]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped" ID="GridView1" runat="server" OnRowDataBound="rw1" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="uid" HeaderText="User ID" SortExpression="uid" />
                                        <asp:BoundField DataField="pid" HeaderText="Product ID" SortExpression="pid" />
                                        <asp:BoundField DataField="uname" HeaderText="User Name" SortExpression="uname" />
                                        <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                                        <asp:BoundField DataField="pkg_amount" HeaderText="Amount" SortExpression="pkg_amount" />
                                        <asp:BoundField DataField="ip_type" HeaderText="IP Type" SortExpression="ip_type" />
                                        <asp:BoundField DataField="flg" HeaderText="Flag" SortExpression="flg" />
  
                                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />

                                        <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton class="btn btn-success btn-block" ID="LinkButton1" runat="server" CausesValidation="False" Text="Flag" OnClick="GridView1_SelectedIndexChanged"  CommandArgument='<%#Eval("uid")+";"+Eval("pid") %>'></asp:LinkButton>
                                                            <asp:LinkButton class="btn btn-danger btn-block" ID="LinkButton2" runat="server" CausesValidation="false"   Text="Delete"  OnClick="GridView2_SelectedIndexChanged" CommandArgument='<%#Eval("uid")+";"+Eval("pid")+";"+Eval("flg") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                                

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
