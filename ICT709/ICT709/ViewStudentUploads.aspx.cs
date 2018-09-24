using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewStudentUploads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnDownload_Command(object sender, CommandEventArgs e)
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
            ltrlslno = (Label)GridView1.Rows[index].FindControl("Label6");
            path = "~/SolutionUploads/" + ltrlslno.Text;
            reqid = (Label)GridView1.Rows[index].FindControl("Label3");
            if (path != string.Empty)
            {
                string filePath = path;
                string[] s = ltrlslno.Text.Trim().Split(".".ToCharArray());
                if (s[1].Equals("pdf"))
                {
                    Response.ContentType = "pdf/pdf";
                }
                else if (s[1].Equals("doc"))
                {
                    Response.ContentType = "doc/docx";
                }
                else
                {
                    Response.ContentType = "rar/rar";
                }
                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + path + "\"");
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
            }
        }
        else if (e.CommandName == "btnRate")
        {
            index = Convert.ToInt32(e.CommandArgument.ToString());
            ltrlslno = (Label)GridView1.Rows[index].FindControl("Label4");
            Response.Redirect("~/RateStudentSolution.aspx?assgid=" + ltrlslno.Text);

        }
    }
}