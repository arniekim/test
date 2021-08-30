<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
    <!-- container start -->
	<div class="container">
	    <!-- row1 start -->
	    <div class="row my-3">
	      <!-- col start -->
	      <div class="col-lg-12 page-header">
	        <h2><small>회원정보 보기</small></h2>
	      </div>
	      <!-- col end -->
	    </div>
	    <!-- row1 end -->
		<!-- col start -->
		<div class="row">
			<div class="col-lg-12">
				<form method="post" name="f" action="updateDb.jsp">
				  <div class="form-group">
	                <input type="text" class="form-control" id="email" 
	                name="email"  readonly placeholder="Your Email *" value="<%="syh@hbilab.org" %>" />
	              	<div class="invalid-feedback" id="errorEmail">
				       이메일을 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="password" class="form-control" id="newpwd" 
	                name="newpwd"  placeholder="Your New-Password *" value="" />
	              	<div class="invalid-feedback" id="errorNewPwd">
				    	새로운 비밀번호를 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="text" class="form-control" id="name" 
	                name="name" placeholder="Your Name *" value="<%="성영한" %>" />
	              	<div class="invalid-feedback" id="errorName">
				       이름을 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <select class="form-control" 
	                	id="status" name="status">
				      <option value="1">가입</option>
				      <option value="2">탈퇴</option>
				    </select>
	              </div>
	              <input type="hidden" name="num" value="<%=1%>">
	              <input type="hidden" name="page" value="<%=1%>">
				</form>
				<div class="text-right" style="margin-bottom : 20px;">
					<a href="list_member.jsp" class="btn btn-outline-info">리스트</a>
					<a href="" id="updateCustomer" class="btn btn-outline-success">회원수정</a>
				</div>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
	<script>
	$(function(){
		$('#updateCustomer').click(function(e){
			e.preventDefault();
			f.submit();
		});
	});	
	</script>
<%@ include file="../inc/footer.jsp" %>
