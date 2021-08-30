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
%>
  <!-- container start -->
  <div class="container">
    
    <!-- row1 start -->
    <div class="row my-3">
      <div class="col-lg-10 page-header">
        <h2><small>공지사항 상세보기</small></h2>
      </div>
      <!-- col1 end -->
      <!-- col2 start -->
      <div class="col-lg-2">
        <div class='float-lg-right mt-2'>
          <a href="list_notice.jsp?page=<%=tempPage %>" class="btn btn-outline-secondary">공지사항 보기</a>          
        </div>
      </div>
      <!-- col end -->
    </div>
    <!-- row1 end -->

    <!-- row2 start -->
    <div class="row">
      <!-- col start -->
      <div class="col-lg-12">
        <div class="table-responsive">
        
          <table class="table">
            <tr>
              <td colspan="1" class="font-weight-bold text-center">제목</td>
              <td colspan="11" class="font-weight-bold">
                <span><%=dto.getTitle() %></span>
              </td>
            </tr>
            <tr>
              <td colspan="1" class="font-weight-bold text-center">등록일</td>
              <td colspan="5"><%=dto.getRegdate() %></td>
              <td colspan="1" class="font-weight-bold text-center">구분</td>
              <td colspan="5">
              	<%
	              	String flag = dto.getFlag();
	      			if(flag != null && flag.equals("1")){
	      				flag = "일반";
	      			}else if(flag != null && flag.equals("2")){
	      				flag = "상품";
	      			}else if(flag != null && flag.equals("3")){
	      				flag = "배송지연";
	      			}else{
	      				flag = "이벤트";
	      			}
              	%>
              	<%=flag %>
              </td>
            </tr>
            <tr>
              <td colspan="12">
                <div class="py-3 px-3">
                  <p><%=dto.getContent().replaceAll("\n","<br>") %></p>
                </div>
              </td>
            </tr>
          </table>
        </div>
      </div>
      <!-- col end -->
    </div>
    <!-- row2 end -->

    <hr class='color'>
    <!-- row3 start -->
    <div class="row">
      <!-- col start -->
      <div class="col-lg-12">
        <div class='d-flex justify-content-end mt-2'>
          <!-- Button trigger modal -->
          <a href="update_notice.jsp?seq=<%=seq%>&page=<%=tempPage%>" class="btn btn-outline-success mr-1">수정</a>
          <button type="button" class="btn btn-outline-danger mr-2" data-toggle="modal" data-target="#exampleModal">삭제</button>          
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
            <h5 class="modal-title" id="exampleModalLabel">공지사항 삭제하기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            이 공지사항을 삭제하시겠습니까?
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
	   location.href="deleteDb.jsp?seq=<%=seq%>&page=<%=tempPage%>";
   });
  
  </script>
  <%@ include file="../inc/footer.jsp" %>