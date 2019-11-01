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
    public partial class Message : System.Web.UI.Page
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

        protected void btnMessage_Click(object sender, ImageClickEventArgs e)
        {
            string StudentID = "'" + S_ID.ToString() + "'";
            string TutorID = "'" + T_ID + "'";
            string Message = "'" + txtMessage.Text + "'";
            DateTime Date = DateTime.Now;
            string MessageOwner = "'" + Session["loginStatus"].ToString() + "'";


            Connection_Query Database = new Connection_Query();
            Database.OpenObject();
            Database.OpenConnection();
            Database.ExecuteQueries("INSERT INTO Message(Date_Time, To_Whom, From_Whom, Message, Sender) VALUES('" + Date + "', " + TutorID + "," + StudentID + "," + Message + ","+ MessageOwner + ")");
            Database.CloseConnection();
            PopulateGridview();

            txtMessage.Text = "";

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


        void PopulateGridview()
        {
            string StudentID = "'" + S_ID.ToString() + "'";
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

        protected void Timer1_Tick(object sender, EventArgs e)
        {
           
            PopulateGridview();
        }
    }
}