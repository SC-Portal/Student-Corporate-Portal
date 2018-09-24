<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproveCorporateAssignments.aspx.cs" Inherits="ApproveCorporateAssignments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
     <div class="row">
        <div class="col-md-8">
    <div class="form-horizontal">
        <h4>Admin Corner</h4>
        <hr />
        
         <div class="form-group">
           
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="694px" DataKeyNames="coporate_id,req_id" OnRowCommand="GridView1_RowCommand">
                      <AlternatingRowStyle BackColor="White" />
                      <Columns>
                          <asp:TemplateField HeaderText="Id" SortExpression="req_id">
                              <EditItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("req_id") %>'></asp:Label>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("req_id") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Corporate" SortExpression="corporate_name">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("corporate_name") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("corporate_name") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Description" SortExpression="req_desc">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("req_desc") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("req_desc") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Upload File" SortExpression="upload_file">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("upload_file") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("upload_file") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Date" SortExpression="upload_dt">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("upload_dt") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("upload_dt") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Approve">
                              <ItemTemplate>
                                  <asp:LinkButton ID="btnApprove" runat="server" CausesValidation="false" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="btnApprove" Text="Approve"></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT corporate.coporate_id, corporate.corporate_name, corporate_requirements.req_desc, corporate_requirements.upload_file, corporate_requirements.upload_dt, corporate_requirements.req_id FROM corporate INNER JOIN corporate_requirements ON corporate.coporate_id = corporate_requirements.corporate_id AND corporate_requirements.approve = 0"></asp:SqlDataSource>
</asp:Content>

