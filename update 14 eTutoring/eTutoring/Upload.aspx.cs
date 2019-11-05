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
    public partial class Upload : System.Web.UI.Page
    {
        public static int S_ID;
        public static string T_ID;
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserdropdownlist.Text = Session["loginStatus"].ToString();
            lbl_User.Text = "User : " + Session["loginStatus"].ToString();
            var user = Session["loginStatus"].ToString();


            CheckS_ID(user);
            if (!IsPostBack)
            {
                PopulateGridview();
                CommentGridview();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            
            string FileName = "'"+FileUpload1.FileName.ToString()+ "'";
            string FilePath = "'" + "/Uploads/" + FileUpload1.FileName.ToString()+ "'" ;
            int StudentID = S_ID;
            DateTime Date = DateTime.Now;

            Connection_Query Database = new Connection_Query();
            Database.OpenObject();
            Database.OpenConnection();
            Database.ExecuteQueries("INSERT INTO Article(S_ID, Date_Time, Article, Article_Path) VALUES(" + StudentID + ",' " + Date + "'," + FileName + "," + FilePath + ")");
            Database.CloseConnection();
            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/Uploads/" + FileUpload1.FileName.ToString());
            PopulateGridview();


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
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select A_ID, Date_Time, Article, Article_Path from Article where S_ID = "+ S_ID + "", sqlCon);
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "Delete from Article where A_ID = @A_ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@A_ID", (GridView1.Rows[e.RowIndex].FindControl("lblANo") as Label).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;                   
                    PopulateGridview();
                    lblSuccessMessage.Text = "Article Removed";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "Delete from Comment where C_ID = @C_ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@C_ID", (GridView2.Rows[e.RowIndex].FindControl("lblCNo") as Label).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridView2.EditIndex = -1;
                    CommentGridview();
                    lblmessage2.Text = "Comment Removed";
                    lblerrormessage2.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblmessage2.Text = "";
                lblerrormessage2.Text = ex.Message;
            }
        }

        void CommentGridview()
        {
            DataTable dtbl1 = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa1 = new SqlDataAdapter("select C_ID, A_ID, Comment from Comment where S_ID = " + S_ID + "", sqlCon);
                sqlDa1.Fill(dtbl1);
            }
            if (dtbl1.Rows.Count > 0)
            {
                GridView2.DataSource = dtbl1;
                GridView2.DataBind();
            }
            else
            {
                dtbl1.Rows.Add(dtbl1.NewRow());
                GridView2.DataSource = dtbl1;
                GridView2.DataBind();
                GridView2.Rows[0].Cells.Clear();
                GridView2.Rows[0].Cells.Add(new TableCell());
                GridView2.Rows[0].Cells[0].ColumnSpan = dtbl1.Columns.Count;
                GridView2.Rows[0].Cells[0].Text = "No Comments Found ..!";
                GridView2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            int StudentID = S_ID;
            int TutorID = Convert.ToInt32(T_ID);
            int ArticleID = Convert.ToInt32(DropDownList1.Text);
            string Comment = "'" + txtComment.Text + "'";
           

            Connection_Query Database = new Connection_Query();
            Database.OpenObject();
            Database.OpenConnection();
            Database.ExecuteQueries("INSERT INTO Comment(A_ID, S_ID, T_ID, Comment) VALUES(" + ArticleID + ",' " + StudentID + "'," + TutorID + "," + Comment + ")");
            Database.CloseConnection();
            CommentGridview();

            txtComment.Text = "";
            DropDownList1.ClearSelection();
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            HttpContext.Current.Response.Redirect("Login.aspx", true);
        }
    }
}