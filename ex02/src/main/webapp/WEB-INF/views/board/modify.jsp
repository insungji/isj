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

$(document).ready(function(){
	
	var formObj = $("form"); // # = id , . = class , 그냥 = 테그
	
	$('button').on("click",function(e){
		
		e.preventDefault();  //기본동작을 막고 마지막에 직접 submit()을 수행한다.
		
		var operation = $(this).data("oper");
		
		alert(operation);	//modify, remove, list
		console.log(operation);
		
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
			
		}else if(operation === 'list'){
			//move to list
			//self.location = "/board/list"
			//return;
			// 밑에와 같이 변경해 줬다.
			formObj.attr("action", "/board/list").attr("method","get");
			
			//list 페이징 문제 추가 
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			
			
			
		}
	
		formObj.submit();
		
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
                        
                        
                        <form role="form" action="/board/modify" method="post">
                        
                        <!--페이지 List 페이징 번호문제로 추가!!!! -->
                        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                        
                        		<div class="form-group">
                        			<label>Bno</label> 
                        			<input class="form-control" name="bno" value="<c:out value="${board.bno }"/>" readonly="readonly">
                        		</div>
                        		
                        		
                        		<div class="form-group">
                        			<label>Title</label> 
                        			<input class="form-control" name="title" value="<c:out value="${board.title }"/>" >
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>Text area</label> 
                        			<textarea class="form-control" rows="3" name="content" ><c:out value="${board.content }" /></textarea>
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>Writer</label> 
                        			<input class="form-control" name="writer" value="<c:out value="${board.writer }" />" readonly="readonly">
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>RegDate</label> 
                        			<input class="form-control" name="regdate" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" />" readonly="readonly">
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>Update Date</label> 
                        			<input class="form-control" name="updatedate" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updatedate }" />" readonly="readonly">
                        		</div>
                        		
								
								<button type="submit" data-oper="modify" class="btn btn-default" >Modify</button>
								<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
								<button type="submit" data-oper="list" class="btn btn-info">List</button>
								
						
						
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