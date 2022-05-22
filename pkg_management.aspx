<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="pkg_management.aspx.cs" Inherits="LISP.pkg_management" %>

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
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-striped">
                            <tr>
                                <td>Unique Id</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Height="37px" Width="215px"></asp:TextBox>
                                    &nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" BackColor="#FF9900" Font-Bold="True" ForeColor="Black" Height="36px" Text="Search" Width="80px" OnClick="Button1_Click" />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Package Amount</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Height="37px" Width="236px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>IP Type</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1"    Height="37px" Width="236px" runat="server">
                                            <asp:ListItem Text="Real IP" Value="Real IP"></asp:ListItem>
                                            <asp:ListItem Text="Shared IP" Value="Shared IP"></asp:ListItem>
                                            <asp:ListItem Text="Dedicated IP" Value="Dedicated IP"></asp:ListItem>
                                            <asp:ListItem Text="Gaming IP" Value="Gaming IP"></asp:ListItem>
                                            <asp:ListItem Text="Streaming IP" Value="Shared IP"></asp:ListItem>
                                            
                                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>BDIX Speed</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Height="37px" Width="236px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                              
                                <td>Cache Servers</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" Height="37px" Width="236px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Cached Games</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Height="37px" Width="236px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>TorrentBD Speed</td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" Height="37px" Width="236px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Price</td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" Height="37px" Width="236px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="Button2" runat="server" BackColor="#FF9900" Font-Bold="True" ForeColor="Black" Height="36px" OnClick="Button2_Click" Text="Add new" Width="95px" />
                                    &nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" BackColor="#FF9900" Font-Bold="True" ForeColor="Black" Height="36px" Text="Save" Width="95px" OnClick="Button3_Click" />
                                    &nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" BackColor="#FF9900" Font-Bold="True" ForeColor="Black" Height="36px" Text="Update" Width="95px" OnClick="Button4_Click" />
                                    &nbsp;
                    <asp:Button ID="Button5" runat="server" BackColor="#FF9900" Font-Bold="True" ForeColor="Black" Height="36px" Text="Delete" Width="95px" OnClick="Button5_Click" />
                                    &nbsp;
                    <asp:Button ID="Button6" runat="server" BackColor="#FF9900" Font-Bold="True" ForeColor="Black" Height="36px" Text="Cancel" Width="95px" OnClick="Button6_Click" />
                                    <br />
                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Package List</h4>
                                </center>
                            
                            
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LISPdbConnectionString %>" SelectCommand="SELECT * FROM [pkg]"></asp:SqlDataSource>
                                <div class="col">
                                    <div class="table-responsive">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="pkg_amount" HeaderText="Package Amount" SortExpression="pkg_amount" />
                                            <asp:BoundField DataField="ip_type" HeaderText="IP Type" SortExpression="ip_type" />
                                            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                </div></div>
                                
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>




</asp:Content>
