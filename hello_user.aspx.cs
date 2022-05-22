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
    public partial class hello_user : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            textbox3.ReadOnly = true;
            textbox4.ReadOnly = true;
            textbox5.ReadOnly = true;
            textbox6.ReadOnly = true;
            DropDownList1.Enabled = false;
            textbox7.ReadOnly = true;
            textbox8.ReadOnly = true;
            textbox9.ReadOnly = true;
            Button1.Visible = true;
            Button4.Visible = false;
            Button5.Visible = false;

            if (!IsPostBack)
            {

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    Session["username"] = "usr1";

                    SqlCommand cmd = new SqlCommand("select * from dbo.signup where uname='" + Session["username"].ToString().Trim() + "'", con);

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


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
            }
        }

        //update profile

        protected void Button1_Click(object sender, EventArgs e)
        {
            textbox3.ReadOnly = false;
            textbox4.ReadOnly = false;
            textbox5.ReadOnly = false;
            textbox6.ReadOnly = false;
            DropDownList1.Enabled = true;
            textbox7.ReadOnly = false;
            textbox8.ReadOnly = false;
            textbox9.ReadOnly = false;
            Button1.Visible = false;
            Button4.Visible = true;
            Button5.Visible = true;

        }

        //save profile
        protected void Button4_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }



                SqlCommand cmd = new SqlCommand("update dbo.signup set full_name=@fname, dob=@dob, contact_no=@contact_no, email=@email, div=@div, dist=@dist, zipcode=@zipcode, full_address=@full_address where uname=@uname", con);

                cmd.Parameters.AddWithValue("@uname", textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@fname", textbox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", textbox5.Text.Trim());
                cmd.Parameters.AddWithValue("@email", textbox6.Text.Trim());
                cmd.Parameters.AddWithValue("@div", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@dist", textbox7.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", textbox8.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", textbox9.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();



                Response.Write("<script>alert('Successfully updated into databse');</script>");
                this.Page_Load(null, null);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        //cancel button
        protected void Button5_Click(object sender, EventArgs e)
        {
            this.Page_Load(null, null);

        }

        //change password button
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                

                    SqlCommand cmd = new SqlCommand("select * from dbo.signup where uname='" + Session["username"].ToString().Trim() + "'", con);

                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                
                    if (TextBox11.Text.ToString().Trim()==dr.GetValue(9).ToString().Trim())
                    {
                        if(TextBox13.Text.ToString().Trim() == TextBox14.Text.ToString().Trim())
                        {
                        
                        SqlCommand cmd1 = new SqlCommand("update dbo.signup set password=@ps where uname=@uname", con);

                        cmd1.Parameters.AddWithValue("@uname",dr.GetValue(8).ToString().Trim());
                        cmd1.Parameters.AddWithValue("@ps", TextBox13.Text.Trim());

                        cmd1.ExecuteNonQuery();
                        con.Close();
                        Label1.Text = "Password Successfully changed";
                        
                        }
                        else
                        {
                        Label1.Text = "New password and Confirm password dont match";
                    }
                    }
                else
                {
                    Label1.Text = "Wrong Old Password";

                }

                }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}