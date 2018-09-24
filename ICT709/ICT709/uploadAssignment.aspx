<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="uploadAssignment.aspx.cs" Inherits="uploadAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
     <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>Corporate Uploads New Assignments.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Requirements Description</asp:Label>
             <br />
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Description" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Description"
                    CssClass="text-danger" ErrorMessage="The Description field is required." />
            </div>
        </div>
       
         <div class="form-group">
            <asp:Label runat="server" ID="Document" CssClass="col-md-2 control-label">Upload Solution</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload ID="uploadAttachments" runat="server" /> 
               
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server"  Text="Uploads" CssClass="btn btn-default" ID="btnUploads" OnClick="btnUploads_Click" />
            </div>
        </div>
    </div>
            </div>
           
    <div class="col-md-4" "margin-top=20 px">
         <br />
         <br />
            <section id="socialLoginForm">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/sp6.jpg" Width="313px" Height="203px" />
                <br />
                <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/images/sp2.jpg" Width="315px" />
                <%--<uc:openauthproviders runat="server" id="OpenAuthLogin" />--%>
            </section>
        </div>
         </div>
</asp:Content>

