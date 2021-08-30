<%@page import="kr.co.hbilab.dto.NoticeDto"%>
<%@page import="kr.co.hbilab.dao.NoticeDao"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="kr.co.hbilab.dto.NoticeDto"/>
<jsp:setProperty name="dto" property="*"/>
<%@ page pageEncoding="utf-8" %>
<%
	String tempPage = request.getParameter("page");
	NoticeDao dao = NoticeDao.getInstance();
	boolean isSuccess = dao.update(dto);
	if(isSuccess){
		%>
		<script>
			alert('공지사항이 수정되었습니다.');
			location.href="view_notice.jsp?seq=<%=dto.getSeq()%>&page=<%=tempPage%>";
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
