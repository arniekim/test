<!-- template.html -->
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
 	<!-- container start -->
	<div class="container">
	    <div class="row my-3">
        	<!-- col start -->
        	<div class="col-lg-6 page-header">
        	<h2><small>회원 리스트</small></h2>
      	</div>
      	<!-- col2 start -->
      <div class="col-lg-6">
        <div class='float-lg-right'>
          <form class="form-inline" method="post" name="f" action="member_search.jsp">
            <select name="searchType" id="searchType" class="form-control my-2 mr-lg-2">
			  <option value="n_title">이름</option>
			  <option value="n_content">이메일</option>
			</select>
		    <input class="form-control mr-lg-2" type="search" placeholder="Search" name="searchText" id="searchText" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchNotice">Search</button>
          </form>         
        </div>
      </div>
      <script>
      	$("#searchNotice").click(function(e){
      		e.preventDefault();
      		
      		if($("#searchText").val()==""){
      			alert("검색어를 입력하세요");
      			$("#searchText").focus();
      			return;
      		}
      		
      		f.submit();
      	});
      </script>
      </div>
      <!-- col1 end -->
		<!-- col start -->
		<div class="row">
		    <!-- row1 start -->
      
			<div class="col-lg-12">
				<%-- table start --%>
				<div class="table-responsive">
				<table class="table table-hover">
				  <colgroup>
				  	<col width="10%">
				  	<col width="10%">
				  	<col width="65%">
				  	<col width="15%">
				  </colgroup>
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">이름</th>
				      <th scope="col">이메일</th>
				      <th scope="col">가입날짜</th>
				    </tr>
				  </thead>
				  <tbody>
				  	
				    <tr>
				      <th scope="row"><%="1" %></th>
				      <td><%="성영한" %></td>
				      <td><a href="view_member.jsp?num=1&page=1"><%="syh@hbilab.org" %></a></td>
				      <td><%="2021/08/21" %></td>
				    </tr>
				  
				  </tbody>
				</table>
				<%--Pagination start --%>
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    
				    <li class="page-item disabled">
				      <a class="page-link" href="list.jsp?page=<%=1 %>"  tabindex="-1" aria-disabled="true">&laquo;</a>
				    </li>
				    
				    
				    <li class="page-item"><a class="page-link" href="list_member.jsp?page=1"><%=1 %></a></li>
				    <li class="page-item"><a class="page-link" href="list_member.jsp?page=2"><%=2 %></a></li>
				    <li class="page-item"><a class="page-link" href="list_member.jsp?page=3"><%=3 %></a></li>
				    <li class="page-item"><a class="page-link" href="list_member.jsp?page=4"><%=4 %></a></li>
				    <li class="page-item"><a class="page-link" href="list_member.jsp?page=5"><%=5 %></a></li>
				    
				    <li class="page-item  disabled ">
				      <a class="page-link" href="list.jsp?page=<%=6%>">&raquo;</a>
				    </li>
				    
				  </ul>
				</nav>
				<%--Pagination end --%>
				<div class="text-right">
					<a class="btn btn-success" href="join_member.jsp?page=<%=1 %>" role="button"><i class="bi bi-pen"></i> 회원가입</a>
				</div>
				</div>
				<%-- table end--%>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
<%@ include file="../inc/footer.jsp" %>