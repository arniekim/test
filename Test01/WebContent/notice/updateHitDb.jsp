<%@page import="kr.co.hbilab.dto.NoticeDto"%>
<%@page import="kr.co.hbilab.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	
	
	request.setCharacterEncoding("utf-8");
	boolean isSuccess = false;
	String tempPage = request.getParameter("page");
	String tempSeq = request.getParameter("seq");
	if(tempPage == null || tempPage.length()==0){
		isSuccess = false;
	}else{
		isSuccess = true;
	}
	int cPage = 0;
	try{
		cPage = Integer.parseInt(tempPage);
		isSuccess = true;
	}catch(NumberFormatException e){
		isSuccess = false;
	}
	
	if(tempSeq == null || tempSeq.length()==0){
		isSuccess = false;
	}else{
		isSuccess = true;
	}
	int seq = 0;
	try{
		seq = Integer.parseInt(tempSeq);
		isSuccess = true;
	}catch(NumberFormatException e){
		isSuccess = false;
	}
	
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = dao.select(seq);
	if(dto == null) {
		isSuccess = false;
	}
	
	if(isSuccess){
		dao.updateHit(seq);//
		response.sendRedirect("view_notice.jsp?seq="+tempSeq+"&page="+tempPage);
	}else{
		%>
		<script>
			history.back(-1);
		</script>
		<%
	}
	
	
%>
