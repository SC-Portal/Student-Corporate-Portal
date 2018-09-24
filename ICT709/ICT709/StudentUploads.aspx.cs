using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentUploads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btnUpload")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label ltrlslno = (Label)GridView1.Rows[index].FindControl("Label1");
            Response.Redirect("~/UploadSolution.aspx?assgid=" + ltrlslno.Text);
        }
    }
}