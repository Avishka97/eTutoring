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

namespace eTutoring
{
    public partial class Login : System.Web.UI.Page
    {
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String username = txtUsername.Text;
            String Password = txtPassword.Text;

            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Login where Username=@Username and Password=@Password", con);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", Password);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            //Connection open here   
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                var Role = dt.Rows[0].Field<string>("Role");
                if (Role == "Admin")
                {
                    Session["loginStatus"] = username;
                    HttpContext.Current.Response.Redirect("StudentAllocation.aspx", true);

                }
                else if (Role == "Student")
                {
                    Session["loginStatus"] = username;
                    MessageBox.Show("Welcome to eTutoring System");

                }
                else if (Role == "Tutor")
                {
                    Session["loginStatus"] = username;
                    HttpContext.Current.Response.Redirect("Tutor.aspx", true);

                }


            }

            else
            {
                MessageBox1.Show("Wrong Username and Password");


            }

        }





    }
}