using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace eTutoring
{
    public partial class StudentAllocation : System.Web.UI.Page
    {
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select S_ID, S_Name, T_ID from Student where Request = '1'", sqlCon);
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
                GridView1.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            PopulateGridview();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE Student SET T_ID = @T_ID WHERE S_ID = @S_ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@T_ID", (GridView1.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@S_ID", (GridView1.Rows[e.RowIndex].FindControl("lblENo") as Label).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    PopulateGridview();
                    sqlCon.Close();
                    lblSuccessMessage.Text = "Tutor Assigned";
                    lblErrorMessage.Text = "";

                    query = "select Email from Student where S_ID=@S_ID";
                    SqlCommand sqlCmd2 = new SqlCommand(query, sqlCon);
                    sqlCmd2.Parameters.AddWithValue("@S_ID", (GridView1.Rows[e.RowIndex].FindControl("lblSNo") as Label).Text.Trim());
                    SqlDataAdapter sda = new SqlDataAdapter(sqlCmd2);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    //Connection open here   
                    sqlCon.Open();
                    int i = sqlCmd2.ExecuteNonQuery();
                    sqlCon.Close();
                    string mail = dt.Rows[0].Field<string>("Email");
                    email(mail);


                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    string T_ID = "";
                    sqlCon.Open();
                    string query = "UPDATE Student SET T_ID ='"+T_ID+"' WHERE S_ID = @S_ID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@S_ID", (GridView1.Rows[e.RowIndex].FindControl("lblSNo") as Label).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    PopulateGridview();
                    lblSuccessMessage.Text = "Tutor Removed";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
        }

    
    private void email(String email)
        {

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential("p.d.a.l.wickramasinghe@gmail.com", "avi123456");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            MailMessage mailMessage = new MailMessage("p.d.a.l.wickramasinghe@gmail.com", email);
            mailMessage.Subject = "Appointing a Tutor";
            mailMessage.Body = "We assign your tutor, Please login in to see";

            try
            {
                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMessage);
                Label1.Text = "Message sent";
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.ToString();
            }
        }

    protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

      



    }
}