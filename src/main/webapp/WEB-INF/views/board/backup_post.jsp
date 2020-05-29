<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 데이터 전송을 위한 form -->
<form id="frm" method="post"></form>

<section id="container">
	<div id="contentWrap">
		<section id="content">
			<section class="content_info">
				<h1 class="title">${board_name }</h1>
			</section>
			<section id="content_detail" class="content_body">
				<div class="tstyle_view">
					<div class="title">${post.post_title } </div>
					<ul class="head">
						<li class="write"><strong>작성자</strong><span>${post.mem_id }</span></li>
						<li class="date"><strong>등록일</strong>
							<span><fmt:formatDate value="${post.post_reg }" pattern="yyyy/MM/dd HH:mm"/></span>
						</li>
	<!-- 					<li class="hit"><strong>조회수</strong><span>176</span></li> -->
					</ul>
					<div class="tb_contents" style="border-bottom: none; white-space: pre;">${post.post_cont }</div>
					<c:forEach items="${postFileList }" var="postFile">
						<a href="${cp }/fileDownloadView/${postFile.file_seq }" class="btn btn-dark btn-sm btn-file">
							<i class="fas fa-download"></i> Download
						</a>
						&nbsp;&nbsp;${postFile.file_name }<br>
					</c:forEach>
					<br>
					<div class="BtnArea" style="margin-top:20px">
						<c:if test="${S_MEM.mem_id eq post.mem_id || S_MEM.grade eq 0 }">
							<button type="button" id ="updatePost" class="pi-btn btn_list">수정</button>
							<button type="button" id ="deletePost" class="pi-btn btn_list">삭제</button>
						</c:if>
					</div>
					<!-- 댓글 리스트 : js를 이용하여 동적 추가 -->
					<div class="reply"></div>
					<div>
						<div class="tb_contents BtnArea" style="border-bottom: 2px solid #555; padding: 1.2rem 1.2rem; text-align: center;">
							<div class="editor_wrap" style="display: inline;" >
								<textarea id="reply_cont" style="resize: none; height: 100px; width: 80%;"></textarea>
								<button type="button" class="pi-btn btn_list" id="insertReply">작성</button>
							</div>
						</div>
					</div>
					<ul class="list_board" style="padding: 0 1.2rem 1.2rem 1.2rem;">
						<!-- 다음글 -->
						<c:choose>
							<c:when test="${beforeAfterPostMap.after_post != null}">
								<li>
									<span>다음글</span>
									<a href="${cp }/post/${beforeAfterPostMap.after_post.post_seq }">
										${beforeAfterPostMap.after_post.post_title }
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<span>다음글</span>
									<a>다음글이 없습니다.</a>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- 이전글 -->
						<c:choose>
							<c:when test="${beforeAfterPostMap.before_post != null}">
								<li style="border-bottom: 1px solid #e2e3e6;">
									<span>이전글</span>
									<a href="${cp }/post/${beforeAfterPostMap.before_post.post_seq }">
										${beforeAfterPostMap.before_post.post_title }
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li style="border-bottom: 1px solid #e2e3e6;">
									<span>이전글</span>
									<a>이전글이 없습니다.</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="BtnArea" style="margin-top:20px">
					<button type="button" class="pi-btn btn_list" onClick="location.href='${cp }/postList/${post.board_seq }/1'">목록</button>
				</div>
			</section><!--// #content_detail, .content_body -->
		</section><!--// #content -->
	</div><!--// #contentWrap -->
</section><!-- #container -->

