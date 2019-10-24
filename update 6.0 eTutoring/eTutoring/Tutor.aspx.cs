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
    public partial class Tutor : System.Web.UI.Page
    {
        public static int S_ID;
        public static int T_ID;
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_User.Text = "User : " + Connection_Query.loginStatus;
            var user = Connection_Query.loginStatus;
            CheckS_ID(user);
            LabelUsername.Text = T_ID.ToString(); 
            if (!IsPostBack)
            {
                PopulateGridview();
                MeetingGridview();
            }
            
        }

        protected void btnMessage_Click(object sender, ImageClickEventArgs e)
        {
            string StudentID = "'" + S_ID + "'";
            string TutorID = "'" + T_ID + "'";
            string Message = "'" + txtMessage.Text + "'";
            DateTime Date = DateTime.Now;
            string MessageOwner = "'" + Connection_Query.loginStatus + "'";


            Connection_Query Database = new Connection_Query();
            Database.OpenObject();
            Database.OpenConnection();
            Database.ExecuteQueries("INSERT INTO Message(Date_Time, To_Whom, From_Whom, Message, Sender) VALUES('" + Date + "', " + StudentID + "," + TutorID + "," + Message + "," + MessageOwner + ")");
            Database.CloseConnection();
            PopulateGridview();

            txtMessage.Text = "";
        }
        public object CheckS_ID(string Username)
        {

            try
            {
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("select T_ID from Tutor where Username ='" + Username + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //Connection open here   
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                int Tutor = dt.Rows[0].Field<Int32>("T_ID");
                T_ID = Tutor;
                return T_ID;
            }
            catch (Exception)
            {

                throw;
            }
        }

        void PopulateGridview()
        {
            
            string StudentID = "'" + S_ID + "'";
            string TutorID = "'" + T_ID + "'";
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select M_ID, Date_Time, Sender, Message from Message where (From_Whom = " + StudentID + " AND To_Whom =" + TutorID + ") OR (From_Whom = " + TutorID + " AND To_Whom =" + StudentID + ")", sqlCon);
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
                GridView1.Rows[0].Cells[0].Text = "No Message Found ..!";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }

        }
               

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            S_ID = Convert.ToInt32(DropDownList1.SelectedValue);
            PopulateGridview();
            MeetingGridview();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            S_ID = Convert.ToInt32(DropDownList1.SelectedValue);
            PopulateGridview();
        }


        void MeetingGridview()
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
                GridView2.DataSource = dtbl;
                GridView2.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView2.DataSource = dtbl;
                GridView2.DataBind();
                GridView2.Rows[0].Cells.Clear();
                GridView2.Rows[0].Cells.Add(new TableCell());
                GridView2.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView2.Rows[0].Cells[0].Text = "No Uploads Found ..!";
                GridView2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
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
            Database.ExecuteQueries("INSERT INTO Meeting(S_ID, T_ID, Date_Time, Venue, Meeting) VALUES(" + StudentID + ", " + TutorID + "," + Date + "," + Venue + "," + Meeting + ")");
            Database.CloseConnection();
            MeetingGridview();

            txtMeeting.Text = "";
            txtVenue.Text = "";
            picker.Text = "";
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            MeetingGridview();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            MeetingGridview();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE Meeting SET T_Approved = @T_Approved, Remarks =@Remarks WHERE M_ID = @M_ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@T_Approved", (GridView2.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Remarks", (GridView2.Rows[e.RowIndex].FindControl("txtRemark") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@M_ID", (GridView2.Rows[e.RowIndex].FindControl("lblMeetingNo2") as Label).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridView2.EditIndex = -1;
                    MeetingGridview();
                    sqlCon.Close();
                    lblmessage2.Text = "Meeting Updated";
                    lblerrormessage2.Text = "";

                }
            }
            catch (Exception ex)
            {
                lblmessage2.Text = "";
                lblerrormessage2.Text = ex.Message;
            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "Delete from Meeting where M_ID = @M_ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@M_ID", (GridView2.Rows[e.RowIndex].FindControl("lblMeetingNo") as Label).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridView2.EditIndex = -1;
                    MeetingGridview();
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
    }
}