using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace eTutoring
{
    public partial class StudentRequestTutor : System.Web.UI.Page
    {
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_User.Text = "User : " + Session["loginStatus"].ToString();
            var user = Session["loginStatus"].ToString();
            Check(user);
            

        }
        public object Check(string Username)
        {
            
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("select Request , T_ID from Student where Username ='"+Username+"'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            //Connection open here   
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            var Request = dt.Rows[0].Field<string>("Request");
            var Tutor = dt.Rows[0].Field<string>("T_ID");
            if (Request == "1" & Tutor != null)
            {
                HttpContext.Current.Response.Redirect("Student.aspx", true);

            }
            else if (Request == "1")
            {
                btn_Request.Enabled = false;
                lblRequest.Text = "We will asign a tutor as soon as possible, please wait, It will take 3-5 days.";
            }
            else
            {                
               
                btn_Request.Enabled = true;
                lblRequest.Text = "";
            }

            return Tutor;
        }

        protected void btn_Request_Click(object sender, EventArgs e)
        {
            string a = "1";
            string user = Session["loginStatus"].ToString();
            Connection_Query Database = new Connection_Query();
            Database.OpenObject();
            Database.OpenConnection();
            Database.ExecuteQueries("UPDATE Student SET Request='"+a+"' WHERE Username='"+ user + "'");
            Database.CloseConnection();

            lblRequest.Text = "We will asign a tutor as soon as possible, please wait, It will take 3-5 days.";
            btn_Request.Enabled = false;

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            HttpContext.Current.Response.Redirect("Login.aspx", true);
        }
    }
}