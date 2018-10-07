<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
		<script
	  src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
	</head>
	<body>
		<select id="dropdown1" name="dropdown1">
			<c:forEach var="continent" items="${ continent }">
				<option value="${ continent.continentId }">
					${ continent.continentName }
				</option>
			</c:forEach>
		</select>

		<select id="dropdown2" name="dropdown2">
			<c:forEach var="country" items="${ country }">
				<option value="${ country.countryId }">
					${ country.countryName }
				</option>
			</c:forEach>
		</select>
	</body>
</html>