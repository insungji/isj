<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</div>
        <!-- /#page-wrapper -->
	
	
    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
<!--     <script src="/resources/js/jquery-1.10.2.js"></script> -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Tables -->
    <script src="/resources/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="/resources/js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    
    $(document).ready(function() {
    	//모바일 크기에서 새로고침시 메뉴 펼쳐지는 문제 해결 
        $('#dataTables-example').dataTable({
        	responsive:true	
        });
        $(".sidebar-nav")
        .attr("class","sidebar-nav navbar-collapse collapse")
        .attr("aria-expanded", 'false')
        .attr("style","height:1px");
    });
    
    </script>


</body>
</html>