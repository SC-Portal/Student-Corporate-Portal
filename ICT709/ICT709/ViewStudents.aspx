<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewStudents.aspx.cs" Inherits="ViewStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>Admin Corner</h4>
        <hr />
        
         <div class="form-group">
           
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="517px" DataKeyNames="student_id">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:BoundField DataField="student_id" HeaderText="Student Id" ReadOnly="True" SortExpression="student_id" />
                          <asp:BoundField DataField="student_name" HeaderText="Student Name" SortExpression="student_name" />
                          <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                          <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                          <asp:BoundField DataField="mobileno" HeaderText="Mobile No" SortExpression="mobileno" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [student]"></asp:SqlDataSource>
</asp:Content>

