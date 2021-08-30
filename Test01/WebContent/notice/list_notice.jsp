<%@page import="kr.co.hbilab.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.hbilab.dao.NoticeDao"%>
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
	
	NoticeDao dao = NoticeDao.getInstance();
	// len => 			10 일경우      20 일경우 
	// page = 1 ---> start = 0     ,  0
    // page = 2 ---> start = 10    ,  20
    // page = 3 ---> start = 20    ,  40
    // 0 ,10 , 20 , 30 , .... 등차수열 An = a1 + (n-1)*d
    int displayCount = 3;
    int pageDispalyCount = 5;
    int start = (cPage  - 1) * displayCount;
	ArrayList<NoticeDto> list = dao.select(start, displayCount);
%>
    <!-- container start -->
    <div class="container">
      <!-- row1 start -->
      <div class="row my-3">
        <!-- col start -->
        <div class="col-lg-6 page-header">
        <h2><small>공지사항 리스트</small></h2>
      </div>
      <!-- col1 end -->
      <!-- col2 start -->
      <div class="col-lg-6">
        <div class='float-lg-right'>
          <form class="form-inline" method="post" name="f" action="notice_search.jsp">
            <select name="searchType" id="searchType" class="form-control my-2 mr-lg-2">
			  <option value="n_title">제목</option>
			  <option value="n_content">내용</option>
			</select>
		    <input class="form-control mr-lg-2" type="search" placeholder="Search" name="searchText" id="searchText" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchNotice">Search</button>
          </form>         
        </div>
      </div>
      <script>
      	$("#searchNotice").click(function(e){
      		e.preventDefault();
      		/*
      		if($("#searchNotice").val()==""){
      			alert("검색어를 입력하세요");
      			$("#searchNotice").focus();
      			return;
      		}
      		*/
      		f.submit();
      	});
      </script>
      <!-- col end -->
      </div>
      <!-- row1 end -->

      <!-- row2 start -->
      <div class="row">
        <!-- col start -->
        <div class="col-lg-12">
          <div class="table-responsive">
          	<form>
            <table class="table table-hover text-center">
            <thead>
              <tr>
                <th class="text-center">
                	<div class="form-check">
					  <input  type="checkbox" name="checkAll" id="checkAll"/>
					</div>
                </th>
                <th>번호</th>
                <th>구분</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <%if(list.size() != 0){%>
              	<%
              		for(NoticeDto dto : list){ 
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
              <tr>
              	<td>
              		<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="<%=dto.getSeq() %>" name="seq"/>
					</div>
				</td>
                <td><%=dto.getSeq() %></td>
                <td><%=flag %></td>
                <td class="text-left"><a href="updateHitDb.jsp?seq=<%=dto.getSeq() %>&page=<%=cPage%>"><%=dto.getTitle() %></a></td>
                <td><%=dto.getRegdate() %></td>
                <td><%=dto.getHit() %></td>
              </tr>
              	<%} %>
              <%}else{ %>
              <tr>
                <td colspan='5'>등록된 공지사항이 없습니다.</td>
              </tr>
              <%} %>
            </tbody>
            </table>
            </form>
          </div>
        </div>
        <!-- col end -->
      </div>
      <!-- row2 end -->
      
      <!-- row3 start -->
      <div class="row">
        <!-- col start -->
        <div class="col-lg-12">
         <div class='float-lg-right mt-2'>
          <a href="" class="btn btn-outline-danger" id="deleteNotice">삭제하기</a>
          <a href="write_notice.jsp?page=<%=cPage %>" class="btn btn-outline-secondary">글쓰기</a>
          </div>
        </div>
        <!-- col end -->
      </div>
      <!-- row3 end -->
		<script>
			$('#deleteNotice').click(function(e){
				e.preventDefault();
				$("#seq").each()
			});
			$("#checkAll").click(function() {
				if($("input:checkbox[name=checkAll]").is(":checked")) {
					$("input[name=seq]:checkbox").each(function() {
						$(this).attr("checked", true);
					});
				}else{
					$("input[name=seq]:checkbox").each(function() {
						$(this).attr("checked", false);
					});
				}
			});
			
		</script>
      <hr class='color'>
      <!-- row4 start -->
      <%
      	
      	int totalPage = 0;
      	int currentBlock = 0;
      	int totalBlock = 0;
      	int startPage = 0;
      	int endPage = 0;
      	
      	int totalRows = dao.getRows();//128
		
		if(totalRows%displayCount==0){
			totalPage = totalRows/displayCount;
		}else{
			totalPage = totalRows/displayCount + 1;
		}
		//totalPage = (totalRows%displayCount==0) ? totalRows/displayCount : totalRows/displayCount + 1 ;
		
		if(totalPage == 0){
			totalPage = 1;
		}
		/*
		totalRows : 128 개 
		totalPage : 13
		      
		cPage : 1-10  -> currentBlock : 1, pageDisplayCount : 10
		cPage : 11-13 -> currentBlock : 2, pageDisplayCount : 10
		totalBlock = 2 
		....
		totalPage : 13
		cPage : 1-5  -> currentBlock : 1, pageDisplayCount : 5
		cPage : 6-10 -> currentBlock : 2, pageDisplayCount : 5
		cPage : 11-13 -> currentBlock : 3, pageDisplayCount : 5
		totalBlock = 3 
		....
		*/
		if(cPage%pageDispalyCount == 0){
			currentBlock = cPage/pageDispalyCount;
		}else {
			currentBlock = cPage/pageDispalyCount + 1;
		}
			
		if(totalPage%pageDispalyCount == 0){
			totalBlock = totalPage/pageDispalyCount;
		}else {
			totalBlock = totalPage/pageDispalyCount +1;
		}
		/*
		cPage : 1-10  -> currentBlock : 1
		cPage : 11-20 -> currentBlock : 2
		.....
		startPage : 1, 11, 20
		endPage : 10, 20, 30
		*/
		startPage = 1 + (currentBlock -1)*pageDispalyCount;
		endPage = pageDispalyCount + (currentBlock -1)*pageDispalyCount;
		
		if(currentBlock == totalBlock){
			endPage = totalPage;
		}
		
		
      %>
      <div class="row">
        <!-- col start -->
        <div class="col-lg-12">
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
             <%if(currentBlock == 1){ %>
              <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
             <%}else{ %>
             <li class="page-item"><a class="page-link" href="list_notice.jsp?page=<%=startPage-1%>">&laquo;</a></li>
             <%} %> 
              <%for(int i=startPage;i<=endPage;i++){ %>
              <li class="page-item"><a class="page-link" href="list_notice.jsp?page=<%=i%>"><%=i %></a></li>
              <%} %>
              <%if(currentBlock == totalBlock){ %>
              <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
              <%}else{ %>
              <li class="page-item"><a class="page-link" href="list_notice.jsp?page=<%=endPage+1%>">&raquo;</a></li>
              <%} %>
              
            </ul>
          </nav>
        </div>
        <!-- col end -->
      </div>
      <!-- row4 end -->
    </div>
    <!-- container end -->

    <%@ include file="../inc/footer.jsp" %>