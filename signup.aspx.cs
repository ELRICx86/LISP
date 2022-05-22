using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace LISP
{
    public partial class signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Signup button click event

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (checkExist())
            {
                
                Response.Write("<script>alert('User Name Taken, try another');</script>");
            }
            else
            {
                SignUp();
            }
            HttpCookie cookie = new HttpCookie("userinfo");
            cookie["name"] = textbox1.Text;
            cookie["password"] = textbox2.Text;
            Response.Cookies.Add(cookie);

        }


        bool checkExist()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                

                SqlCommand cmd = new SqlCommand("select * from dbo.signup where uname='" + textbox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            return false;
        }



        void SignUp()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into dbo.signup (full_name, dob, contact_no, email, div, dist, zipcode, full_address, uname, password) values(@full_name, @dob, @contact_no, @email, @div, @dist, @zipcode, @full_address, @uname, @password)", con);


                cmd.Parameters.AddWithValue("@full_name", textbox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", textbox5.Text.Trim());
                cmd.Parameters.AddWithValue("@email", textbox6.Text.Trim());
                cmd.Parameters.AddWithValue("@div", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@dist", textbox9.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", textbox8.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", textbox7.Text.Trim());
                cmd.Parameters.AddWithValue("@uname", textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@password", textbox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}
