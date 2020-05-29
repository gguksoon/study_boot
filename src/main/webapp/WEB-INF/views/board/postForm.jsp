<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <!-- 상단 제목 -->
					<c:choose>
						<c:when test="${empty post }">
							<h2>글쓰기<small>different form elements</small></h2>
						</c:when>
						<c:otherwise>
							<h2>게시글 수정<small>different form elements</small></h2>
						</c:otherwise>
					</c:choose>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="frm" data-parsley-validate class="form-horizontal form-label-left" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                      <!-- 작성자 -->
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="mem_id">작성자</label>
                        <div class="col-md-6 col-sm-6 ">
                          <input type="text" id="mem_id" name="mem_id" value="${S_MEM.mem_id }" readonly class="form-control ">
                        </div>
                      </div>
                      <!-- 제목 -->
                      <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="post_title">제목<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 ">
                          <input type="text" id="post_title" name="post_title" value="${post.post_title }" required="required" class="form-control">
                        </div>
                      </div>
                      <!-- 내용 -->
                      <div class="item form-group">
                        <label for="post_cont" class="col-form-label col-md-3 col-sm-3 label-align">내용</label>
                       <div class="col-md-6 col-sm-6 ">
                          <textarea class="form-control" rows="3" name="post_cont" id="post_cont">${post.post_cont }</textarea>
                        </div>
                      </div>
                      <!-- 첨부할 파일 -->
                      <div class="item form-group">
                        <label for="files" class="col-form-label col-md-3 col-sm-3 label-align">첨부파일</label>
                        <div class="col-md-6 col-sm-6 ">
                          <input id="files" name="files" class="form-control" type="file" multiple="multiple">
                        </div>
                      </div>
                      <c:forEach items="${postFileList }" var="postFile">
                      <div>
                        ${postFile.file_name } 
                        <button type="button" class="deletePostFile" data-seq="${postFile.file_seq }"><i class="far fa-times-circle"></i></button>
                      </div>
                      </c:forEach>

                      <div class="ln_solid"></div>
                      <div class="item form-group" >
                        <div class="col-md-6 col-sm-6 offset-md-6">
                          <!-- 등록 버튼 -->
                          <button type="submit" class="btn btn-secondary">등록</button>
                          <!-- 취소 버튼 -->
                          <c:choose>
                            <c:when test="${empty post }">
                              <button  type="button" class="btn btn-secondary" onclick="location.href='${cp}/postList/${board_seq }/1'">취소</button>
                            </c:when>
                          <c:otherwise>
                              <button  type="button" class="btn btn-secondary" onclick="location.href='${cp}/post/${post.post_seq }'">취소</button>
                          </c:otherwise>
                        </c:choose>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

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