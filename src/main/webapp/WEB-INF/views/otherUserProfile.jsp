<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Info</title>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script rel="javascript" type="text/javascript" href="js/jquery-1.11.3.min.js"></script>
<style>
body {
    background: #fafafa;
}
.container {
    margin: 20px;
}


.btn {
    cursor:pointer;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    
    border:1px solid #a6a6a6;
    border-top-color:#bdbdbd;
    border-bottom-color:#8b8a8b;
    
    padding:9px 14px 9px;
    
    color:#666666;
    font-size:11px;
    background-position:0px 0px;
    
    text-shadow: 0 1px 0 #fff;
    font-weight:bold;
    
    background-color: #ffffff;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#e8e8e8)); /* Saf4+, Chrome */
    background-image: -webkit-linear-gradient(top, #ffffff, #e8e8e8); /* Chrome 10+, Saf5.1+, iOS 5+ */
    background-image:    -moz-linear-gradient(top, #ffffff, #e8e8e8); /* FF3.6 */
    background-image:     -ms-linear-gradient(top, #ffffff, #e8e8e8); /* IE10 */
    background-image:      -o-linear-gradient(top, #ffffff, #e8e8e8); /* Opera 11.10+ */
    background-image:         linear-gradient(top, #ffffff, #e8e8e8);
    
    -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.2);
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.2);
    box-shadow: 0 1px 1px rgba(0,0,0,0.2);
    
    
}

.btn:hover {
    color:#333;
    border-color:#999;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#f6f6f6)); /* Saf4+, Chrome */
    background-image: -webkit-linear-gradient(top, #ffffff, #f6f6f6); /* Chrome 10+, Saf5.1+, iOS 5+ */
    background-image:    -moz-linear-gradient(top, #ffffff, #f6f6f6); /* FF3.6 */
    background-image:     -ms-linear-gradient(top, #ffffff, #f6f6f6); /* IE10 */
    background-image:      -o-linear-gradient(top, #ffffff, #f6f6f6); /* Opera 11.10+ */
    background-image:         linear-gradient(top, #ffffff, #f6f6f6);
}
.btn:active{
    background-image: -webkit-gradient(linear, left top, left bottom, from(#e8e8e8), to(#ffffff)); /* Saf4+, Chrome */
    background-image: -webkit-linear-gradient(top, #e8e8e8, #ffffff); /* Chrome 10+, Saf5.1+, iOS 5+ */
    background-image:    -moz-linear-gradient(top, #e8e8e8, #ffffff); /* FF3.6 */
    background-image:     -ms-linear-gradient(top, #e8e8e8, #ffffff); /* IE10 */
    background-image:      -o-linear-gradient(top, #e8e8e8, #ffffff); /* Opera 11.10+ */
    background-image:         linear-gradient(top, #e8e8e8, #ffffff);
}
.btn:focus {
    outline: none;
    border-color:#BD4A39;
}


/* Follow Button Styles */

button.followButton{
    width:160px;
}
button.followButton.following{
    background-color: #57A957;
    background-repeat: repeat-x;
    background-image: -khtml-gradient(linear, left top, left bottom, from(#62c462), to(#57a957));
    background-image: -moz-linear-gradient(top, #62c462, #57a957);
    background-image: -ms-linear-gradient(top, #62c462, #57a957);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #62c462), color-stop(100%, #57a957));
    background-image: -webkit-linear-gradient(top, #62c462, #57a957);
    background-image: -o-linear-gradient(top, #62c462, #57a957);
    background-image: linear-gradient(top, #62c462, #57a957);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#62c462', endColorstr='#57a957', GradientType=0);
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
    border-color: #57A957 #57A957 #3D773D;
    border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
    color:#fff;
}
button.followButton.unfollow{
    background-color: #C43C35;
    background-repeat: repeat-x;
    background-image: -khtml-gradient(linear, left top, left bottom, from(#ee5f5b), to(#c43c35));
    background-image: -moz-linear-gradient(top, #ee5f5b, #c43c35);
    background-image: -ms-linear-gradient(top, #ee5f5b, #c43c35);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #ee5f5b), color-stop(100%, #c43c35));
    background-image: -webkit-linear-gradient(top, #ee5f5b, #c43c35);
    background-image: -o-linear-gradient(top, #ee5f5b, #c43c35);
    background-image: linear-gradient(top, #ee5f5b, #c43c35);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ee5f5b', endColorstr='#c43c35', GradientType=0);
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
    border-color: #C43C35 #C43C35 #882A25;
    border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
}

</style>
<script>
$('body').on('click', 'button.followButton' ,function(e){
	alert(e);
	var userid = "${user.userid}";	
	alert(userid);
    e.preventDefault();
    $button = $(this);
    if($button.hasClass('following')){
        
        //$.ajax(); Do Unfollow
        
        $button.removeClass('following');
        $button.removeClass('unfollow');
        $button.text('Follow');
    } else {
        
        // $.ajax(); Do Follow
        $.ajax({ 
		   type: "POST",
		   url: "http://localhost:8080/resonance/user/follow/" + userid,
		   success: function(res){  
			   		       
		      alert("sucess");
		   	}
		});
        
        $button.addClass('following');
        $button.text('Following');
    }
});

$('button.followButton').hover(function(){
     $button = $(this);
    if($button.hasClass('following')){
        $button.addClass('unfollow');
        $button.text('Unfollow');
    }
}, function(){
    if($button.hasClass('following')){
        $button.removeClass('unfollow');
        $button.text('Following');
    }
});


function myFunction(){
	alert("Hello");
	var isFriend = ("${isFriend}");
	alert(isFriend);
	//$button = document.getElementById("followBtn");
	if(isFriend){
		alert("hello");
		('#followBtn').text('Following');
		('#followBtn').addClass('following');
		
	}
}

</script>


</head>
<body onload="myFunction()">
<h1>hello</h1>


<c:out value="${user.name}" />
	<br />
	
	<h1>
	Songs Uploaded by <c:out value="${user.name}" /> :
	</h1>
	
	
	<table width="59%" border="1">

<tr> 
  	<td> 
  Song Title
   </td>
   <td>
  Uploaded By
  </td>
  <td>
  Play Song
  </td>
  
  </tr>
<c:forEach items="${songList}" var="song">

  <tr> 
  	<td> 
  <c:out value= "${song.songTitle}" />
   </td>
   <td>
  <c:out value= "${song.uploadedByUserId}" />
  </td>
  <td>
  <audio controls>
  	<source src="<c:url value ="${song.playingUrl}" /> " type="audio/mpeg">
  </audio>
  </td>
  </tr>
</c:forEach>
</table>
<div class="container" id="followid">
    <button class="btn followButton" rel="${user.userid }" id ="followBtn">Follow</button>
</div>
	
</body>
</html>