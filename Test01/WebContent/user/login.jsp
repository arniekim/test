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
    
		<hr class='color'>
		
		<!-- row2 start -->
    	<div class="row">
      		<!-- col start -->
      		<div class="col-lg-12">
				<form method="post" name="f" action="">
			   		<div class="form-group has-success has-feedback">
			   			<label class="control-label" for="inputGroupSuccess4">아이디</label>
			   			<div class="input-group">
			   				<span class="input-group-addon">
			   					<span class="glyphicon glyphicon-user"></span>
			   				</span>
			   				<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 주소를 입력해주세요."/>
			   			</div>
			   		</div>
					<div class="form-group justify-content-center">
						<label class="control-label" for="inputGroupSuccess4">패스워드</label>
						<div class="input-group">
			   				<span class="input-group-addon">
			   					<span class="glyphicon glyphicon-user"></span>
			   				</span>
			   				<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요."/>
			   			</div>
			   		</div>
			   		<div class='d-flex justify-content-end mt-4'>
			   			<button type='submit' class='btn btn-primary form-control font formSize' id='loginBtn'>로그인</button>
			   		</div>
				</form>
			</div>
      		<!-- col end -->
    	</div>
    	<!-- row2 end -->
    
    	<hr class='color mt-4'>
    
    	<!-- row3 start -->			
		<div class="row justify-content-center mt-4">
			<div class="">
				<a href="findId" class='btn btn-outline-primary font'>아이디찾기</a>
			</div>
			<div class='ml-3'>
				<a href='findPw' class='btn btn-outline-primary font'>비밀번호찾기</a>
			</div>
			<div class='ml-3'>
				<a href='signUp' class='btn btn-outline-primary font'>회원가입</a>
			</div>
		</div>
		<!-- row3 end -->

	</div>
    <!-- container end -->

<%@ include file="../inc/footer.jsp" %>