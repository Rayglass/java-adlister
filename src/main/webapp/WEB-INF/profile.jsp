<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="../CSS/profile.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="profile-buttons" id="profile-buttons">
    <button onclick="window.location.href='/update'">Edit Profile</button>
    <button onclick="window.location.href='/delete'">Delete Profile</button>
    <button onclick="window.location.href='/ads/create'">Create New Ad</button>
</div>

<h1>Welcome ${sessionScope.user.username}! Here are all your ads</h1>


<div class="container">
    <c:forEach var="ad" items="${userAds}">
        <div class="col mb-4">
            <div class="card h-100" style="width: 21.5rem;">
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${ad.title}"/></h5>
                    <p class="card-text"><c:out value="${ad.description}"/></p>
                    <p><strong>Category:</strong><c:out value="${ad.category}"/></p>
                    <form action="/edit-ad" method="post">
                        <button type="submit" class="btn btn-primary" name="editAd" value="${ad.id}">Edit</button>
                    </form>
                    <form action="/profile" method="post">
                        <button type="submit" class="btn btn-primary" name="deleteAd" value="${ad.id}">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>