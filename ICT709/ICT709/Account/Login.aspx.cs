using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using ICT709;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Account_Login : Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
       protected void Page_Load(object sender, EventArgs e)
        {
        
        if (Request.QueryString["user"].ToString().Equals("Admin"))
        {
            RegisterHyperLink.Visible = false;
        }
        else if (Request.QueryString["user"].ToString().Equals("Corporate"))
        {
            lblMsg.Text = "New Corporates Sign Up Here";
            RegisterHyperLink.NavigateUrl = "~/Account/RegisterCorporate.aspx";
        }
        else if (Request.QueryString["user"].ToString().Equals("Student"))
        {
            lblMsg.Text = "New Students Sign Up Here";
            RegisterHyperLink.NavigateUrl = "~/Account/Register.aspx";
        }
        }

        protected void LogIn(object sender, EventArgs e)
        {
        DataSet ds = null;
        cn = new SqlConnection();
        cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        cn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "select * from users where username = @unm and password = @pwd and type = @type and approve=@appr";
        cmd.Parameters.AddWithValue("@unm",UserName.Text);
        cmd.Parameters.AddWithValue("@pwd", Password.Text);
        cmd.Parameters.AddWithValue("@type", Request.QueryString["user"].ToString());
        cmd.Parameters.AddWithValue("@appr", 1);
        cmd.Connection = cn;
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds, "users");
        if (ds.Tables["users"].Rows.Count > 0)
        {
            this.Session["uid"] = ds.Tables["users"].Rows[0][0];
            this.Session["unm"] = ds.Tables["users"].Rows[0][1];
            this.Session["islogin"] = "y";
            if (Request.QueryString["user"].ToString().Equals("Student"))
            {
                Response.Redirect("~/Student.aspx");
            }
            else if (Request.QueryString["user"].ToString().Equals("Corporate"))
            {
                Response.Redirect("~/Corporate.aspx");
            }
            else if (Request.QueryString["user"].ToString().Equals("Admin"))
            {
                Response.Redirect("~/Admin.aspx");
            }

        }
        else
        {
            lblMsg.Text="Check Username or Password or Contact Administrator";
        }
    }
}