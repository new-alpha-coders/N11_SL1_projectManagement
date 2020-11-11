<html lang="en">

<head>
    <!-- JSP importing package -->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*,java.text.*,java.util.Date"%>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- font awesome cdn -->
    <script src="https://use.fontawesome.com/56030c5688.js"></script>

    <!-- bootstrap stylesheet -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Home</title>

    <!-- internal css -->
    <style>
        /* changing font awesome icon color */
        .fa-user-circle-o {
            color: #4F5450;
            cursor: pointer;
        }

        /* user dropdown list */
        .profile {
            display: inline-block;
            position: relative;
        }

        #userMenu {
            display: none;
            position: absolute;
            margin-left: -20px;
            margin-top: 1px;
            z-index: 1;
        }

        #userMenu a {
            text-decoration: none;
            width: 120px;
            color: #333;
            background-color: whitesmoke;
            padding: 5px 10px;
            display: block;
            font-size: 16px;
            border-radius: 10px;
        }

        .profile:hover #userMenu {
            display: block;
            color: red;
        }

        .dropdown-item:hover {
            background-color: #333;
            color: white;
        }
    </style>


    
</head>

<body>

    <%-- JSP connecting to db --%>
    <%
        PreparedStatement ps=null;
        Connection conn=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://bmfqadeaynicb7pn4izx-mysql.services.clever-cloud.com:3306/bmfqadeaynicb7pn4izx","uf3zyddfyt288imy","Jwc5yfLdhT7eSsWYsuc3"); 
        }
        catch(Exception e){
            out.println("<script>alert('"+e+"')</script>");
        }
    %>
    <!-- Navbar / Header of website -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <!-- <div class="container px-5 py-2"> -->
        <a class="navbar-brand text-primary" href="#" style="font-size: 25px;">
            <i class="fa fa-cloud-upload fa-lg" aria-hidden="true" style="margin:5px; margin-right: 5px;"></i>
            Alpha Projects</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav" style="margin-left: 50px;">
            <ul class="navbar-nav">
                <li class="nav-item dropdown" style="font-size: 18px;">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                        Menu
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#subjectModal">
                            <i class="fa fa-plus"></i>
                            Add Subject
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#projectModal">
                            <i class="fa fa-plus"></i>
                            Assign Project
                        </a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="profile mr-3">
            <span class="fa fa-user-circle-o fa-2x" id="user"> </span>
            <div id="userMenu">
                <a href="index.html">log-out</a>
            </div>
        </div>
        <!-- </div> -->
    </nav>

    <!-- Modal for taking subject data -->
    <div class="modal fade" id="subjectModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add subject</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="subjectName">Subject name</label>
                            <input type="text" name="subjectName" class="form-control" id="subjectName">
                        </div>
                        <div class="form-group">
                            <label for="subjectCode">Subject code</label>
                            <input type="text" name="subjectCode" class="form-control" id="subjectCode">
                        </div>
                        <hr>
                        <button type="submit" name="subject" class="btn btn-outline-primary col-sm-3">Add</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for taking assign project data -->
    <div class="modal fade" id="projectModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Assign project</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="subjectNC">Subject</label>
                            <select name="subjectData" id="subjectNC" class="form-control">
                                <% 
                                    try{
                                        String fetchSubject="select subjectName,subjectCode from subject";
                                        ps=conn.prepareStatement(fetchSubject);
                                        ResultSet rs=ps.executeQuery();

                                        while(rs.next()){
                                            out.println("<option>"+rs.getString("subjectName")+" "+rs.getString("subjectCode")+"</option>");
                                        }
                                    }
                                    catch(Exception e){
                                        out.println("<script>alert('"+e+"')</script>");
                                    }
                            
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="pstDate">Project starting date</label>
                            <input type="date" name="prjAssignDate" class="form-control" id="pstDate" required>
                        </div>
                        <div class="form-group">
                            <label for="pstDate">Problem statement deadline</label>
                            <input type="date" name="pstDate" class="form-control" id="pstDate" required>
                        </div>
                        <div class="form-group">
                            <label for="codeDate">Code Submission deadline</label>
                            <input type="date" name="codeSbDate" class="form-control" id="codeDate" required>
                        </div>
                        <hr>
                        <button type="submit" name="assignPrj" class="btn btn-outline-primary col-sm-3">Assign</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- displaying current projects under subject -->
    <div class="container p-5">
        <h2 style="margin-left: 20px;">Projects</h2>
        <hr>
        <%
            try{
                String fetch="select subject,prjAssignDate,problemStatementDate,codeSubmissionDate from assignPrj where instructorId='vaibhav3'";
                ps=conn.prepareStatement(fetch);
                ResultSet rs=ps.executeQuery();
                
                while(rs.next()){
                    out.println("<div class='card my-3'><h5 class='card-header text-primary'>Subject Name - "+rs.getString("subject")+"</h5><ul class='list-group'><li class='list-group-item text-success'>Teams Enrolled - </li><li class='list-group-item'>Project start date - "+rs.getString("prjAssignDate")+"</li><li class='list-group-item'>Problem statement deadline date - "+rs.getString("problemStatementDate")+"</li><li class='list-group-item'>Code submission deadline date - "+rs.getString("codeSubmissionDate")+"</li></ul></div>");
                }

            }catch(Exception e){
                out.println("<script>alert('"+e+"')</script>");
            }
        %>
    
    </div>

    <!-- JSP -->
    <%
        //Check form is submitted 
        int checkInsert=0;
        if(request.getParameter("subject")!=null){
            try{

                String subjectName=request.getParameter("subjectName");
                String subjectCode=request.getParameter("subjectCode");
                String insertSubjectData="insert into subject values(?,?,?)";

                ps=conn.prepareStatement(insertSubjectData);
                ps.setString(1,"vaibhav3");
                ps.setString(2,subjectName);
                ps.setString(3,subjectCode);

                checkInsert=ps.executeUpdate();

                //out.println(subjectCode+subjectName);
                if(checkInsert==0)
                    out.println("<script>alert('Failed...')</script>");

                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "instructorHome.jsp");
            }
            catch(Exception e){
                out.println("<script>alert('"+e+"')</script>");
            }
        }

        if(request.getParameter("assignPrj")!=null){
             try{

                String subjectData=request.getParameter("subjectData");
                String prjAssignDate=new String(request.getParameter("prjAssignDate"));
                String pstDate=new String(request.getParameter("pstDate"));
                String codeSbDate=new String(request.getParameter("codeSbDate"));

                String insertData="insert into assignPrj values(?,?,?,?,?)";
                ps=conn.prepareStatement(insertData);
                ps.setString(1,"vaibhav3");
                ps.setString(2,subjectData);
                ps.setString(3,prjAssignDate);
                ps.setString(4,pstDate);
                ps.setString(5,codeSbDate);                

                checkInsert=ps.executeUpdate();

                //out.println(subjectCode+subjectName);
                if(checkInsert==0)
                    out.println("<script>alert('Failed...')</script>");

                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "instructorHome.jsp");

             }
             catch(Exception e){
                out.println("<script>alert('"+e+"')</script>");
            }
        }
    %>
    <!-- bootstrap cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <!-- Footer for contact-us -->
    <footer class="page-footer p-4 bg-dark text-light d-print-none" style="position:relative;bottom:0;width:100%;">
        <p class="lead"> Contact Us : &emsp;
            <i class="fa fa-github fa-lg" aria-hidden="true"></i> Github &emsp;
            <i class="fa fa-envelope fa-lg" aria-hidden="true"></i> Gmail
        </p>
    </footer>
</body>

</html>