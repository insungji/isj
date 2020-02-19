<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Start Bootstrap - SB Admin Version 2.0 Demo</title>

    <!-- Core CSS - Include with every page -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Tables -->
    <link href="/resources/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="/resources/css/sb-admin.css" rel="stylesheet">

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	  
	  var operForm = $("#operForm"); 
	  
	  $("button[data-oper='modify']").on("click", function(e){
	    
	    operForm.attr("action","/board/modify").submit();
	    
	  });
	  
	    
	  $("button[data-oper='list']").on("click", function(e){
	    
	    operForm.find("#bno").remove();   //아무런 데이터가 필요하지 않으므로 form 태그 내의 bno태그를 지우고 submit
	    operForm.attr("action","/board/list")
	    operForm.submit();
	    
	  });  
	});

	



</script>
<body>
		<%@include file="../includes/header.jsp" %>
    
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board read Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        
                        
                        		<div class="form-group">
                        			<label>Title</label> 
                        			<input class="form-control" name="bno" value="<c:out value="${board.bno }"/>" readonly="readonly">
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>Text area</label> 
                        			<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content }" /></textarea>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>Writer</label> 
                        			<input class="form-control" name="writer" value="<c:out value="${board.writer }" />" readonly="readonly">
                        		</div>
                        			
                        			
<%--                         		<button data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'"> Modify</button> --%>
<!--                         		<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">List</button> -->
                        
                               
                        		<button data-oper='modify' class="btn btn-default"> Modify</button>
                        		<button data-oper='list' class="btn btn-info" >List</button>
                               
                              
                              	 <form id='operForm' action="/boad/modify" method="get">
								  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
								   
								   <!--페이지 List 페이징 번호문제로 추가!!!! -->
								  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
								  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
								 </form>
                               
                               
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        <%@include file="../includes/footer.jsp" %>

</body>

</html>