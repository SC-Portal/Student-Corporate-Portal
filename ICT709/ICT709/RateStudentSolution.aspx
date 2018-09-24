<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RateStudentSolution.aspx.cs" Inherits="RateStudentSolution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
     <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>Rate Student Solution.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Rating" CssClass="col-md-2 control-label">Rate Solution (1 - 5) </asp:Label>
             <br />
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Rating" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Rating"
                    CssClass="text-danger" ErrorMessage="The Rating field is required." />
                <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" ErrorMessage="Rating must be 1 - 5" ControlToValidate="Rating" MaximumValue="5" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            </div>
        </div>
       
        
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server"  Text="Rate" CssClass="btn btn-default" ID="btnRate" OnClick="btnRate_Click"  />
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

