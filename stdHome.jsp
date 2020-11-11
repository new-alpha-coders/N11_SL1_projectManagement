<html lang="en">

<head>
    <!-- JSP importing package -->
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>

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

                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#joinTeamModal">
                            <i class="fa fa-users"></i>
                            Join Team
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#createTeamModal">
                            <i class="fa fa-user-plus"></i>
                            Create Team
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


    <!-- Modal for taking join team data -->
    <div class="modal fade" id="joinTeamModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Join Team</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="inputTeamCode">Team code</label>
                            <input type="text" class="form-control" id="inputTeamCode" required>
                        </div>
                        <hr>
                        <button type="submit" class="btn btn-outline-primary col-sm-3" name="joinTeam">Join</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal for taking create team data -->
    <div class="modal fade" id="createTeamModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create Team</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>

                        <div class="form-group">
                            <label for="inputTeamName">Team name</label>
                            <input type="text" class="form-control" id="inputTeamName" required>
                        </div>

                        <div class="form-group">
                            <label for="teamLogo">Team logo</label>
                            <div class="custom-file">
                                <input type="file" class="form-control custom-file-input" id="teamLogo">
                                <label class="custom-file-label" for="teamLogo"
                                    aria-describedby="inputGroupFileAddon02">Choose file</label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="noOfMembers">No of members</label>
                            <input type="tel" class="form-control" id="noOfMembers" required>
                        </div>

                        <div class="form-group">
                            <label for="projectName">Project name</label>
                            <input type="text" class="form-control" id="projectName" required>
                        </div>

                        <div class="form-group">
                            <label for="subjectNC">Subject</label>
                            <select name="subjectData" id="subjectNC" class="form-control" required>
                                <option value=""></option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="inputInstructor">Instructor</label>
                            <select name="subjectData" id="inputInstructor" class="form-control" required>
                                <option value=""></option>
                            </select>
                        </div>

                        <hr>
                        <button type="submit" class="btn btn-outline-primary col-sm-3">Create</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- displaying teams of student -->
    <div class="container p-5">
        <h2 style="margin-left: 20px;">Teams</h2>
        <hr>
        <div class="card my-3">
            <h5 class="card-header text-primary">
                Team Name - Iron Man
                <img src="./src/db.png" alt="logo" width="35" height="35" align="right" style="margin-right: 20px;">
            </h5>
            <ul class="list-group">
                <li class="list-group-item"> Subject name - DS </li>
                <li class="list-group-item"> Prject name - ecommerce site</li>
                <li class="list-group-item">
                    Status - &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    Marks - &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    Team Code -
                </li>
            </ul>
        </div>
        <div class="card my-3">
            <h5 class="card-header text-primary">
                Team Name - Iron Man
                <img src="./src/db.png" alt="logo" width="35" height="35" align="right" style="margin-right: 20px;">
            </h5>
            <ul class="list-group">
                <li class="list-group-item"> Subject name - DS </li>
                <li class="list-group-item"> Prject name - ecommerce site</li>
                <li class="list-group-item">
                    Status - &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    Marks - &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    Team Code -
                </li>
            </ul>
        </div>

        
    </div>

    <!-- JSP -->

    <!-- bootstrap cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <!-- Footer for contact-us -->
    <footer class="page-footer p-4 bg-dark text-light d-print-none" style="position:absolute;bottom:0;width:100%;">
        <p class="lead"> Contact Us : &emsp;
            <i class="fa fa-github fa-lg" aria-hidden="true"></i> Github &emsp;
            <i class="fa fa-envelope fa-lg" aria-hidden="true"></i> Gmail
        </p>
    </footer>
</body>

</html>