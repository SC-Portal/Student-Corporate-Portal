using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Account_RegisterCorporate : System.Web.UI.Page
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
        cmd.CommandText = "select max(user_id) from users";
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
            cmd.CommandText = "insert into users values(@uid,@unm,@pwd,@type,@appr)";
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@unm", UserName.Text);
            cmd.Parameters.AddWithValue("@pwd", Password.Text);
            cmd.Parameters.AddWithValue("@type", "Corporate");
            cmd.Parameters.AddWithValue("@appr", false);
            cmd.Connection = cn;
            cn.Open();
            int i = cmd.ExecuteNonQuery();
            cn.Close();
            cmd = new SqlCommand();
            cmd.CommandText = "insert into corporate values(@uid,@unm,@add,@email,@mbno,@per)";
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@unm", CorporateName.Text);
            cmd.Parameters.AddWithValue("@add", Address.Text);
            cmd.Parameters.AddWithValue("@email", Email.Text);
            cmd.Parameters.AddWithValue("@mbno", MobileNo.Text);
            cmd.Parameters.AddWithValue("@per", ContactPerson.Text);
            cmd.Connection = cn;
            cn.Open();
            i = cmd.ExecuteNonQuery();
            cn.Close();
            if (i > 0)
                Response.Redirect("~/Account/Login.aspx?user=Corporate");
        }
        catch (Exception ex)
        {

        }

    }
}