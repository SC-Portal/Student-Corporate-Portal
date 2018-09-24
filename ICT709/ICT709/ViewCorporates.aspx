<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewCorporates.aspx.cs" Inherits="ViewCorporates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>&nbsp;</h4>
        <h4>Admin Corner</h4>
        <hr />
        
         <div class="form-group">
           
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="618px" DataKeyNames="coporate_id">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:BoundField DataField="coporate_id" HeaderText="Id" ReadOnly="True" SortExpression="coporate_id" />
                          <asp:BoundField DataField="corporate_name" HeaderText="Corporate" SortExpression="corporate_name" />
                          <asp:BoundField DataField="corp_address" HeaderText="Address" SortExpression="corp_address" />
                          <asp:BoundField DataField="corp_email" HeaderText="Email" SortExpression="corp_email" />
                          <asp:BoundField DataField="corp_mobile" HeaderText="Mobile" SortExpression="corp_mobile" />
                          <asp:BoundField DataField="contact_person" HeaderText="Contact" SortExpression="contact_person" />
                      </Columns>
                      <EditRowStyle BackColor="#2461BF" />
                      <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                      <RowStyle BackColor="#EFF3FB" />
                      <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                      <SortedAscendingCellStyle BackColor="#F5F7FB" />
                      <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                      <SortedDescendingCellStyle BackColor="#E9EBEF" />
                      <SortedDescendingHeaderStyle BackColor="#4870BE" />
                  </asp:GridView>
                <br />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [corporate]"></asp:SqlDataSource>
</asp:Content>