<!-- js -->
<script>
	// 동적으로 댓글들을 생성하기 위한 함수
	function showReply() {
		// .reply 내용 생성
		$.ajax({ // replyList 요청 후 각각 내용 생성
			url: "${cp }/getReplyList",
			data: "post_seq=${post.post_seq }",
			type: "post",
		    async: false // updateReply에서 비동기 처리 시 showReply가 늦게 덮힌다.. 따라서 동기처리로 먼저 실행하도록 만듦
		}).done(function(data) {
			console.log(data);
			// .reply 내용 제거
			$(".reply").empty();
			var html = '<h3 class="reply-count">댓 글</h3>';
			$.each(data.replyList, function(i, reply) {
				console.log(reply)
				html += '<div id="rep' + reply.reply_seq + '" class="reply-cont">';
				html += '	<h4 style="display: inline;">' + reply.mem_id + '</h4>';
				html += '&nbsp' + moment(reply.reply_reg).format("YYYY/MM/DD HH:mm");
				if("${S_MEM.mem_id }" == reply.mem_id || "${S_MEM.grade }" == 0) { // 로그인한 유저가 작성자이거나, 관리자 일 경우
					html += '<button type="button" class="deleteReply reply_ud" data-seq="' + reply.reply_seq + '"><i class="fas fa-trash-alt"></i></button>';
					html += '<button type="button" class="updateReply reply_ud" data-seq="' + reply.reply_seq + '"><i class="fas fa-wrench"></i></button>';
				}
				html += '	<div class="reply_cont" style="white-space: pre;">' + reply.reply_cont + '</div>';
				html += '</div>';
			});
			// .reply 내용 추가
			$(".reply").append(html);
		});
	};

	// 페이지 로드 후
	$(function() {
		// 댓글생성 함수 호출
		showReply();
	    
		// update post
		$("#updatePost").on("click", function() {
			$("#frm").attr("action", "${cp }/postForm");
			$("#frm").append("<input type='hidden' name='post_seq' value='${post.post_seq }'/>");
			$("#frm").submit();
		});
		
		// delete post
		$("#deletePost").on("click", function() {
			Swal({
				title: '정말 삭제하시겠습니까?',
				type: 'warning',
				showCancelButton: true,
				focusConfirm: false,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '네',
				cancelButtonText: '아니오'
			}).then(function(result) {
				if (result.value) {
					$("#frm").attr("action", "${cp }/deletePost?board_seq=${post.board_seq }&post_seq=${post.post_seq }");
					$("#frm").submit();
				}
			});
		});
		
		// insert reply
		$("#insertReply").on("click", function() {
			$.ajax({
				url: "${cp }/insertReply",
				type: "post",
				data: "post_seq=${post.post_seq }&mem_id=${S_MEM.mem_id }&reply_cont=" + $("#reply_cont").val(),
				success: function() {
					showReply(); // 댓글 재로드
					$("#reply_cont").val("");
				}
			});
		});
		
		// update reply(수정 창 호출)
		$(".reply").on("click", ".updateReply", function() { // delegate
			var id = $(this).parent().attr("id");
			var reply_cont = $(this).siblings(".reply_cont").text();
			var reply_seq = $(this).data("seq");
			
			showReply();
			
			$("#" + id).children(".reply_ud").remove();
			$("#" + id).children(".reply_cont").remove();
			
			var html = "";
			html += '<div class="editor_wrap" style="display: block;">';
			html += 	'<textarea id="update_cont" style="resize: none; height: 100px; width: 80%;">';
			html += 		reply_cont;
			html += 	'</textarea>';
		    html +=     '<button type="button" class="pi-btn btn_list btnUpdateReply" id="cancelUpdateReply" onclick="showReply()"">취소</button>';
		    html +=     '<button type="button" class="pi-btn btn_list btnUpdateReply" id="sendUpdateReply" data-seq="' + reply_seq + '">수정</button>';
			html += '</div>';
			$("#" + id).append(html);
		});
		
		// update reply
		$(".reply").on("click", "#sendUpdateReply", function() { // delegate
			var reply_seq = $(this).data("seq");
			var reply_cont = $(this).siblings("#update_cont").val();
			console.log("reply_seq: " + reply_seq);
			console.log("reply_cont: " + reply_cont);
		
			$.ajax({
				url: "${cp }/updateReply",
				type: "post",
				data: "reply_seq=" + reply_seq + "&reply_cont=" + reply_cont,
				success: function() {
					showReply(); // 댓글 재로드
				}
			});
		});
		
		// delete reply		
		$(".reply").on("click", ".deleteReply", function() { // delegate
			var reply_seq = $(this).data("seq"); // 삭제할 댓글의 번호
		
			Swal({
				title: '정말 삭제하시겠습니까?',
				type: 'warning',
				showCancelButton: true,
				focusConfirm: false,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '네',
				cancelButtonText: '아니오'
			}).then(function(result) {
				if (result.value) {
					$.ajax({
						url: "${cp }/deleteReply",
						data: "reply_seq=" + reply_seq,
						type: "post",
						success: function(data) {
							showReply();
							Swal({
								title: '삭제되었습니다.',
								type: 'success',
								timer: 1500,
								showConfirmButton: false,
							});
						}
					});
				}
			});
		});
	});
</script>