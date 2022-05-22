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
using System.Data;

namespace LISP
{
    public partial class subs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
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
                SqlCommand cmd = new SqlCommand("select * from dbo.subs where uid='" + uname.ToString().Trim() + "' and pid='" + pid.ToString().Trim() + "' ;", con);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {
                    if (dr.GetValue(11).ToString() == "Unpaid")
                    {
                        cmd = new SqlCommand("update dbo.subs set flg=@flag where uid=@uname and pid=@pid ;", con);
                        cmd.Parameters.AddWithValue("@uname", uname.ToString().Trim());
                        cmd.Parameters.AddWithValue("@flag", "paid");

                        cmd.Parameters.AddWithValue("@pid", pid.ToString().Trim());
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Flag Removed');</script>");
                        GridView1.DataBind();

                    }
                    else
                    {
                        cmd = new SqlCommand("update dbo.subs set flg=@flag where uid=@uname and pid=@pid ;", con);
                        cmd.Parameters.AddWithValue("@uname", uname.ToString().Trim());
                        cmd.Parameters.AddWithValue("@flag", "Unpaid");


                        cmd.Parameters.AddWithValue("@pid", pid.ToString().Trim());
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Flag Added');</script>");
                        GridView1.DataBind();

                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }




        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            LinkButton linkButton2 = (LinkButton)sender;
            string[] arg = linkButton2.CommandArgument.Split(';');
            string uname = arg[0];
            string pid = arg[1];

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from dbo.subs where uid=@uname and pid=@pid ;", con);



                cmd.Parameters.AddWithValue("@uname", uname.ToString().Trim());

                cmd.Parameters.AddWithValue("@pid", pid.ToString().Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Subscriber Deleted');</script>");
                GridView1.DataBind();
                this.Page_Load(null, null);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void rw1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string flag = e.Row.Cells[6].Text.Trim();

                foreach (TableCell cell in e.Row.Cells)
                {
                    if (flag == "Unpaid")
                    {
                        e.Row.BackColor = System.Drawing.Color.FromName("#ff6766");
                    }
                }
            }
        }
    }
}
