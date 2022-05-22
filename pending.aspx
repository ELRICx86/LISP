<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="pending.aspx.cs" Inherits="LISP.pending" %>

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
            <div class="col-sm-10">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h1>Pending</h1>
                                </center>


                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LISPdbConnectionString %>" SelectCommand="SELECT * FROM [pending]"></asp:SqlDataSource>
                                    <div class="col">
                                        <div class="table-responsive">
                                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <Columns>
                                                    <asp:BoundField DataField="uid" HeaderText="UserID" SortExpression="uid" />
                                                    <asp:BoundField DataField="uname" HeaderText="User Name" SortExpression="uname" />
                                                    <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                                                    <asp:BoundField DataField="pid" HeaderText="ProductID" SortExpression="pid" />
                                                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                                    <asp:BoundField DataField="type" HeaderText="IP Type" SortExpression="type" />
                                                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />

                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton class="btn btn-success btn-block" ID="LinkButton1" runat="server" CausesValidation="False" Text="Approve" OnClick="GridView1_SelectedIndexChanged" CommandArgument='<%#Eval("uid")+";"+Eval("pid") %>'></asp:LinkButton>
                                                            <asp:LinkButton class="btn btn-danger btn-block" ID="LinkButton2" runat="server" CausesValidation="false" CommandName=""  Text="Cancel" OnClick="LinkButton2_Click" CommandArgument='<%#Eval("uid")+";"+Eval("pid") %>'></asp:LinkButton>
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
    </div>
</asp:Content>
