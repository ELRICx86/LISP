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
using System.IO;

namespace LISP
{
    public partial class ftp_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (checkExist())
            //{
            //    Response.Write("<script>alert('ID in use, try another');</script>");
           // }
           // else
           // {
                Upload();
           // }


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


                SqlCommand cmd = new SqlCommand("select * from dbo.ftp where id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Debug.Write("Hello1");
                if (dt.Rows.Count > 0)
                {
                    Debug.Write("Hello2");

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

        void Upload()
        {
            try
            {
                string file=Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/ftp/files/" + file));
                }
                Debug.Write("Hello3");
                string imgfile = Path.GetFileName(FileUpload2.PostedFile.FileName);
                if (FileUpload1.HasFile)
                {
                    FileUpload2.SaveAs(Server.MapPath("~/ftp/img/" + imgfile));
                }
                Debug.Write("Hello4");

                string filepath = "~/ftp/files/" + file;
                string imgpath = "~/ftp/img/" + imgfile;

                FileInfo fi = new FileInfo(file);
                

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into dbo.ftp (id,title,des,type,size,flink,imglink) values(@id, @title, @des,@type, @size, @flink, @imglink)", con);


                cmd.Parameters.AddWithValue("@id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@title", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@des", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@size", fi.Length);
                cmd.Parameters.AddWithValue("@type", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@flink", filepath);
                cmd.Parameters.AddWithValue("@imglink", imgpath);
                Debug.Write("Hello5");


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Successfully Uploaded');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}