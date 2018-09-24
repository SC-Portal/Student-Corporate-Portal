using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class RateStudentSolution : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnRate_Click(object sender, EventArgs e)
    {
        if (this.IsValid)
        {
            cn = new SqlConnection();
            cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            // cn.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "update student_uploads set rating = '" + Rating.Text + "' where assg_id = " + Request.QueryString["assgid"].ToString();
            cmd.Connection = cn;
            cn.Open();
            int res = cmd.ExecuteNonQuery();
            cn.Close();
            if (res > 0)
            {
                Response.Write("<script> alert('Rating To student Solution Successful...') </script>");

            }
            else
            {
                Response.Write("<script> alert('Fail to Rate...') </script>");
            }
            Response.Redirect("~/Corporate.aspx");
        }
    }
}