<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    
<head>

<title> Welcome </title>
<link rel="login.jsp">

<script language="JavaScript" type="text/javaScript">

function validate()
{
    if ( document.signupInfo.username.value == "" )
	{
		alert("Please enter a Username!");			
		return false;
	}

    if ( document.signupInfo.password.value == "" )
	{
		alert("Please enter a Password!");			
		return false;
	}
    
    if ( document.signupInfo.password2.value == "" )
	{
		alert("Please confirm Password!");			
		return false;
	}

    if ( document.signupInfo.email.value == "" )
	{
		alert("Please enter your Email address");			
		return false;
	}

    if ( document.signupInfo.phone.value == "" )
	{
		alert("Please enter your phone number!");			
		return false;
	}
    const phoneNumber = document.signupInfo.phone.value;
    if (phoneNumber.length !== 11) {
        alert("Please enter a valid 11-digit phone number!");
        return false;
    } 
    return true;

   

}


function letternumber(event)
{
		var keychar;
			
		keychar = event.key;
			
		
		// alphas and numbers
		if (((".+-0123456789").indexOf(keychar) > -1))
		   return true;
		else
        alert("Please enter numeric data");
		   return false;
}

function checkPass() {
  const pass1 = document.signupInfo.password.value;
  const pass2 = document.signupInfo.password2.value;

  if (pass1 == pass2) {
    return true;
  } else {
    alert("password mismatch");
    return false;
  }
}


</script>




<style>

*{
    font-family: sans-serif;
    font-weight: 500;
}

body{

    background:#dfe9f5;
    background-image: url("bg.jpeg");
    background-size: cover;

    background-repeat: no-repeat;
    
   
}

.wrapper{

    width : 330px;
    padding : 1rem 4rem;
    margin:  2rem 25rem auto ;
    background-color: #DAA06D;
    text-align: left;
    box-shadow: 0 20px 30px rgba(66, 61, 61, 0.247);
    border-radius: 10px;

    
}
button{
    font-size:medium;
    padding:10px 10px;
    font-weight: 200;
}

.inp{

    

color: rgb(255, 255, 255);
font-weight:700px;
border-radius: 10px;

}



h1,h2{

    

color: white;
font-weight: bold;

}

.button{
  
    background: #e27272a4;
	color: white;
	border-style: outset;
	border-color: #ca6060;
	height: 50px;
	width: 100px;
	font: bold15px arial,sans-serif;
	text-shadow: none;
    border-radius: 10px;

}

</style>
</head>

<body>


  <div class="wrapper">
    <h1 style="text-align: center;">Art Gallery </h1>
    <h2 style="text-align: center;"> Signup</h2>
    <form action="signupB" class="inp" name="signupInfo" method="post" onsubmit="return validate()">
        Create User Name: <input type = "text" placeholder="username" name="username" style="border-radius: 5px;" > <br> <br>
        Create Password: <input  type = "password" placeholder="*****"  name="password" style="border-radius: 5px;" > <br> <br>
        Confirm Password: <input  type = "password" placeholder="*****"  name="password2" style="border-radius: 5px;" onchange="return checkPass()"  > <br> <br>
        Enter Email Address: <input type = "email" placeholder="acc@gmail.com"  name="email" style="border-radius: 5px;"> <br> <br>
        Enter Phone Number: <input type = "tel"placeholder="0123456789"  name="phone" style="border-radius: 5px;" onkeypress="return letternumber(event)" > <br> <br>
        <label for="type">Select user type:</label>
        <input type="radio" id="type" name="type" value="user" checked> User
        <input type="radio" id="type" name="type" value="admin"> Admin
        
        <br> <br>
    
    
        <div style="text-align: center;">
        <input class ="button" type="submit" value="Signup"> <br>
        </div> 
        <div style="text-align: center;">
            <br>Already a member? <a href="login.jsp"> Login Here</a>

        </div>
    </form>
   
  </div>

  <%

  String errorMessage = (String) request.getAttribute("errorMsg");
  if (errorMessage != null) {

 %>
<center> <p style="color:red; border-width:3px; border-style:solid; border-color:#ffffff; background:white">

<%= errorMessage %>

</p> 

</center>
 
<%
  }
%>


</body>

</html>
