<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ftp_management.aspx.cs" Inherits="LISP.ftp_management" %>

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
                                    <h1>FTP Management</h1>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Select File</label>
                                    <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col">

                                <label>ID</label>
                                <asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <label>Title</label>
                                <asp:TextBox class="form-control" ID="TextBox2" runat="server"></asp:TextBox>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <label>Details</label>
                                <asp:TextBox class="form-control" ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <label>Type</label>
                                <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="Movie" Value="movie"></asp:ListItem>
                                    <asp:ListItem Text="Tv Series" Value="series"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="drama"></asp:ListItem>
                                    <asp:ListItem Text="Ebook" Value="ebook"></asp:ListItem>


                                </asp:DropDownList>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Select Thumbnail Image</label>
                                    <asp:FileUpload CssClass="form-control" ID="FileUpload2" runat="server" />

                                </div>
                            </div>

                        </div>

                        <br />


                        <div class="form-group">
                            <asp:Button type="button" class="btn btn-success btn-block " ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click"></asp:Button>
                        </div>




                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
