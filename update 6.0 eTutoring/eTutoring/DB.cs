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
   
    public class DB
    {
    }
    public class Connection_Query
    {
        
        public static string loginStatus;
        public static string ID;

        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;
        SqlConnection con;


        public void OpenObject()
        {
            con = new SqlConnection(ConnectionString);

        }

        public void OpenConnection()
        {
            con.Open();
        }


        public void CloseConnection()
        {
            con.Close();
        }


        public void ExecuteQueries(string Query_)
        {
            SqlCommand cmd = new SqlCommand(Query_, con);
            cmd.ExecuteNonQuery();
        }


        public SqlDataReader DataReader(string Query_)
        {
            SqlCommand cmd = new SqlCommand(Query_, con);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }


        public object ShowDataInGridView(string Query_)
        {
            SqlDataAdapter dr = new SqlDataAdapter(Query_, ConnectionString);
            DataSet ds = new DataSet();
            dr.Fill(ds);
            object dataum = ds.Tables[0];
            return dataum;
        }





        public object Login(string Username, string Password)
        {

            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Login where Username=@Username and Password=@Password", con);
            cmd.Parameters.AddWithValue("@Username", Username);
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
                if (Role=="Admin")
                {
                    loginStatus = Username;
                    HttpContext.Current.Response.Redirect("StudentAllocation.aspx", true);
                    
                }
                else if (Role == "Student")
                {
                    loginStatus = Username;
                    MessageBox.Show("Welcome to eTutoring System");
                    
                }
                else if(Role == "Tutor")
                {
                    loginStatus = Username;
                    HttpContext.Current.Response.Redirect("Tutor.aspx", true); 
                    
                }
                              

            }

            else
            {
                MessageBox1.Show("Wrong Username and Password");


            }
            return loginStatus;

        }

       

    }
}