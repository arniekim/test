<%@page import="kr.co.hbilab.dto.NoticeDto"%>
<%@page import="kr.co.hbilab.dao.NoticeDao"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="kr.co.hbilab.dto.NoticeDto"/>
<jsp:setProperty name="dto" property="*"/>
<%@ page pageEncoding="utf-8" %>
<%
	
	/*
	request.setCharacterEncoding("utf-8");
	String tempPage = request.getParameter("page");
	String flag = request.getParameter("flag");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	NoticeDao dao = NoticeDao.getInstance();
	int seq = dao.getSeq();
	NoticeDto dto = new NoticeDto(seq,title,content,flag,0,null);
	*/
	String tempPage = request.getParameter("page");
	NoticeDao dao = NoticeDao.getInstance();
	int seq = dao.getSeq();
	dto.setSeq(seq);
	boolean isSuccess = dao.insert(dto);
	if(isSuccess){
		%>
		<script>
			alert('공지사항이 등록되었습니다.');
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
