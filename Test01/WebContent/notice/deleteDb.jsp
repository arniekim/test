<%@page import="kr.co.hbilab.dto.NoticeDto"%>
<%@page import="kr.co.hbilab.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	String tempPage = request.getParameter("page");
	String tempSeq = request.getParameter("seq");
	NoticeDao dao = NoticeDao.getInstance();
	int seq = Integer.parseInt(tempSeq);
	boolean isSuccess = dao.delete(seq);
	if(isSuccess){
		%>
		<script>
			alert('공지사항이 삭제되었습니다.');
			location.href="list_notice.jsp?page=<%=tempPage%>";
		</script>
		<%
	}else{
		%>
		<script>
			alert('DB Error');
			history.back(-1);
		</script>
		<%
	}
%>
