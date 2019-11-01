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





    

       

    }
}