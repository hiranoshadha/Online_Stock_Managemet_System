<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/CancelationRequestForm.css">
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<link rel="stylesheet" href="resources/css/CancelationRequestForm.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Font Awesome CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<meta charset="ISO-8859-1">
<title>Add Card Details</title>
<style>
body {
	background-image: url(images/6666.jpg);
	/* Change 'path_to_your_background_image.jpg' to the actual path of your background image */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
}

.container {
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center mb-5">Add Card Details</h1>
		<form method="post" action="AddcardDetails" class="w-50 mx-auto"
			onsubmit="return validateForm()">
			<div class="form-group">
				<label for="cardName">Card Name</label> <input type="text"
					class="form-control" id="cardName" name="cardName"
					placeholder="Enter card name" required />
			</div>
			<div class="form-group">
				<label for="cardHolderName">Card Holder Name</label> <input
					type="text" class="form-control" id="cardHolderName"
					name="cardHolderName" placeholder="Enter card holder name" required />
			</div>
			<div class="form-group">
				<label for="cardNumber">Card Number</label> <input type="text"
					class="form-control" id="cardNumber" name="cardNumber"
					placeholder="Enter card number" required />
			</div>
			<div class="form-group">
				<label for="validThru">Valid Thru</label> <input type="text"
					class="form-control" id="validThru" name="validThru"
					placeholder="MM/YYYY" required />
			</div>
			<div class="form-group">
				<label for="cVV">CVV</label> <input type="text" class="form-control"
					id="cVV" name="cVV" placeholder="Enter CVV" required />
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<!-- Bootstrap JS -->
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

	<script>
		function validateForm() {
			var cardName = document.getElementById("cardName").value;
			var cardHolderName = document.getElementById("cardHolderName").value;
			var cardNumber = document.getElementById("cardNumber").value;
			var validThru = document.getElementById("validThru").value;
			var cVV = document.getElementById("cVV").value;

			if (cardName.trim() == '') {
				alert('Please enter a card name');
				return false;
			}

			if (cardHolderName.trim() == '') {
				alert('Please enter card holder name');
				return false;
			}

			if (!/^\d{16}$/.test(cardNumber)) {
				alert('Please enter a valid 16-digit card number');
				return false;
			}

			var validThruPattern = /^(0[1-9]|1[0-2])\/\d{4}$/;
			if (!validThruPattern.test(validThru)) {
				alert('Please enter a valid valid thru date in MM/YYYY format');
				return false;
			}

			if (!/^\d{3}$/.test(cVV)) {
				alert('Please enter a valid 3-digit CVV');
				return false;
			}

			return true;
		}
	</script>
</body>
</html>
