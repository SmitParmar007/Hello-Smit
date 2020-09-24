<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- // jqgrid// -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.4/css/ui.jqgrid.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.4/jquery.jqgrid.min.js"></script>

<script>

	$(function() {
		"use strict";
		$("#grid").jqGrid({
			url:"Newvalidate",

				mtype:"GET",

				datatype:"json",

				loadonce:"true",

			//	pageable: "true",
				 viewrecords: true,
				rowNum: 10,

            rowList: [5, 10, 20, 50, 100],

            pager: $("#divpager"),
	    	   /*   cellEdit : true,
			    autowidth: true,
	            height : gridHeight,
	            cellSubmit : "remote", */ 
			colModel : [ {
				name : "firstname",index:"firstname", align: "center"
			}, {
				name : "lastname",index:"lastname", align: "center"

			}, {
				name : "age",index:"age" ,align: "center"
			}, {
				name : "city",index:"city", align: "center"
			}, {
				name : "phone",index:"phone", align: "center"
			}
			

			],
			/* data : [ {
				firstName : "sdvsd",
				lastName : "xfv",
				age : "xfv",
				city : "fv",
				phone : "dfvb"
			}, ] */
		});
	});

 </script>

</head>
<body>

	<nav class="navbar navbar-dark bg-primary">
		<h3 align="center">Registration Form</h3>
	</nav>
	<div class="row">

		<div class="col-sm-4">
			<div class="container"></div>

	<form id="formv " name="formv">

				<div class="form-group">

					<label>Firstname :</label> <input type="text" class="form-control"
						name="firstname" id="firstname" size="30px" ><br> <span
						id="message"></span>
				</div>

				<div class="form-group">

					<label>Lastname :</label> <input type="text" name="lastname"
						class="form-control" id="lastname" size="30px"><br> <span
						id="message1"></span>
				</div>

				<div class="form-group">

					<label> Age </label> <input type="number" class="form-control"
						name="age" min="0" id="age" size="30px"><br> <span
						id="message3"></span>

				</div>

				<div class="form-group">

					<label>City </label> <input type="text" class="form-control"
						name="city" id="city" size="30px"> <br> <span
						id="message4"></span>

				</div>

				<div class="form-group">

					<label>Phone :</label> <input type="number" class="form-control"
						name="phone" id="phone"> <br> <span id="message5"></span>
					<br>

				</div>

				<div class="form-group" align="center">

					<input type="button" class="btn btn-info" value="Submit"
						id="submit"> <br>

				</div>
				
						<div class="form-group" align="center">

					<input type="button" class="btn btn-info" value="View"
						id="view"> <br>

				</div>
				
				<div class="form-group" align="center">

					<input type="button" class="btn btn-info" value="Delete"
						id="delete"> <br>

				</div>
				
						<div class="form-group" align="center">

					<input type="button" class="btn btn-info" value="Update"
						id="update"> <br>

				</div>

			</form>


			<table id="grid"></table>
			<div id ="divpager"></div>
		</div>

		<script type="text/javascript">
			$('#submit').click(function() {
			//	 var ids =jQuery("#grid").jqGrid('getGridParam','selarrrow'); 
				alert("submit called");

				var firstname = $("#firstname").val();
				var lastname = $("#lastname").val();
				var age = $("#age").val();
				var city = $("#city").val();
				var phone = $("#phone").val();

				alert("data is here");

				$.ajax({
					type : "GET",
					data : {
						firstname : firstname,
						lastname : lastname,
						age : age,
						city : city,
						phone : phone,
						
					},
					url : "Displaydata",
			
					success : function(resp) {
						alert(resp);
						//function for reloading reloading grid
						 jQuery("#grid").setGridParam({datatype:"json",url : "Newvalidate"}).trigger('reloadGrid');
					},
					error : function(resp) {
						alert("FAIL");
					}
		/* 			{
						loadComplete: function() {
						    alert("grid is loaded/reloaded");
						}  
						 */
				});
			});
		</script>
		
			<script type="text/javascript">
			$('#view').click(function() {
					alert("Select a row");	
					var rowId =$("#grid").jqGrid('getGridParam','selrow');  
					var rowData = jQuery("#grid").getRowData(rowId);
					var colData = rowData['firstname'];
					var col1 = rowData['lastname'];
					var col2 = rowData['age'];
					var col3 = rowData['city'];
					var col4 = rowData['phone'];
			
					$('#firstname').val(colData);
					$('#lastname').val(col1);
					$('#age').val(col2);
					$('#city').val(col3);
					$('#phone').val(col4);
			
			});
				</script>
				
					<script type="text/javascript">
			$('#delete').click(function() {
				alert("delete called");
				$.ajax({
					type : "GET",
					data : {
						firstname : $("#firstname").val()
					},
					url : "DeleteEntry",
			
					success : function(resp) {
						alert(resp);
						//function for reloading reloading grid
						 jQuery("#grid").setGridParam({datatype:"json",url : "Newvalidate"}).trigger('reloadGrid');
					},
					error : function(resp) {
						alert("FAIL");
					}
				
			});
			});
				</script>
					
					<script type="text/javascript">
			$('#update').click(function() {
				alert("update called");

				var firstname = $("#firstname").val();
				var lastname = $("#lastname").val();
				var age = $("#age").val();
				var city = $("#city").val();
				var phone = $("#phone").val();
				
				$.ajax({
					type : "GET",
					data : {firstname : firstname,
						lastname : lastname,
						age : age,
						city : city,
						phone : phone,
								},
					url : "Updatenow",
			
					success : function(resp) {
						alert(resp);
						//function for reloading grid
						 jQuery("#grid").setGridParam({datatype:"json",url : "Newvalidate"}).trigger('reloadGrid');
					},
					error : function(resp) {
						alert("FAIL");
					}
				
			});
			});
				</script>
					

		<!-- 		/* 	var a = /^[A-Za-z]+$/;
			var firstname = document.getElementById("firstname").value;
			if (firstname == "") {
				document.getElementById("message").innerHTML = "pLEASE enter username";
		//		document.getElementById("message").style.visibility = "visible";  
		        return false;
		
			}

			if ((firstname.length < 2)) {

				document.getElementById("message").innerHTML = "Username must be 3 character";

				return false;

			}

			if ((firstname.length > 20)) {
				document.getElementById("message").innerHTML = "Username invalid";
				return false;
			}

			if (!firstname.match(a)){
				document.getElementById("message").innerHTML = "only alphabets allowed";
				return false;
			}
		
		
			var lastname = document.getElementById("lastname").value;


			if (lastname == "") {
				document.getElementById("message1").innerHTML = "pLEASE enter lastname";
				return false;
			}
			if ((lastname.length < 2)) {

				document.getElementById("message1").innerHTML = "Lastname must be 3 character";

				return false;

			}

			if ((lastname.length > 20)) {
				document.getElementById("message1").innerHTML = "Lastname invalid";
				return false;
			}

			if (!lastname.match(a)) {
			
				document.getElementById("message1").innerHTML = "only alphabets allowed";
				return false;
			}
  
	//		var c = /^\S[0-9]{0,3}+$/;
			var age = document.getElementById("age").value;
			if (age== "") {

				document.getElementById("message3").innerHTML = "pLEASE enter age";
				return false;
			}
			
			if (isNaN(age)){

				document.getElementById("message5").innerHTML = "only digits allowed ";

				return false;
			}
	/* 		if ((age.length < 1)) {

				document.getElementById("message3").innerHTML = "age must greater than 1";

				return false;

			}
 *//* 
			if ((age.length > 100)) {
				document.getElementById("message3").innerHTML = " invalid";
				return false;
			}

			if (!age.match(c)){
			
				document.getElementById("message3").innerHTML = "only digits allowed";
				return false;
			}
 */			
 		
		
		/*	var city = document.getElementById("city").value;
			if (city == "") {

				document.getElementById("message4").innerHTML = "pLEASE enter city";
				return false;
			}

			if ((city.length < 1)) {

				document.getElementById("message4").innerHTML = "city must be 3 character";

				return false;

			}

			if ((city.length > 20)) {
				document.getElementById("message4").innerHTML = "City invalid";
				return false;
			}

			if (!city.match(a)){

				document.getElementById("message4").innerHTML = "only alphabets allowed";
				return false;
			}
			
 
			var z = document.getElementById("phone").value;
			if (z == "") {
				document.getElementById("message5").innerHTML = "please enter phone ";
				return false;
			}

			if (isNaN(z)) {

				document.getElementById("message5").innerHTML = "only digits allowed ";

				return false;
			}
			if (z.length < 10) {

				document.getElementById("message5").innerHTML = "number less than 10 digits ";
				return false;
			}
			if (z.length > 10) {
				document.getElementById("message5").innerHTML = "number greater than 10 digits";
					return false;
			}
 		
 		} */ -->
		

</body>
</html>