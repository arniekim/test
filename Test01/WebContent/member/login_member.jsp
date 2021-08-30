<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
	<!-- container start -->
	<div class="container">
	    <!-- row1 start -->
	    <div class="row my-3">
	      <!-- col start -->
	      <div class="col-lg-12 page-header">
	        <h2><small>로그인</small></h2>
	      </div>
	      <!-- col end -->
	    </div>
	    <!-- row1 end -->
		<!-- col start -->
		<div class="row">
			<div class="col-lg-12">
				<form name="f" method="post" action="checkLoginDb.jsp">
	              <div class="form-group">
	                <input type="text" class="form-control" id="email" name="email" placeholder="Your Email *" value="" />
	              	<div class="invalid-feedback" id="errorEmail">
				       이메일을 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="password" class="form-control" id="pwd" name="pwd"  placeholder="Your Password *" value="" />
	              	<div class="invalid-feedback" id="errorPwd">
				    	비밀번호를 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="submit" id="loginMember" class="btn btn-primary" value="Login" />
	              	<a href="" class="btn btn-info" id="test">리스트</a>
	              </div>
	              
	            </form>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
	<script>
		$(function(){
			$('#test').click(function(e){
				e.preventDefault();
				location.href="list_member.jsp";
				
			});
			$('#loginMember').click(function(e){
				e.preventDefault();
				
				f.submit();
			});
			
		});
	</script>
<%@ include file="../inc/footer.jsp" %>
	