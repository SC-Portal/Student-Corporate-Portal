using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class ApproveStudents : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection();
        cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        cmd = new SqlCommand();
        cmd.CommandText = "select count(user_id) from users where approve = 1";
        cmd.Connection = cn;
        cn.Open();
        object res = cmd.ExecuteScalar();
        cn.Close();
        if(res== null)
        {
            Response.Write("<script> alert('No Student For Approval...') </script>");
        }

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btnApprove")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label ltrlslno = (Label)GridView1.Rows[index].FindControl("Label1");
            cn = new SqlConnection();
            cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            cmd = new SqlCommand();
            cmd.CommandText = "update users set approve = 1 where user_id = " + ltrlslno.Text;
            cmd.Connection = cn;
            cn.Open();
            int i = cmd.ExecuteNonQuery();
            cn.Close();
            if(i>0)
                Response.Write("<script> alert('Approved...') </script>");
            else
                Response.Write("<script> alert('Fail to Approve...') </script>");
        }
    }
}