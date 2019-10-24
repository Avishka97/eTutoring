using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eTutoring
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_User.Text = "User : " + Connection_Query.loginStatus;
            var user = Connection_Query.loginStatus;
            lblHello.Text = user;
        }

        protected void btnMessage_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("Message.aspx", true);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("Upload.aspx", true);
        }

        protected void btnMeeting_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("Meeting.aspx", true);
        }

        protected void Blog_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("default.aspx", true);
        }
    }
}