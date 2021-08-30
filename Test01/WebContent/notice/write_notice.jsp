<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	
	if(tempPage == null || tempPage.length()==0){
		tempPage = "1";
	}
	int cPage = 0;
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
%>
  <!-- container start -->
  <div class="container">
    <!-- row1 start -->
    <div class="row my-3">
      <!-- col start -->
      <div class="col-lg-12 page-header">
        <h2><small>공지사항 글쓰기</small></h2>
      </div>
      <!-- col end -->
    </div>
    <!-- row1 end -->

    <!-- row2 start -->
    <div class="row">
      <!-- col start -->
      <div class="col-lg-12">
        <form method="post" name="f" action="saveDb.jsp">
          <div class="form-group">
            <label for="flag">구분</label>
            <select id="flag" name="flag" class="form-control">
			  <option value="1">일반</option>
			  <option value="2">상품</option>
			  <option value="3">배송지연</option>
			  <option value="4">이벤트</option>
			</select>
          </div>   
          <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해 주세요.">
          </div>            
          <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력해 주세요."></textarea>
          </div>
          <input type="hidden" name="page" value="<%=cPage%>"/>
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
          <a href="list_notice.jsp?page=<%=cPage %>" class="btn btn-outline-secondary mr-2">취소</a>                    
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
            <h5 class="modal-title" id="exampleModalLabel">공지사항 등록하기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            작성한 글을 등록하시겠습니까?
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="saveNotice">확인</button>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- container end -->
  <script>
   $('#saveNotice').click(function(){
	   f.submit();
   });
  
  </script>
  <%@ include file="../inc/footer.jsp" %>