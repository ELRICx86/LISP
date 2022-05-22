<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="LISP.Packages" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/packages.css" rel="stylesheet" />
    <script>
     $(document).ready(function () {
         $('#<%= GridView1.ClientID%>').prepend($("<thead></thead>").append($("#<%= GridView1.ClientID%>").find("tr:first"))).DataTable({
            stateSave: true,
        });
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LISPdbConnectionString %>" SelectCommand="SELECT * FROM [pkg]"></asp:SqlDataSource>
        <div class="container-fluid">
            <div class="col-md-8 mx-auto">
                <center><h1>Packages</h1></center>
                <hr />
                <asp:GridView style="margin-top:0px;" class="table table-hover table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="pkg_amount" HeaderText="Amount" ReadOnly="True" SortExpression="pkg_amount" />

                        <asp:TemplateField>
                            <ItemTemplate>
                               
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-sm-8" >
                                            <div class="row">
                                                            <div class="col">
                                                                <span style="color:orangered;">IP Type : </span><asp:Label ID="Label1" runat="server" Text='<%# Eval("ip_type") %>'></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col">
                                                                <span style="color:orangered;">BDIX Speed : </span><asp:Label ID="Label2" runat="server" Text='<%# Eval("bdix") %>'></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col">
                                                                <span style="color:orangered;">Cached Servers : </span><asp:Label ID="Label3" runat="server" Text='<%# Eval("server") %>'></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col">
                                                                <span style="color:orangered;">Cached Games : </span><asp:Label ID="Label4" runat="server" Text='<%# Eval("games") %>'></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col">
                                                                <span style="color:orangered;">TorrentBD speed : </span><asp:Label ID="Label5" runat="server" Text='<%# Eval("tbd") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                        </div>

          
                                    </div>
                                </div>
                            </ItemTemplate><HeaderTemplate>Description</HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="price" HeaderText="Price (Taka)" ReadOnly="True" SortExpression="id" />

                        
                        
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton class="btn btn-outline-info btn-block " ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" Text="Subscribe!" CommandArgument='<%#Eval("id") %>' OnClick="GridView1_SelectedIndexChanged1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        
                    </Columns>
                </asp:GridView>





            </div>
        </div>

    </div>
</asp:Content>
