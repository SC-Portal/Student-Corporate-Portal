<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserQueries.aspx.cs" Inherits="UserQueries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
     <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>User Queries.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The  name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Query" CssClass="col-md-2 control-label">Query</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Query" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Query"
                    CssClass="text-danger" ErrorMessage="The Query field is required." />
            </div>
        </div>
                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MobileNo" CssClass="col-md-2 control-label">Mobile No.</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MobileNo" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MobileNo"
                    CssClass="text-danger" ErrorMessage="The mobile no field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Send" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
            </div>
    <div class="col-md-4">
            <section id="socialLoginForm">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/reg3.jpg" Width="320px" Height="203px" />
                <br>
                <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/images/sp2.jpg" Width="315px" />
                <%--<uc:openauthproviders runat="server" id="OpenAuthLogin" />--%>
            </section>
        </div>
         </div>
</asp:Content>

