<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentUploads.aspx.cs" Inherits="StudentUploads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>&nbsp;</h4>
        <h4>Student&nbsp; Corner</h4>
        <hr />
        
         <div class="form-group">
           
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="621px" DataKeyNames="assg_id" OnRowCommand="GridView1_RowCommand">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:TemplateField HeaderText="Assignment Id" SortExpression="assg_id">
                              <EditItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Enabled="False" Text='<%# Eval("assg_id") %>'></asp:Label>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("assg_id") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Student Id" SortExpression="student_id">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Text='<%# Bind("student_id") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("student_id") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Corporate" SortExpression="corporate_name">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Enabled="False" Text='<%# Bind("corporate_name") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("corporate_name") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Description" SortExpression="req_desc">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server" Enabled="False" Text='<%# Bind("req_desc") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("req_desc") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Upload File" SortExpression="upload_file_path">
                              <EditItemTemplate>
                                  <asp:FileUpload ID="FileUpload1" runat="server"  />
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("upload_file_path") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="upload">
                              <ItemTemplate>
                                  <asp:LinkButton ID="btnUpload" runat="server" CausesValidation="false" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="btnUpload" Text="Upload Solution"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT student_uploads.assg_id, student_uploads.student_id, corporate.corporate_name, corporate_requirements.req_desc, student_uploads.upload_file_path FROM corporate INNER JOIN corporate_requirements ON corporate.coporate_id = corporate_requirements.corporate_id INNER JOIN student_uploads ON corporate_requirements.req_id = student_uploads.req_id WHERE (student_uploads.student_id = @student_id) and  student_uploads.upload_file_path  is NULL">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="4" Name="student_id" SessionField="uid" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

