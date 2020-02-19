<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<!-- JSTL테그라이브러 -->  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Start Bootstrap - SB Admin Version 2.0 Demo</title>

	<!-- CSS가 정상적으로 적용된 하면을 보기위해서 ../에서 /resources/ 경로로 바꿔준다 . -->
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
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null); //뒤로가기 문제  표시 !!
	
	function checkModal(result){
		
		if(result === '' || history.state){ //뒤로가기 문제 표시!!
			return;
		}
		
		if(parseInt(result)>0){
			$(".modal-body").html("게시글 " + parseInt(result)+ "번이 등록되었습니다. ");
			
		}
		
		$("#myModal").modal("show");
		
	}
	
	
	$("#regBtn").on("click", function(){
	
		self.location="/board/register";
// 		location.href ="/board/register";
		
	});
	
	//a태그 form 추가 url의 이동 처리  페이징번호 이동시 
	var actionForm = $("#actionForm");
	
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		
		
	});
	
	//a태그에 이동하려는 게시물의 번호만을 가지게 수정 
	$(".move").on("click" , function(e){
		alert("눌렀다 move");
		
		e.preventDefault(); //이벤트를 막아주
		actionForm.append("<input type='hidden' name='bno' value='"+
		$(this).attr("href")+"'>");
		actionForm.attr("action", "/board/get");
		actionForm.submit();
		//게시물 제목 클릭하면 bno값을 전달 
		
	});
	
	
});

</script>

<body>
		<!-- 해더 적용 -->
		<%@include file="../includes/header.jsp" %>
    		
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    	<tr>
                                    		<th>#번호</th>
                                    		<th>제목</th>
                                    		<th>작성자</th>
                                    		<th>작성일</th>
                                    		<th>수정일</th>
                                    	</tr>
                                    </thead>
                                    
                                    <!-- JSTL사용 출력처리 -->
                                    <c:forEach items="${list}" var="board">
                                    
                                    	<tr>
                                    		<td><c:out value="${board.bno}" /></td>
<%--                                     		<td><a href="/board/get?bno=<c:out value="${board.bno}"/>"/>  <!--목록에서 조회페이지로 이동 --> <!-- 리스트페이징1로가는문제로 수정 --> --%>
											<td>
											<a class='move' href="<c:out value="${board.bno}"/>">
                                    		<c:out value="${board.title}" /></a>
                                    		</td>
                                    		<td><c:out value="${board.writer}" /></td>
                                    		<td><fmt:formatDate pattern="yyyy-mm-dd" value="${board.regdate}"/></td>
                                    		<td><fmt:formatDate pattern="yyyy-mm-dd" value="${board.updatedate}"/></td>
                                    	</tr>
                                    </c:forEach>
                                    
                                </table> <!-- 테이블 태그의 끝 -->
                               	
                               	
                               
                               	<div>
                               	<ul class="pagination">
                               		<c:if test="${pageMaker.prev}">
                               			<li class="paginate_button previous">
                               			<a href="${pageMaker.startPage-1}">Previous</a>
                               			</li>	
                               		</c:if>
                               		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
										<a href="${num}">${num}</a>
										</li>                               		
                               		</c:forEach>
                               		<c:if test="${pageMaker.next}">
                               			<li class="paginate_button next">
                               			<a href="${pageMaker.endPage +1 }">Next</a>
                               			</li>
                               		</c:if>
                               	</ul>
                               
                               	</div>
                                <!-- end Pagination -->
                                
                                
                               	<form id="actionForm" action="/board/list" method="get">
                               	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                               	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                               	</form>
                                
                                <!-- 모달 추가 -->
                                 <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                        </div>
                                        <div class="modal-body">
                                        	처리가 완료되었습니다.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                                
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
             
            <!--푸터 적용  -->
        <%@include file="../includes/footer.jsp" %>

</body>
</html>