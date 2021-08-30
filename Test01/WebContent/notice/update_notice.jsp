<%@page import="kr.co.hbilab.dto.NoticeDto"%>
<%@page import="kr.co.hbilab.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	String tempSeq = request.getParameter("seq");
	int seq = Integer.parseInt(tempSeq);
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = dao.select(seq);
	String flag = dto.getFlag();
%>
  <!-- container start -->
  <div class="container">
    <!-- row1 start -->
    <div class="row my-3">
      <!-- col1 start -->
      <div class="col-lg-10 page-header">
        <h2><small>공지사항 수정하기</small></h2>
      </div>
      <!-- col1 end -->
      <!-- col2 start -->
      <div class="col-lg-2">
        <div class='float-lg-right mt-2'>
          <a href="list_notice.jsp?page=<%=tempPage %>" class="btn btn-outline-secondary">공지사항 보기</a>          
        </div>
      </div>
      <!-- col2 end -->
    </div>
    <!-- row1 end -->

    <!-- row2 start -->
    <div class="row">
      <!-- col start -->
      <div class="col-lg-12">
        <form method="post" name="f" action="updateDb.jsp">
        <div class="form-group">
            <label for="flag">구분</label>
            <select id="flag" name="flag" class="form-control">
			  <option value="1" <%if(flag != null && flag.equals("1")) out.print("selected"); %>>일반</option>
			  <option value="2" <%if(flag != null && flag.equals("2")) out.print("selected"); %>>상품</option>
			  <option value="3" <%if(flag != null && flag.equals("3")) out.print("selected"); %>>배송지연</option>
			  <option value="4" <%if(flag != null && flag.equals("4")) out.print("selected"); %>>이벤트</option>
			</select>
          </div>   
          <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title"
            value="<%=dto.getTitle() %>">            
          </div>            
          <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control py-3" id="content" name="content" rows="10"><%=dto.getContent() %></textarea>
          </div>
          <input type="hidden" name="seq" value="<%=seq%>"/>
          <input type="hidden" name="page" value="<%=tempPage%>"/>
        </form>
      </div>
      <!-- col end -->
    </div>
    <!-- row2 end -->

    <!-- row3 start -->
    <div class="row">
      <!-- col start -->
      <div class="col-lg-12">
        <div class='d-flex justify-content-end mt-2'>
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-outline-primary mr-1" data-toggle="modal" data-target="#exampleModal">등록</button>
          <a href="view_notice.jsp?seq=<%=seq %>&page=<%=tempPage %>" class="btn btn-outline-secondary mr-2">취소</a>                    
        </div>
      </div>
      <!-- col end -->
    </div>
    <!-- row3 end -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">공지사항 수정하기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            수정한 글을 등록하시겠습니까?
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="deleteNotice">확인</button>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- container end -->
 <script>
   $('#deleteNotice').click(function(){
	   f.submit();
   });
  
  </script>
  <%@ include file="../inc/footer.jsp" %>