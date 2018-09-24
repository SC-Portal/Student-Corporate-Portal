using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{
    

    protected void Page_Init(object sender, EventArgs e)
    {
       
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
       
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(this.Session["unm"]!=null)
        { 
        lblWel.Visible = true;
        lblWel.Text = "Welcome " + Session["unm"].ToString();
        LinkButton1.Visible = true;
        }
        else
        {
            LinkButton1.Visible = false;
            lblWel.Visible = false;
        }
    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
       // Context.GetOwinContext().Authentication.SignOut();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.Session.Abandon();
        LinkButton1.Visible = false;
        lblWel.Visible = false;
      
        Response.Redirect("~/");
    }
}