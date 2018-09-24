using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class ChangePasword : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUser_Click(object sender, EventArgs e)
    {
        if(this.IsValid)
        { 
        cn = new SqlConnection();
        cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        cn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "update users set password = ' " + Password.Text + "' where user_id = " + this.Session["uid"].ToString ();
        cmd.Connection = cn;
        int i = cmd.ExecuteNonQuery();
        cn.Close();
            if (i > 0)
                Response.Write("<script> alert('Password Changed...') </script>");
            else
                Response.Write("<script> alert('Fail to Change Password...') </script>");



        }
    }

}