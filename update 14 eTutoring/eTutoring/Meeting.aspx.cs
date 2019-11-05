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
    public partial class Meeting : System.Web.UI.Page
    {
        public static int S_ID;
        public static string T_ID;
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_User.Text = "User : " + Session["loginStatus"].ToString();
            var user = Session["loginStatus"].ToString();
            CheckS_ID(user);
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        protected void btnMeeting_Click(object sender, EventArgs e)
        {
            int StudentID = S_ID;
            int TutorID = Convert.ToInt32(T_ID);
            string Venue = "'" + txtVenue.Text + "'";
            string Meeting = "'" + txtMeeting.Text + "'";
            string Date = "'" + picker.Text + "'";


            Connection_Query Database = new Connection_Query();
            Database.OpenObject();
            Database.OpenConnection();
            Database.ExecuteQueries("INSERT INTO Meeting(S_ID, T_ID, Date_Time, Venue, Meeting) VALUES(" + StudentID + ", " + TutorID + "," + Date + "," + Venue + ","+ Meeting + ")");
            Database.CloseConnection();
            PopulateGridview();

            txtMeeting.Text = "";
            txtVenue.Text = "";
            picker.Text = "";


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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "Delete from Meeting where M_ID = @M_ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@M_ID", (GridView1.Rows[e.RowIndex].FindControl("lblMeetingNo") as Label).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    PopulateGridview();
                    lblmessage2.Text = "Canceled the meeting";
                    lblerrormessage2.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblmessage2.Text = "";
                lblerrormessage2.Text = ex.Message;
            }
        }



        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select M_ID, Date_Time, Venue, Meeting, T_Approved, Remarks from Meeting where S_ID = " + S_ID + "", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "No Uploads Found ..!";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            HttpContext.Current.Response.Redirect("Login.aspx", true);
        }
    }
}