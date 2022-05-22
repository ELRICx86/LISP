using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LISP
{
    public partial class pkg_management : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button3.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            Button6.Visible = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;
            TextBox4.Enabled = false;
            TextBox5.Enabled = false;
            TextBox6.Enabled = false;
            TextBox7.Enabled = false;
            Label3.Text = "";
            Label4.Text = "";
            GridView1.DataBind();

        }
        //Add button click event
        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Enabled = true;
            TextBox2.Enabled = true;
            TextBox3.Enabled = true;
            TextBox4.Enabled = true;
            TextBox5.Enabled = true;
            TextBox6.Enabled = true;
            TextBox7.Enabled = true;
            Button1.Visible = false;
            Button2.Visible = false;
            Button3.Visible = true;
            Button4.Visible = false;
            Button5.Visible = false;
            Button6.Visible = true;
            Label4.Text = "New Blank Form added ";
            Label3.Text = "";

        }


        //Cancel Button event

        protected void Button6_Click(object sender, EventArgs e)
        {
            Button1.Visible = true;
            Button2.Visible = true;
            Button3.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            Button6.Visible = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;
            TextBox4.Enabled = false;
            Label3.Text = "";
            Label4.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }

        //Save button click event
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from dbo.pkg where id=@id", con);
                cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                
                {
                    Response.Write("<script>alert('User ID in use');</script>");
                    Button1.Visible = true;
                    Button2.Visible = true;
                    Button6.Visible = false;
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    con.Close();
                    dr.Close();
                }


                else
                {
                    cmd = new SqlCommand("insert into dbo.pkg (id,pkg_amount,ip_type,bdix,server,games,tbd,price) values(@id, @amount,@ip, @bdix, @server,@games,@tbd,@price)", con);


                    cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@amount", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@ip", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@bdix", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@server", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@games", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@tbd", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@price", TextBox7.Text.Trim());


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Button1.Visible = true;
                    Button2.Visible = true;
                    Button6.Visible = false;
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";

                    Response.Write("<script>alert('Successfully inserted into database');</script>");
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        //Update button clickevent
        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update dbo.pkg set pkg_amount=@amount,ip_type=@ip,bdix=@bdix,server=@server,games=@games,tbd=@tbd,price=@price where id=@id", con);


                cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@amount", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@ip", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@bdix", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@server", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@games", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@tbd", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@price", TextBox7.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Button1.Visible = true;
                Button2.Visible = true;
                Button6.Visible = false;
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";

                Response.Write("<script>alert('Successfully Updated in database');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }


        //Delete Button clickevent
        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from dbo.pkg where id=@id", con);


                cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Button1.Visible = true;
                Button2.Visible = true;
                Button6.Visible = false;
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";

                Response.Write("<script>alert('Successfully deleted from database');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        //Search button clickevent
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from dbo.pkg where id=@id", con);
                cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {

                    Button1.Visible = false;
                    Button2.Visible = false;
                    Button3.Visible = false;
                    Button4.Visible = true;
                    Button5.Visible = true;
                    Button6.Visible = true;
                    TextBox1.Enabled = true;
                    TextBox2.Enabled = true;
                    TextBox3.Enabled = true;
                    TextBox4.Enabled = true;
                    TextBox5.Enabled = true;
                    TextBox6.Enabled = true;
                    TextBox7.Enabled = true;
                    TextBox1.Text = dr.GetValue(0).ToString();
                    TextBox2.Text = dr.GetValue(1).ToString();
                    DropDownList1.Text = dr.GetValue(2).ToString();
                    TextBox3.Text = dr.GetValue(3).ToString();
                    TextBox4.Text = dr.GetValue(4).ToString();
                    TextBox5.Text = dr.GetValue(5).ToString();
                    TextBox6.Text = dr.GetValue(6).ToString();
                    TextBox7.Text = dr.GetValue(7).ToString();

                    Response.Write("<script>alert('Package found in  database');</script>");


                }
                else
                {
                    Response.Write("<script>alert('Package doesnot exist in database');</script>");

                }






            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}






