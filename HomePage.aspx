<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LISP.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-box">
        <h1>Best Internet Service Provider</h1>
        <p>
            We Provide Internet Service All Over Bangladesh.<br/>
            We Have Reached All the districts and providing Our facilities all over the Country.
        </p>
        <a href="signup.aspx" class="hero-btn">Join Us</a>
    </div>

    <!-- Course -->

    <section class="course">
        <h1>Services We Offer</h1>
        <p>These Are The Top Services we are providing all over Bangladesh.</p>

        <div class="row">
            <div class="course-col">
                <h3>Internet Service</h3>
                <p>
                    We provide high speed internet connection with good stability in cheap price.
                </p>
            </div>

            <div class="course-col">
                <h3>Cached Server</h3>
                <p>
                    We Have Cached youtube and facebook in our servers.We also provide cached speed for Games Like PUBG and valorant.
                </p>
            </div>

            <div class="course-col">
                <h3>Torrent</h3>
                <p>
                   Pirate Bay , TorrentBD and CrazyHD are our Partner.We give dedicated speed to these Torrent Clients.
                </p>
            </div>
        </div>
    </section>

    <!-------- Partners----- -->
    <section class="campus">
        <h1>Our Global Partners</h1>
        <p>We have partnered with the global Giants to give our use the Best Experience.We are working to be partnered with more Companies !</p>

        <div class="row">

            <div class="campus-col">
                <img src="imgs/pubg2.png" alt=""/>
                <div class="layer">
                    <h3>LINK 3</h3>
                </div>
            </div>

            <div class="campus-col">
                <img src="imgs/pira.png" alt=""/>
                <div class="layer">
                    <h3>Pirate Bay</h3>
                </div>
            </div>

            <div class="campus-col">
                <img src="imgs/valo.png" alt=""/>
                <div class="layer">
                    <h3>Valorant</h3>
                </div>
            </div>

        </div>


    </section>

    <section class="contact">
        <h3>Get In Touch With Us</h3>
        <h2>Contact us</h2>
        <div class="row">

            <div class="contact-col">
                <div class="line">
                    <p class="text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde vel provident tenetur nesciunt libero dolor!</p>
                </div>

                <div class="contact-body">
                    <div class="contact-info">
                        <span><i class="fas fa-mobile-alt"></i></span>
                        <span>Phone No</span>
                        <span class="text">017xxxxx</span>
                    </div>

                    <div class="contact-info">
                        <span><i class="fas fa-envelope-open"></i></span>
                        <span>Email</span>
                        <span class="text">mail@company.com</span>
                    </div>

                    <div class="contact-info">
                        <span><i class="fas fa-map-marker-alt"></i></span>
                        <span>Address</span>
                        <span class="text">BSMRH,fulbarigate,Khulna.</span>
                    </div>

                    <div class="contact-info">
                        <span><i class="fas fa-clock"></i></span>
                        <span>Opening Hours</span>
                        <span class="text">Monday - Friday (8.00 am to 5.00 pm)</span>
                    </div>
                </div>

            </div>




            <div class="contact-col">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3675.4164801648485!2d89.49984311425621!3d22.89800438501623!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ff9bda0d06e2db%3A0x48756df2b6f303d8!2sBangabandhu%20Sheikh%20Mujibur%20Rahman%20Hall!5e0
            !3m2!1sen!2sbd!4v1637901456276!5m2!1sen!2sbd"
                    width="120%" height="600"
                    style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
        
    </section>

</asp:Content>
