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
    public partial class hello_admin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Check
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("select * from dbo.admin_login where admin_id='" +Session["aid"].ToString().Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();

                if (TextBox1.Text.ToString().Trim() == dr.GetValue(0).ToString().Trim())
                {
                    if (TextBox2.Text.ToString().Trim() == dr.GetValue(1).ToString().Trim())
                    {

                        old_pass.Visible = false;
                        new_pass.Visible = true;

                    }
                    else
                    {
                        Label3.Text = "Password dont match";
                    }
                }
                else
                {
                    Label3.Text = "Wrong admin id";

                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        //Change
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd1 = new SqlCommand("update dbo.admin_login set admin_id=@ad password=@ps", con);

                cmd1.Parameters.AddWithValue("@ad", TextBox3.Text.ToString().Trim());
                cmd1.Parameters.AddWithValue("@ps", TextBox4.Text.ToString().Trim());

                cmd1.ExecuteNonQuery();
                con.Close();
                Label3.Text = "Password Successfully changed";
                

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            }
    }
}