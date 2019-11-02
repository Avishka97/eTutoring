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
    public partial class Admin : System.Web.UI.Page
    {
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateGridview();
            DAYTWENTYEIGHTGridview();
            iNTERACTIONGridview();
            lblHello.Text= Session["loginStatus"].ToString();

        }
           
        protected void btnRequest_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("GroupAllocation.aspx", true);
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select Name from Login where (DateTime <= GETDATE() -7 AND DateTime >= GETDATE() -28  ) AND Role='Student'", sqlCon);
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


        void DAYTWENTYEIGHTGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select Name from Login where (DateTime <= GETDATE() -28 ) AND Role='Student'", sqlCon);
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
                GridView2.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
        }

        void iNTERACTIONGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select S_Name from Student where T_ID IS NULL;", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                GridView3.DataSource = dtbl;
                GridView3.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridView3.DataSource = dtbl;
                GridView3.DataBind();
                GridView3.Rows[0].Cells.Clear();
                GridView3.Rows[0].Cells.Add(new TableCell());
                GridView3.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridView3.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridView3.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
        }
    }
}