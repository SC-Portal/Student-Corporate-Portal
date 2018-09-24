<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <marquee behavior="alternate" color ="red"><h1>Student - Corporate Portal</h1></marquee>
       <marquee direction="up" scrollamount="2"> <p class="lead">To bring the students and corporates together, we aim to develop a website with the help of sponsorship from the corporate world. The single most important objective of this website would be to allow the corporate to post about the various opportunities for students on a temporary basis. At the same time, the students would be able to view these opportunities and express their interest in working on the requirements as listed by the corporates. These aspects would provide a direct interface between the corporates and the students. To ensure that only applicable candidates are able to view and apply for the opportunities, the access to the website shall be restricted to university campus.</p></marquee>

       
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Administrator</h2>
            <p>
                The default user of the web site. The administrator has the following functionalities.The Administrator approves student and coporate signups and also approve the opportunities put up by the corporate.
            </p>
            <p>
                <a class="btn btn-default" href="Account/Login.aspx?user=Admin">Admin Login &raquo;</a>
            </p>
            
        </div>
        <div class="col-md-4">
            <h2>Corporate</h2>
            <p>
                The corporate will after signup or after being added will use the Web site for the following purpose.
                
                <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Disc">
                    <asp:ListItem>uploads the various opportunities for the students in the form of the development tool, Problem statement, deadline , requirements for the various projects undertaken by the corporate.</asp:ListItem>
                    <asp:ListItem>The corporate will see the student request for the requirements and shall decide to consider it or not. They will update the status.</asp:ListItem>
                    <asp:ListItem>Evaluate the student‘s work uploaded on the Web site and provide experts comment to improve their performance.</asp:ListItem>
            </asp:BulletedList>
            </p>
            <p>
                <a class="btn btn-default" href="Account/Login.aspx?user=Corporate">Corporate Login &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Students</h2>
            <p>
                The students of the university campus will sign up on the Web Site. Also maintain their profile and their specialization of the various development tools.
            </p>
            <p>
                <a class="btn btn-default" href="Account/Login.aspx?user=Corporate">Student Login &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
