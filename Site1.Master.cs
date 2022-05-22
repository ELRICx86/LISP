using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace LISP
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pLinkButton7.Visible = false;
            pLinkButton8.Visible = true;
            pLinkButton9.Visible = true;
            pLinkButton10.Visible = false;
            pLinkButton11.Visible = false;
            pLinkButton12.Visible = false;
            pLinkButton13.Visible = false;

            try
            {
                if (Session["role"] == null)
                {

                    /* pLinkButton7.Attributes["style"] = "display:none";//package link button 
                     pLinkButton8.Attributes["style"] = "display:show";//login link button 
                     pLinkButton9.Attributes["style"] = "display:show";//signup user link button
                     pLinkButton10.Attributes["style"] = "display:none";//hello user link button
                     pLinkButton11.Attributes["style"] = "display:none";//hello admin link button
                     pLinkButton12.Attributes["style"] = "display:none";//logout link button
                    pLinkButton13.Attributes["style"] = "display:none";//Billpay link button*/

                    pLinkButton7.Visible = false;
                    pLinkButton8.Visible = true;
                    pLinkButton9.Visible = true;
                    pLinkButton10.Visible = false;
                    pLinkButton11.Visible = false;
                    pLinkButton12.Visible = false;
                    pLinkButton13.Visible = false;



                }
                else if (Session["role"].Equals("user"))
                {

                    pLinkButton7.Visible = true;
                    pLinkButton8.Visible = false;
                    pLinkButton9.Visible = false;
                    pLinkButton10.Visible = true;
                    pLinkButton11.Visible = false;
                    pLinkButton12.Visible = true;
                    pLinkButton13.Visible = true;


                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false;
                    LinkButton2.Visible = true;
                    LinkButton3.Visible = true;
                    LinkButton4.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton6.Visible = true;

                    pLinkButton7.Visible = false;
                    pLinkButton8.Visible = false;
                    pLinkButton9.Visible = false;
                    pLinkButton10.Visible = false;
                    pLinkButton11.Visible = true;
                    pLinkButton12.Visible = true;
                    pLinkButton13.Visible = false;

                }


            }
             catch (Exception ex)
            {
                throw ex;
            }   
                
            

        }
        //Admin Login button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_login.aspx",true);

        }

        //User Login
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");

        }

        //Signup button
        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        //Hello User Button
        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("hello_user.aspx");
        }

        //Hello Admin Button
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("hello_admin.aspx");
        }

        //Logout Button
        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["aid"] = "";
            Session["role"] = "none";

            this.Page_Load(null, null);


            Response.Redirect("HomePage.aspx");
        }

        //packages button
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Packages.aspx");

        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("billpay.aspx");
        }

        
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("pkg_management.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_management.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("subs.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("pending.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("payments.aspx");
        }
    }
}