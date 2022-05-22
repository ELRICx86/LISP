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
    public partial class billpay : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
                SqlDataSource sqlData = new SqlDataSource();
                sqlData.ConnectionString = strcon;
                sqlData.ID = "SqlDataSource1";
                this.Page.Controls.Add(sqlData);
                sqlData.SelectCommand = "SELECT * FROM [subs] where uid='"+Session["username"]+"'";

                GridView1.DataSource = sqlData;
                GridView1.DataBind();

            
            

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text == "Bkash")
            {
                Image1.Visible = true;
                Image2.Visible = false;
            }
            if (DropDownList1.SelectedItem.Text == "Rocket")
            {
                Image2.Visible = true;
                Image1.Visible = false;
            }
            if (DropDownList1.SelectedItem.Text == "Nagad")
            {
                Image2.Visible = true;
                Image1.Visible = false;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            string[] arg = linkButton.CommandArgument.Split(';');
            string pkgid = arg[0];
            string pkg_amount = arg[1];
            Label6.Text = pkg_amount;
            Label7.Text = pkgid;
            Button1.Visible = true;
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

                SqlCommand cmd = new SqlCommand("delete from dbo.subs where uid=@uname and pid=@pid ;", con);



                cmd.Parameters.AddWithValue("@uname", uname.ToString().Trim());

                cmd.Parameters.AddWithValue("@pid", pid.ToString().Trim());


                cmd.ExecuteNonQuery();
                con.Close();
               Response.Write("<script>alert('Subscription Canceled');</script>");
                GridView1.DataBind();
                this.Page_Load(null, null);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //pay button
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }



                SqlCommand cmd1 = new SqlCommand("select * from dbo.subs where uid='" + Session["username"] + "' and pid='" + Label7.Text.Trim() + "' ;", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                dr.Read();


                if (dr.HasRows)
                {
                    SqlCommand cmd = new SqlCommand("insert into dbo.payment (uid, uname, pid, pkg_amount,pay_method, pay_no, tran_no, date, paid) values(@uid, @uname, @pid, @pkg_amount,@pay_method, @pay_no, @tran_no, @date, @paid)", con);
                    cmd.Parameters.AddWithValue("@uid", Session["username"].ToString().Trim());
                    cmd.Parameters.AddWithValue("@uname", dr.GetValue(2).ToString().Trim());
                    cmd.Parameters.AddWithValue("@pid", Label7.Text.Trim());
                    cmd.Parameters.AddWithValue("@pkg_amount", dr.GetValue(4).ToString().Trim());
                    cmd.Parameters.AddWithValue("@pay_method", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@pay_no", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@tran_no", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@paid", Label6.Text.Trim());

                    Button1.Visible = false;
                    Label6.Text = "";
                    TextBox1.Text = "";
                    TextBox2.Text = "";

                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Payment Successfull');</script>");
                    cmd = new SqlCommand("select * from dbo.subs where uid='" + Session["username"].ToString().Trim() + "' and pid='" + Label7.Text.ToString().Trim() + "' ;", con);
                    SqlDataReader dr1 = cmd.ExecuteReader();
                    dr1.Read();
                    if (dr.HasRows)
                    {
                        cmd = new SqlCommand("update dbo.subs set flg=@flag where uid=@uname and pid=@pid ;", con);
                        cmd.Parameters.AddWithValue("@uname", Session["username"].ToString().Trim());
                        cmd.Parameters.AddWithValue("@flag", "paid");

                        cmd.Parameters.AddWithValue("@pid", Label7.Text.ToString().Trim());
                        cmd.ExecuteNonQuery();
                        con.Close();
                        GridView1.DataBind();
                        this.Page_Load(null, null);
                    }


                }
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
                string flag = e.Row.Cells[4].Text.Trim();

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