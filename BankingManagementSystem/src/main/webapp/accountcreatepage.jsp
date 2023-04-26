<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Create//</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/accountcreate.css">
</head>
<body>
    <a href="index.html"><i class="bi bi-box-arrow-left" style="font-size: 25px; margin-left: 10px; color:red; font-weight: 800;"></i></a>
	<div class="container text-center">
		<h1 class="py-2">Create Your Account In SBI Mini Bank</h1>
		<p class="py-2">Fill Each Infomation with attention , on the basis
			of this your PassBook will be Created</p>
		<p class="pb-4">Upload a Good Image Which will be in your
			PassBook.</p>
	</div>
	<%-- Form information will be here --%>
	<div class="container">
		<form action="accounthandle.jsp" method="post">
			<div class="form-group d-flex">
				<div class="input-group d-block pr-2">
					<label for="exampleInputText1">Account Holder Name</label> <input
						type="text" class="form-control w-100" id="exampleInputText1"
						aria-describedby="textHelp" name="holdername">
				</div>
				<div class="input-group d-block px-2">
					<label for="exampleInputText2">Father Name</label> <input
						type="text" class="form-control w-100" id="exampleInputText2"
						aria-describedby="textHelp" name="fathername">
				</div>
				<div class="input-group d-block pl-2">
					<label for="exampleInputText3">Mother Name</label> <input
						type="text" class="form-control w-100" id="exampleInputText3"
						aria-describedby="textHelp" name="mothername">
				</div>
			</div>
			<p>Gender</p>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" id="customRadioInline1" name="customRadioInline"
					class="custom-control-input" value="male"> <label
					class="custom-control-label" for="customRadioInline1">Male</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" id="customRadioInline2" name="customRadioInline"
					class="custom-control-input"  value="female"> <label
					class="custom-control-label" for="customRadioInline2">Female</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline mb-3">
				<input type="radio" id="customRadioInline3" name="customRadioInline"
					class="custom-control-input"  value="female"> <label
					class="custom-control-label" for="customRadioInline3">Others</label>
			</div>
			<div class="form-group d-flex"> 
				<div class="input-group d-block pr-2">
					<label for="exampleInputText4">Nominee Name</label> <input
						type="text" class="form-control w-100" id="exampleInputText4"
						aria-describedby="textHelp" name="nomineename">
				</div>
				<div class="input-group d-block px-2">
					<label for="exampleInputText5">Aadhar Number</label> <input
						type="text" class="form-control w-100" id="exampleInputText5"
						aria-describedby="textHelp" name="aadhar">
				</div>
				<div class="input-group d-block pl-2">
					<label for="exampleInputText6">Phone Number</label> <input
						type="text" class="form-control w-100" id="exampleInputText6"
						aria-describedby="textHelp" name="phonenumber">
				</div>
			</div>
			<div class="form-group d-flex">
				<div class="input-group d-block pr-2">
					<label for="exampleInputEmail1">Email Id</label> <input
						type="email" class="form-control w-100" id="exampleInputEmail1"
						aria-describedby="emailHelp" name="email">
				</div>
				<div class="input-group d-block pl-2">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control w-100"
						id="exampleInputPassword1" aria-describedby="passwordHelp"
						name="password">
				</div>
			</div>
			<div class="form-group d-flex">
				<div class="input-group d-block pr-2">
					<label for="exampleInputDate1">Date</label> <input type="date"
						class="form-control w-100" id="exampleInputDate1"
						aria-describedby="dateHelp" name="date">
				</div>
				<div class="input-group d-block pl-2">
					<textarea rows="3" cols="20" class="w-100"
						style="border: none; outline: gray;" name="address"><!-- Residential Address --></textarea>
				</div>
			</div>
			<div class="input-group d-block pr-2 py-4">
				<label for="exampleInputDate1">Enter Initial Amount (for
					Starting Your Account(&#x20B9))</label> <input type="number"
					title="You have to pay minimum 1000&#x20B9 "
					placeholder="1000  &#x20B9" class="form-control w-50 "
					id="exampleInputDate1" aria-describedby="dateHelp" name="amount">
			</div>
			<div class="py-3">
				<button type="submit" class="btn btn-primary  px-5">Submit</button>
				<button type="reset" class="btn btn-primary px-5">Reset</button>
				
			</div>

		</form>
	</div>
</body>
</html>