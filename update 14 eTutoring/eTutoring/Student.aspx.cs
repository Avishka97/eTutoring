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
    public partial class Student : System.Web.UI.Page
    {
        public static int S_ID;
        public static string T_ID;
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_User.Text = "User : " + Session["loginStatus"].ToString();
            var user = Session["loginStatus"].ToString();
            CheckS_ID(user);
            lblHello.Text = user;
            string StudentID = "'" + S_ID.ToString() + "'";
            string TutorID = "'" + T_ID + "'";
            string sql1 = "SELECT  COUNT(*) FROM Message WHERE (Date_Time BETWEEN GETDATE() -7 AND GETDATE()) AND ((From_Whom = " + StudentID + " AND To_Whom =" + TutorID + ") OR (From_Whom = " + TutorID + " AND To_Whom =" + StudentID + "))";
            sevendays(sql1);
            string sql2 = "SELECT  COUNT(*) FROM Message WHERE (From_Whom = " + StudentID + " AND To_Whom =" + TutorID + ") OR (From_Whom = " + TutorID + " AND To_Whom =" + StudentID + ")";
            avgmessage(sql2);

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

        public object CheckS_ID(string Username)
        {

            try
            {
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("select S_ID,T_ID from Student where Username ='" + Username + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //Connection open here   
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                int Request = dt.Rows[0].Field<Int32>("S_ID");
                string Tutor = dt.Rows[0].Field<string>("T_ID");
                S_ID = Request;
                T_ID = Tutor;
                return S_ID;
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void sevendays(String sql)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            Int32 Row_count = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.Dispose();
            con.Close();
            lbl7days.Text = "Number of messages in last 7 days : "+Row_count.ToString();

        }
        private void avgmessage(String sql)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            Int32 Row_count = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.Dispose();
            con.Close();
            lblavgmessage.Text = "Average number of messages for each personal tutor : " + Row_count.ToString();

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            HttpContext.Current.Response.Redirect("Login.aspx", true);
        }
    }
}