using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class UserQueries : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private int getNextId()
    {
        int no = 1;
        cn = new SqlConnection();
        cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        cmd = new SqlCommand();
        cmd.CommandText = "select isnull(max(id),0) from userqueries";
        cmd.Connection = cn;
        cn.Open();
        Object res = cmd.ExecuteScalar();
        cn.Close();
        no = (int.Parse(res.ToString())) + 1;

        return no;
    }
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        DataSet ds = null;
        try
        {
            int uid = getNextId();
            cn = new SqlConnection();
            cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            // cn.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "insert into userqueries values(@uid,@unm,@qry,@eml,@mbno)";
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@unm", Name.Text);
            cmd.Parameters.AddWithValue("@qry", Query.Text);
            cmd.Parameters.AddWithValue("@eml", Email.Text);
            cmd.Parameters.AddWithValue("@mbno", MobileNo.Text);
            cmd.Connection = cn;
            cn.Open();
            int i = cmd.ExecuteNonQuery();
            cn.Close();

            if (i > 0)
                Response.Write("<script> alert('Your Query Submission is Successful...') </script>");
        }
        catch (Exception ex)
        {

        }

    }
}