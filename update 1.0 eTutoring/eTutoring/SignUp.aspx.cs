using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eTutoring
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string Name = "'" + txtSName.Text + "'";
            string Username = "'" + txtUsername.Text + "'";
            string Email = "'" + txtemail.Text + "'";
            string Password = "'" + txtPassword.Text + "'";
            string CPassword = "'" + txtCpassword.Text + "'";
            string Role = "'" + DropDownList_Role.Text + "'";

            if (Password == CPassword)
            {
                Connection_Query Database = new Connection_Query();
                Database.OpenObject();
                Database.OpenConnection();
                Database.ExecuteQueries("INSERT INTO Login(Name, Username, Password, Role) VALUES(" + Name + ", " + Username + "," + Password + "," + Role + ")");
                Database.CloseConnection();

                if (Role == "'Student'")
                {
                    Database.OpenObject();
                    Database.OpenConnection();
                    Database.ExecuteQueries("INSERT INTO Student(S_Name, Username, Email, Password) VALUES(" + Name + ", " + Username + "," + Email + "," + Password + ")");
                    Database.CloseConnection();
                    MessageBoxCommon.MessageBox.Show("Successfully add the new Customer");

                }
                else if (Role == "'Tutor'")
                {
                    Database.OpenObject();
                    Database.OpenConnection();
                    Database.ExecuteQueries("INSERT INTO Tutor(T_Name, Username, Email, Password) VALUES(" + Name + ", " + Username + "," + Email + "," + Password + ")");
                    Database.CloseConnection();
                    MessageBoxCommon.MessageBox.Show("Successfully add the new Customer");
                }
                

                txtSName.Text = "";
                txtUsername.Text = "";
                txtemail.Text = "";
                txtPassword.Text = "";
                txtCpassword.Text = "";
                DropDownList_Role.Text = "Student";
            }
            else
            {
                MessageBox2.Show("Wrong Username and Password");
            }          

            

        }
    }
}