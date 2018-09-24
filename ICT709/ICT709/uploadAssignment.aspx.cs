using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class uploadAssignment : System.Web.UI.Page
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
        cmd.CommandText = "select isnull(max(req_id),0) from corporate_requirements";
        cmd.Connection = cn;
        cn.Open();
        Object res = cmd.ExecuteScalar();
        cn.Close();
        if (res != null)
            no = (int.Parse(res.ToString())) + 1;

        return no;
    }
    protected void btnUploads_Click(object sender, EventArgs e)
    {
        try
        {
            if (uploadAttachments.HasFile)
            {
                string strFile = uploadAttachments.PostedFile.FileName.Trim();
                string[] sfile = strFile.Split("\\".ToCharArray());
                string filename = sfile[sfile.Length - 1];
                int b = 0;
                if (strFile.Contains(".pdf") || strFile.Contains(".doc"))
                {
                    uploadAttachments.PostedFile.SaveAs(Server.MapPath("~/AssignmentsUploads/") + filename);
                   int res= insertDocument(Description.Text,filename);
                    if(res>0)
                    {
                        Response.Write("<script> alert('Uploading Successful...') </script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Fail to Upload...') </script>");
                    }

                }

               
            }

        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Warning: " + ex.Message;
        }
    }

    private  int insertDocument(string desc, string fnm)
    {
        int id;
        id = getNextId();
        cn = new SqlConnection();
        cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        cn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "insert into corporate_requirements values(@id,@cid,@desc,@fl,@dt,@edt,@app)";
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@cid", int.Parse(this.Session["uid"].ToString()));
        cmd.Parameters.AddWithValue("@desc", desc);
        cmd.Parameters.AddWithValue("@fl", fnm);
        cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@edt", DateTime.Now.AddDays(4).ToShortDateString());
        cmd.Parameters.AddWithValue("@app", false);
        cmd.Connection = cn;
        int i = cmd.ExecuteNonQuery();
        cn.Close();
        if (i > 0)
            return id;
        else
            return id;

    }
}


