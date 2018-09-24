<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>Student&nbsp; Corner</h4>
        <hr />
        
         <div class="form-group">
           
              <div class="col-md-10">
                <br />
                  <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="student_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="140px" Width="212px">
                      <EditItemTemplate>
                          student_id:
                          <asp:Label ID="student_idLabel1" runat="server" Text='<%# Eval("student_id") %>' />
                          <br />
                          student_name:
                          <asp:TextBox ID="student_nameTextBox" runat="server" Text='<%# Bind("student_name") %>' />
                          <br />
                          address:
                          <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                          <br />
                          email:
                          <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                          <br />
                          mobileno:
                          <asp:TextBox ID="mobilenoTextBox" runat="server" Text='<%# Bind("mobileno") %>' />
                          <br />
                          <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                          &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      </EditItemTemplate>
                      <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                      <FooterStyle BackColor="#CCCCCC" />
                      <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                      <InsertItemTemplate>
                          student_id:
                          <asp:TextBox ID="student_idTextBox" runat="server" Text='<%# Bind("student_id") %>' />
                          <br />
                          student_name:
                          <asp:TextBox ID="student_nameTextBox" runat="server" Text='<%# Bind("student_name") %>' />
                          <br />
                          address:
                          <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                          <br />
                          email:
                          <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                          <br />
                          mobileno:
                          <asp:TextBox ID="mobilenoTextBox" runat="server" Text='<%# Bind("mobileno") %>' />
                          <br />
                          <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                          &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      </InsertItemTemplate>
                      <ItemTemplate>
                          student_id:
                          <asp:Label ID="student_idLabel" runat="server" Text='<%# Eval("student_id") %>' />
                          <br />
                          student_name:
                          <asp:Label ID="student_nameLabel" runat="server" Text='<%# Bind("student_name") %>' />
                          <br />
                          address:
                          <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                          <br />
                          email:
                          <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                          <br />
                          mobileno:
                          <asp:Label ID="mobilenoLabel" runat="server" Text='<%# Bind("mobileno") %>' />
                          <br />
                      </ItemTemplate>
                      <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                  </asp:FormView>
                  </div>
                      </div>
        </div>
           </div>
           
    <div class="col-md-4" "margin-top=20 px">
         <br />
         <br />
            <section id="socialLoginForm">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/uer6.jpg" Width="313px" Height="203px" />
                <br />
                <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/images/sp2.jpg" Width="315px" />
                <%--<uc:openauthproviders runat="server" id="OpenAuthLogin" />--%>
            </section>
        </div>
         </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [student] WHERE ([student_id] = @student_id)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="student_id" SessionField="uid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

