<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script>
		$(document).ready(function(){
			$("#dropdown1").change(function() {
				//alert("ajax");
				$.ajax({
	
		            type :"GET",
		            url  : "/TestDynamicDropDown/queryCountry.do",
		            data : { 
		                continentId : $("#dropdown1").val(),                            
		                },
		            dataType: "json",
		            success : function(data) {
		            	//alert(data.list[0].countryId);
		            	//var i = 0;
		            	$("#dropdown2 option").remove();
		            	data.list.forEach(function(value,index){
		            		$("#dropdown2").append(new Option(data.list[index].countryName, data.list[index].countryId));
		            		//i++;
		            	});                       
		        	},
	                error:function(data){  
	                    alert(data);  
	                }
	        	})
	        })			
		});
		</script>
		<style>
		.back {
		  background: #e2e2e2;
	/*	  width: 100%;
		  height¡G100%;*/
		  position: absolute;
		  top: 0;
		  bottom: 0;
			left: 0;
			right: 0;
		}
	
		.div-center {
			width: 600px;
			height: 400px;
			background-color: #fff;
	
	/*	  	position: absolute;
			position: relative;
			top:50%;
			left: 50%;
			transform:translate(-50%,-50%);*/
			/*transform: translateX(-50%);*/
	  
			position: absolute; 
			left: 0;
			right: 0;
			top: 0;
			bottom: 0;
			margin: auto;
/*			height¡G100%;*/
	
			padding: 1em 2em;
			border-bottom: 2px solid #ccc;
		}
		</style>
	</head>
	<body>
	<div class="back">
  		<div class="div-center">
	    	<form>
		        <div class="form-group">
		        <label for="dropdown1">continent</label>
				<select id="dropdown1" name="dropdown1" class="form-control" >
					<c:forEach var="continent" items="${ continent }">
						<option value="${ continent.continentId }">
							${ continent.continentName }
						</option>
					</c:forEach>
				</select>
		        </div>
		        <div class="form-group">
		        <label for="dropdown2">country</label>
				<select id="dropdown2" name="dropdown2" class="form-control" >
					<c:forEach var="country" items="${ country }">
						<option value="${ country.countryId }">
							${ country.countryName }
						</option>
					</c:forEach>
				</select>
		        </div>
	       </form>
		</div>
	</div>
	</body>
</html>