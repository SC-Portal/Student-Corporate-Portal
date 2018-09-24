using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class ViewAssignments : System.Web.UI.Page
{
    String filename = "";
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
        cmd.CommandText = "select isnull(max(assg_id),0) from student_uploads";
        cmd.Connection = cn;
        cn.Open();
        Object res = cmd.ExecuteScalar();
        cn.Close();
        if (res != null)
            no = (int.Parse(res.ToString())) + 1;

        return no;
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        Label ltrlslno, reqid;
        string path;

        if (e.CommandName == "btnDownload")
        {
            index = Convert.ToInt32(e.CommandArgument.ToString());
            ltrlslno = (Label)GridView1.Rows[index].FindControl("Label5");
            path = "~/AssignmentsUploads/" + ltrlslno.Text;
            reqid = (Label)GridView1.Rows[index].FindControl("Label3");
            if (path != string.Empty)
            {
                string filePath = path;
                string[] s = ltrlslno.Text.Trim().Split(".".ToCharArray());
                if (s[1].Equals("pdf"))
                {
                    Response.ContentType = "pdf/pdf";
                }
                else
                {
                    Response.ContentType = "doc/docx";
                }
                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + path + "\"");
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
            }
        }
        else if (e.CommandName == "btnCommit")
        {
            index = Convert.ToInt32(e.CommandArgument.ToString());
            ltrlslno = (Label)GridView1.Rows[index].FindControl("Label5");
            path = "~/AssignmentsUploads/" + ltrlslno.Text;
            reqid = (Label)GridView1.Rows[index].FindControl("Label3");
            int id;
            id = getNextId();
            cn = new SqlConnection();
            cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            cn.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "insert into student_uploads values(@aid,@rid,@sid,@fl,@dt,@rt)";
            cmd.Parameters.AddWithValue("@aid", id);
            cmd.Parameters.AddWithValue("@rid", int.Parse(reqid.Text));
            cmd.Parameters.AddWithValue("@sid", int.Parse(this.Session["uid"].ToString()));
            cmd.Parameters.AddWithValue("@fl",DBNull.Value);
            cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@rt", 0);
            cmd.Connection = cn;
            int i = cmd.ExecuteNonQuery();
            cn.Close();
            if (i > 0)
            {
                Response.Write("<script> alert('Successfully Assigned To U...') </script>");
            }
            else
            {
                Response.Write("<script> alert('Failed To assign ...') </script>");
            }

        }
        }
   // }

    protected void btnDownload_Command(object sender, CommandEventArgs e)
    {
        //GridView1_RowCommand(sender, e);
    }

    protected void btnCommit_Command(object sender, CommandEventArgs e)
    {

    }
}