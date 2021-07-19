<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BOOTSTRAP -->
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@forevolve/bootstrap-dark@1.1.0/dist/css/bootstrap-dark.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!-- END BOOTSTRAP -->
<!-- JAVASCRIPT -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- END JAVASCRIPT -->
<!-- CSS -->
<link rel="stylesheet" href="style.css" />
<!-- END CSS -->
<title>User Profile</title>
</head>
<body>
	<header>
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">House Report</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarColor02"
					aria-controls="navbarColor02" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarColor02">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link active" href="#">Home
								<span class="visually-hidden"></span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">View
								Listings</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Add a
								Listing</a></li>
						<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					</ul>
					<form class="d-flex">
						<input class="form-control me-sm- " type="text"
							placeholder="Search">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					</form>
					<form action="profile.do" method="POST">
						<input type="hidden" name="id" value="${user.id }">
   						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Profile</button>
					</form> 
				</div>
			</div>
		</nav>
		<!-- End Navbar -->
	</header>
	<!-- Display User Info -->
	<c:choose>
		<c:when test="${! empty user}">
			<h2>Account Info</h2>
			<form action="editUserPage.do" method="POST">
				<input type="hidden" name="id" value="${user.id}" /> <input
					type="submit" value="Edit Personal Information" />
			</form>
			<br>
	Username: ${user.username}<br>
	First Name: ${user.firstName}<br>
	Last Name: ${user.lastName}<br>
	Email: ${user.email}<br>
			<br>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${! empty user.listings}">
		Listings:
		<ul>
				<c:forEach var="listing" items="${user.listings}">
					<li>${listing.address.street }, ${listing.address.city},
						${listing.address.state}
						<form action="editListing.do" method="GET">
							<input type="hidden" name="id" value="${listing.id}" /> <input
								type="submit" value="Edit Listing" />
						</form>
						<form action="deleteListing.do" method="GET">
							<input type="hidden" name="id" value="${listing.id}" /> <input
								type="submit" value="Delete Listing" />
						</form>
					</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
		You do not have any current listings<br>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${! empty user.favorites}">
		Favorites:
		<ul>
				<c:forEach var="favorite" items="${user.favorites}">
					<li>${favorite.address.street },${favorite.address.city },
						${favorite.address.state }
							<form action="deleteFavorite.do" method="GET">
							<input type="hidden" name="favoriteID" value="${favorite.id}" /> 
							<input type="hidden" name="userID" value="${user.id}" /> 
							<input type="submit" value="Remove from Favorites" />
						</form>
						</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
		You do not have any current favorites<br>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${! empty user.comments}">
		Comments:
		<ul>
				<c:forEach var="comment" items="${user.comments}">
					<li>${comment.listing.address.street },
						${comment.listing.address.city }, ${comment.listing.address.state }</li>
					<ul>
						<li>
						"${comment.comment }"
							<form action="editComment.do" method="GET">
							<input type="hidden" name="id" value="${comment.id}" /> <input
								type="submit" value="Edit Comment" />
						</form>
						<form action="deleteComment.do" method="GET">
							<input type="hidden" name="id" value="${comment.id}" /> <input
								type="submit" value="Delete Comment" />
						</form>
						</li>
					</ul>
				</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
		You do not have any current comments<br>
		</c:otherwise>
	</c:choose>
</body>
</html>