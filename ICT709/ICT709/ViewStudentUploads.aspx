<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewStudentUploads.aspx.cs" Inherits="ViewStudentUploads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
     <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
       <br />
        <h4>Students Uploads</h4>
        <hr />
        
         <div class="form-group">
           
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="775px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:TemplateField HeaderText="Student Id" SortExpression="student_id">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("student_id") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("student_id") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Student" SortExpression="student_name">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("student_name") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("student_name") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Corporate" SortExpression="corporate_name">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("corporate_name") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("corporate_name") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Assg. Id" SortExpression="assg_id">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("assg_id") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("assg_id") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Description" SortExpression="req_desc">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("req_desc") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("req_desc") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Upload File Path" SortExpression="upload_file_path">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("upload_file_path") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label6" runat="server" Text='<%# Bind("upload_file_path") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Download Solution">
                              <ItemTemplate>
                                  <asp:LinkButton ID="btnDownload" runat="server" CausesValidation="false" CommandName="btnDownload" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnCommand="btnDownload_Command" Text="Download"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Rate Student Solution">
                              <ItemTemplate>
                                  <asp:LinkButton ID="btnRate" runat="server" CausesValidation="false" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="btnRate" Text="Rate"></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT student.student_id, student.student_name, corporate.corporate_name,student_uploads.assg_id,  corporate_requirements.req_desc,student_uploads.upload_file_path FROM student INNER JOIN student_uploads ON student.student_id = student_uploads.student_id INNER JOIN corporate_requirements ON student_uploads.req_id = corporate_requirements.req_id INNER JOIN corporate ON corporate_requirements.corporate_id = corporate.coporate_id where corporate.coporate_id = @coporate_id">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="15" Name="coporate_id" SessionField="uid" />
        </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>

