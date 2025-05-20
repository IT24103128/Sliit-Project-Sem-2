<%--
  Created by IntelliJ IDEA.
  User: Akash
  Date: 4/6/2025
  Time: 7.12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="com.example.demo.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.models.Review" %>
<%@ page import="com.example.demo.services.UserManager" %>
<%@ page import="com.example.demo.services.ReviewManager" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tutor Profile</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/tutor-profile.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header-user.css">
</head>
<body>

    <header>
        <div class="header">
            <div>
                <h2 class="header-title">Tutor Booking System</h2>
            </div>
            <div>
                <nav>
                    <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/tutor/user-view.jsp">Book Tutors</a>
                    <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/profile-view.jsp">Your Profile</a>
                    <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/user-view.jsp">Booking Details</a>
                    <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/user-view.jsp">Payment History</a>
                    <form action="<%=request.getContextPath()%>/user-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                        <input type="submit" value="Logout" class="btn-logout">
                    </form>
                </nav>
            </div>
        </div>
    </header>

    <%
        int tutorID = Integer.parseInt(request.getParameter("tutorID"));
        Tutor tutor = TutorsManager.findTutor(tutorID);
        User user = (User) session.getAttribute("logged-in-user");
        ArrayList<Review> reviews = ReviewManager.getReviews();
        if (tutor==null) { %>
            <h2> Something went wrong</h2>
            <% return;
        }
    %>

    <h2>Tutor Profile</h2>

    <div class="profile">
        <div class="p-image-container">
            <img src="<%= request.getContextPath() %>/images/<%= tutor.getGender().equals("male") ? "tutor-male-profile.png" : "tutor-female-profile.png" %>"  class="profile-image" alt="profile image">
        </div>

        <div class="p-details">
            <h3><span class="tutor-name">Name:</span> <%=tutor.getName()%></h3>
            <p><span class="attr">Subject:</span> <%=tutor.getSubject()%></p>
            <p><span class="attr">Age:</span> <%=tutor.getAge()%></p>
            <p><span class="attr">Expertise Level:</span> Level <%=tutor.getSubjectExpertise()%></p>
            <p><span class="attr">Session Cost (per hour):</span> $ <%=tutor.getCostPerHour()%></p>
            <p><span class="attr">Gender:</span> <%=tutor.getGender()%></p>
            <p><span class="attr">Contact No:</span>  <%=tutor.getContactNo()%></p>
            <p><span class="attr">Email:</span>  <%=tutor.getEmail()%></p>
        </div>
    </div>

    <h3 style="text-align:center;">Review This Tutor</h3>
    <form action="<%=request.getContextPath()%>/add-review" method="post" class="review-form">
        <input type="hidden" value="<%=user.getID()%>" name="userID">
        <input type="hidden" value="<%=tutor.getID()%>" name="tutorID">
        <textarea name="review" placeholder="Write your review here..."></textarea>

        <div class="rating-container">
            <span class="rating-title">Rating :</span>
            <select name="rating">
                <option value="1" selected>1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <input type="submit" value="Submit" class="review-submit-btn">
        </div>
    </form>

    <div class="review-section">
        <h3>Reviews</h3>
        <%
            int reviewCount = 0;
        for (Review review: reviews) {
        if (review.getTutorID() == tutorID) {
            reviewCount++;
        %>
            <div class="review">
                <p class="review-msg"><%=review.getComment()%></p>
                <%String userName = UserManager.findUser(review.getUserID()).getName();%>
                <div class="review-info-container">
                    <span class="review-starts">
                        <%
                            String ratingStars = "";
                            for (int i=0; i<review.getRating(); i++){
                                ratingStars += "★";
                            }
                        %>
                        <%= ratingStars %>
                    </span>
                    <div class="review-details">
                        <span class="review-user"><%=userName%></span>
                        <span class="review-date"><%=review.getDate()%></span>
                    </div>
                </div>
            </div>
        <%
            }
        }
        %>
        <%if (reviewCount==0){ %>
            No reviews..! </h4>
        <%}%>
    </div>

</body>
</html>
