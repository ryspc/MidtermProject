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

 <form action="createdListing.do" method="POST">
 <input type="hidden" name="userId" value="${user.id}">
 	<!-- Start of address object -->
 		<b>Street: </b>
 		<input type="text" name="street">
 		<b>APT:</b>
 		<input type="text" name="street2">
 		<b>City: </b>
 		<input type="text" name="city">
 		<select name="state">
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="DC">District Of Columbia</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
		</select>
		<input type="text" name="postalCode">
	<!-- End of address object -->
 
 	<!-- Start of listing object -->
        <b>Price:</b> <br />
        <input type="text" name="price" value="${listing.price}" > <br />
        <b>Square feet:</b> <br />
        <input type="text" name="squareFeet" value="${listing.squareFeet}" /> <br />
        <b>Number of beds:</b> <br />
        <input type="text" name="bedNumber" value="${listing.bedNumber}" /> <br />
        <b>Number of baths:</b> <br />
        <input type="text" name="bathNumber" value="${listing.bathNumber}" > <br />
        <b>Crime rate:</b> <br />
        <input type="text" name="propertyCrimeRate" value="${listing.propertyCrimeRate}" > <br />
        <b>Violent crime rate:</b> <br />
        <input type="text" name="violentCrimeRate" value="${listing.violentCrimeRate}" > <br />
        <b>HOA monthly rate:</b> <br />
        <input type="text" name="hoaMonthlyRate" value="${listing.hoaMonthlyRate}" > <br />
        <b>Year built:</b> <br />
        <input type="text" name="yearBuilt" value="${listing.yearBuilt}" > <br />
        <b>Lot size Sqaure feet:</b> <br />
        <input type="text" name="lotSizeSqft" value="${listing.lotSizeSqft}" > <br />
        <b>Property tax:</b> <br />
        <input type="text" name="propertyTax" value="${listing.propertyTax}" > <br />
        <b>Parking type:</b> <br />
        <input type="text" name="parkingType" value="${listing.parkingType}" /> <br />
        <input type="submit" value="Update" />
        <!-- End of listing object -->
        
        <!-- property type object -->
        <b>Property Type: </b>
        <select name="type">
			<option value="Apartment">Apartment</option>
			<option value="House">House</option>
			<option value="Condo">Condo</option>
			<option value="Duplex">Duplex</option>
			<option value="Townhouse">Townhouse</option>
			</select>
        <!-- property type object -->
        
        <!-- listing photo object -->
        <b>photo URL: </b>
        <input type="text" name="imgUrl">
        <!-- listing photo object -->
    </form>

</body>
</html>