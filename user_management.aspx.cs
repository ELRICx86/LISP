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
    public partial class user_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


            
            
            if (!IsPostBack)
            {
                textbox1.Text = "";
                textbox3.Text = "";
                textbox4.Text = "";
                textbox5.Text = "";
                textbox6.Text = "";

                textbox7.Text = "";
                textbox8.Text = "";
                textbox9.Text = "";
                Button1.Visible = false;        
                
            }
            SqlDataSource sqlData = new SqlDataSource();
            sqlData.ConnectionString = strcon;
            sqlData.ID = "SqlDataSource1";
            this.Page.Controls.Add(sqlData);
            sqlData.SelectCommand = "SELECT * FROM [subs] where uid='" + textbox2.Text.Trim() + "'";

            GridView1.DataSource = sqlData;

        }

        //Search User
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                

                SqlCommand cmd = new SqlCommand("select * from dbo.signup where uname='" + textbox2.Text.ToString().Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();

                



                textbox1.Text = dr.GetValue(8).ToString();
                textbox3.Text = dr.GetValue(0).ToString();
                textbox4.Text = dr.GetValue(1).ToString();
                textbox5.Text = dr.GetValue(2).ToString();
                textbox6.Text = dr.GetValue(3).ToString();
                DropDownList1.Text = dr.GetValue(4).ToString();
                textbox7.Text = dr.GetValue(5).ToString();
                textbox8.Text = dr.GetValue(6).ToString();
                textbox9.Text = dr.GetValue(7).ToString();

                dr.Close();
                con.Close();
                Button1.Visible = true;
                GridView1.DataBind();
                


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('User Data dont exist');</script>");
                textbox1.Text = "";
                textbox3.Text = "";
                textbox4.Text = "";
                textbox5.Text = "";
                textbox6.Text = "";

                textbox7.Text = "";
                textbox8.Text = "";
                textbox9.Text = "";
                Button1.Visible = false;
                GridView1.DataBind();

            }

        }

        //Delete User Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from dbo.signup where uname=@id", con);

                SqlCommand cmd1 = new SqlCommand("delete from dbo.subs where uid=@id", con);


                cmd.Parameters.AddWithValue("@id", textbox2.Text.Trim());


                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                con.Close();
               

                Response.Write("<script>alert('Successfully deleted from database');</script>");
                textbox1.Text = "";
                textbox2.Text = "";
                textbox3.Text = "";
                textbox4.Text = "";
                textbox5.Text = "";
                textbox6.Text = "";

                textbox7.Text = "";
                textbox8.Text = "";
                textbox9.Text = "";
                Button1.Visible = false;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }
    }
}