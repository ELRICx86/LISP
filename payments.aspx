<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payments.aspx.cs" Inherits="LISP.payments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
     $(document).ready(function () {
         $('#<%= GridView1.ClientID%>').prepend($("<thead></thead>").append($("#<%= GridView1.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
        });
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h1>Payments</h1>
                                </center>
                                <div class="row"> 
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LISPdbConnectionString %>" SelectCommand="SELECT * FROM [payment]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView  class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True">
                                            <Columns>
                                                <asp:BoundField DataField="uid" HeaderText="User ID" SortExpression="uid" />
                                                <asp:BoundField DataField="uname" HeaderText="User Name" SortExpression="uname"/>
                                                <asp:BoundField DataField="pid" HeaderText="Package ID" SortExpression="pid" />
                                                <asp:BoundField DataField="pkg_amount" HeaderText="Amount" SortExpression="pkg_amount" />
                                                <asp:BoundField DataField="pay_method" HeaderText="Payment Method" SortExpression="pay_method" />
                                                <asp:BoundField DataField="pay_no" HeaderText="Payment Number" SortExpression="pay_no" />
                                                <asp:BoundField DataField="tran_no" HeaderText="Transaction ID" SortExpression="tran_no" />
                                                <asp:BoundField DataField="date" HeaderText="Paid Date" SortExpression="date" />
                                                <asp:BoundField DataField="paid" HeaderText="Pay Amount" SortExpression="paid" />
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
