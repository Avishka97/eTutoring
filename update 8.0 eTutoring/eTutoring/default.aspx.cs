using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace eTutoring
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            BindBlog();
        }

        void BindBlog()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from BlogPost order by BlogDate desc ", con);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                cmd.Dispose();
            }
            catch (Exception k)
            {
                Response.Write(k.Message);
                //throw;
            }
            finally
            {
                con.Close();
            }

        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("write.aspx", true);
        }
    }
}