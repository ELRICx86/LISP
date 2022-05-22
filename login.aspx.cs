using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LISP
{
    public partial class login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from dbo.signup where uname='"+textbox1.Text.Trim()+"' and password='"+textbox2.Text.Trim()+"';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();

                
                if (dr.HasRows)
                {

                    

                    HttpCookie cookie = Request.Cookies["userinfo"];
                    if (cookie != null)
                    {
                        textbox1.Text = cookie["name"];
                        textbox2.Text = cookie["password"];
                    }

                    Response.Write("<script>alert('welcome " + dr.GetValue(0).ToString() + "');</script>");
                        Session["username"]=dr.GetValue(8).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        dr.Close();
                        Response.Redirect("HomePage.aspx");
                    
                    
                    
                   
                }
                else
                {
                    Response.Write("<script>alert('Invalid user');</script>");
                }
                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }
    }
}