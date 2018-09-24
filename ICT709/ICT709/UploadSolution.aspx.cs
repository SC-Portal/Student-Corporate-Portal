using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class UploadSolution : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {

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
                if (strFile.Contains(".rar") || strFile.Contains(".docx"))
                {
                    uploadAttachments.PostedFile.SaveAs(Server.MapPath("~/SolutionUploads/") + filename);
                   cn = new SqlConnection();
                    cn.ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                   // cn.Open();
                    cmd = new SqlCommand();
                    cmd.CommandText = "update student_uploads set upload_file_path = '" + filename + "' where assg_id = " + Request.QueryString["assgid"].ToString () ;
                    cmd.Connection = cn;
                    cn.Open();
                    int res = cmd.ExecuteNonQuery();
                    cn.Close();
                    if (res > 0)
                    {
                        Response.Write("<script> alert('Uploading Successful...') </script>");
                       
                    }
                    else
                    {
                        Response.Write("<script> alert('Fail to Upload...') </script>");
                    }
                    Response.Redirect("~/Student.aspx");

                }


            }

        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Warning: " + ex.Message;
        }
    }
}