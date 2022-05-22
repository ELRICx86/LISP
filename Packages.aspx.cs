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
    public partial class Packages : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string pkg_id = Convert.ToString((sender as LinkButton).CommandArgument);


            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                
                SqlCommand cmd = new SqlCommand("select * from dbo.subs where uid='" + Session["username"] + "' and pid='" + pkg_id + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                cmd = new SqlCommand("select * from dbo.pending where uid='" + Session["username"] + "' and pid='" + pkg_id + "';", con);
                SqlDataReader dr2 = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {
                    Response.Write("<script>alert('Already subscribed to this package');</script>");
                    dr.Close();
                    con.Close();
                }
                else if (dr2.HasRows)
                {
                    Response.Write("<script>alert('Package is pending');</script>");
                    dr2.Close();
                    con.Close();
                }

                else
                {

                     cmd = new SqlCommand("insert into dbo.pending(uid,uname,phone,pid,amount,type,price) select u.uname,u.full_name,u.contact_no,p.id,p.pkg_amount,p.ip_type,p.price from dbo.signup u,dbo.pkg p where u.uname=@uname and p.id=@pid", con);



                    cmd.Parameters.AddWithValue("@uname", Session["username"].ToString().Trim());

                    cmd.Parameters.AddWithValue("@pid", pkg_id.Trim());


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Package submitted for Validation');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
