<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="container">
	<div id="contentWrap">
		<section id="content">
			<section class="content_info">
				<!-- 상단 제목 -->
				<c:choose>
					<c:when test="${empty post }">
						<h1 class="title">글쓰기</h1>
					</c:when>
					<c:otherwise>
						<h1 class="title">게시글 수정</h1>
					</c:otherwise>
				</c:choose>
			</section>
			<section id="content_detail" class="content_body">
				<form id="frm" class="save-form" method="post" accept-charset="utf-8" enctype="multipart/form-data">
<%-- 					<input type="hidden" name="board_seq" id="board_seq" value="${board_seq }"/>  --%>
<%-- 					<input type="hidden" name="post_seq" id="post_seq" value="${post.post_seq}"/>  --%>
					<div class="writeForm">
						<table class="tstyle_write">
							<colgroup><col width="10%"><col></colgroup>
							<tbody>
								<tr> <!-- 작성자 -->
									<th scope="row"><label for="name">작성자</label></th>
									<td><input type="text" name="mem_id" value="${S_MEM.mem_id }"  id="mem_id" readonly/></td>
								</tr>
								<tr> <!-- 제목 -->
									<th scope="row"><label for="subject">제목<span class="star" title="필수입력 항목"> *</span></label></th>
									<td><input type="text" style="width: -webkit-fill-available;" name="post_title" value="${post.post_title }"  maxlength="100" class="w100" title="제목을 입력하세요" placeholder="제목을 입력하세요" id="post_title" /></td>
								</tr>
								<tr> <!-- 내용 -->
									<th scope="row"><label for="content_textarea">내용</label></th>
									<td class="tb_contents">
										<div class='editor_wrap'>
											<textarea name="post_cont" id="post_cont" title="내용을 입력하세요">${post.post_cont }</textarea>
										</div>
									</td>
								</tr>
								<tr> <!-- 첨부 할 파일 -->
									<th scope="row" style="border-bottom: none;"><label for="files">첨부파일</label></th>
									<td style="border-bottom: none;"><input type="file" multiple="multiple" id="files" name="files" placeholder="첨부파일"></td>
								</tr>
								<tr> <!-- 첨부된 파일 리스트 -->
									<th></th>
									<td>
										<c:forEach items="${postFileList }" var="postFile">
											<div>
												${postFile.file_name } 
												<button type="button" class="deletePostFile" data-seq="${postFile.file_seq }"><i class="far fa-times-circle"></i></button>
											</div>
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="BtnArea">
						<!-- 등록 버튼 -->
						<button type="submit" class="pi-btn btn_submit">등록</button>
						<!-- 취소 버튼 -->
						<c:choose>
							<c:when test="${empty post }">
								<button  type="button" class="pi-btn btn_submit" onclick="location.href='${cp}/postList/${board_seq }/1'">취소</button>
							</c:when>
							<c:otherwise>
								<button  type="button" class="pi-btn btn_submit" onclick="location.href='${cp}/post/${post.post_seq }'">취소</button>
							</c:otherwise>
						</c:choose>
					</div>
				</form>
			</section><!--// #content_detail, .content_body -->
		</section><!--// #content -->
	</div><!--// #contentWrap -->
</section><!-- #container -->

<script>
	$(function() {
		// insert, update를 결정
		if(${post == null}) {
			$("#frm").attr("action", "${cp }/insertPost");
			$("#frm").append("<input type='hidden' name='board_seq' value='${board_seq }'/>");
		} else {
			$("#frm").attr("action", "${cp }/updatePost");
			$("#frm").append("<input type='hidden' name='post_seq' value='${post.post_seq }'/>");
		}
		
		// deletePostFile
		$(".deletePostFile").on("click", function() {
			var clickedBtn = $(this); 
			var file_seq = $(this).data("seq");
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
						url: "${cp }/deletePostFile",
						data: "file_seq=" + file_seq,
						type: "post",
						success: function(data) {
							Swal({
								title: '삭제되었습니다.',
								type: 'success',
								timer: 1500,
								showConfirmButton: false
							});
							clickedBtn.parent().remove(); // html에서 삭제
						}
					});
				}
			});
		});
	});
</script>