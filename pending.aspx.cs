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
    public partial class pending : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LinkButton  linkButton =(LinkButton)sender;
            string[] arg = linkButton.CommandArgument.Split(';');
            string uname = arg[0];
            string pid = arg[1];

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into dbo.subs(uid,pid,uname,phone,pkg_amount,ip_type,bdix,server,games,tbd,price) select u.uname,p.id,u.full_name,u.contact_no,p.pkg_amount,p.ip_type,p.bdix,p.server,p.games,p.tbd,p.price from dbo.signup u,dbo.pkg p where u.uname=@uname and p.id=@pid", con);

                

                cmd.Parameters.AddWithValue("@uname", uname.ToString().Trim());

                cmd.Parameters.AddWithValue("@pid", pid.ToString().Trim());




                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("delete from dbo.pending where uid=@uname and pid=@pid ;", con);



                cmd.Parameters.AddWithValue("@uname", uname.ToString().Trim());

                cmd.Parameters.AddWithValue("@pid", pid.ToString().Trim());


                cmd.ExecuteNonQuery();
                
                GridView1.DataBind();
                con.Close();
                
                Response.Write("<script>alert('Subscription Added');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton linkButton1 = (LinkButton)sender;
            string[] arg = linkButton1.CommandArgument.Split(';');
            string uname = arg[0];
            string pid = arg[1];

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from dbo.pending where uid=@uname and pid=@pid ;", con) ;



                cmd.Parameters.AddWithValue("@uname", uname.ToString().Trim());

                cmd.Parameters.AddWithValue("@pid", pid.ToString().Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Subscription Canceled');</script>");
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}