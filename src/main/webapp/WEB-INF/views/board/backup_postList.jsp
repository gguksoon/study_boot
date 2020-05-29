<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form id="frm" method="post"></form>

<section id="container">
	<div id="contentWrap">
		<section id="content">
			<section class="content_info">
				<h1 class="title">${board.board_name}</h1>
			</section>
			<section id="content_detail" class="content_body">
				<div class="board_info">
					<div class="Search_rss">
						<form action="http://www.duegosystem.com/sub0402/redirect" class="board-form" method="post" accept-charset="utf-8">
							<input type="hidden" name="redirect" value="/sub0402/index" style="display:none;" />
							<input type="hidden" name="encoding" value="1" style="display:none;" />
							<input type="hidden" name="csrf_test_name" value="2551cf48cf4f4f40e51e62b5180f5784" style="display:none;" />
							<input type="hidden" name="history" value="/sub0402/index" style="display:none;" />
<!-- 							<fieldset> -->
<!-- 								<input type="hidden" name="search_order" value=""  id="search_order" /> -->
<!-- 								<span class="form-select"> -->
<!-- 									<select name="search_field"  title="검색어 분류를 선택하세요."  id="search_field" > -->
<!-- 										<option value="A.subject+A.contents" >제목+내용</option> -->
<!-- 										<option value="A.subject" >제목</option> -->
<!-- 										<option value="A.contents" >내용</option> -->
<!-- 										<option value="A.name" >작성자</option> -->
<!-- 									</select> -->
<!-- 								</span> -->
<!-- 								<span class="form-input"><input type="text" name="search_keyword" value=""  placeholder="검색어를 입력하세요(구현중)" title="검색어를 입력하세요" id="search_keyword" /></span> -->
<!-- 								<span class="form-btn"><button  type="submit" class="pi-btn Btn-Gray Xs"> 검색</button></span> -->
<!-- 							</fieldset> -->
						</form>
					</div>
					<p class="page_info">
						<span class="total_page">전체 <b>${postTotalCnt }건</b> </span>
						<span class="current_page">현재 페이지 <b>${page }</b></span>/<strong>${pageTotalCnt}</strong>
					</p>
				</div>
				<div class="tstyle_list">
					<div class="IR">공지사항 목록</div>
					<div class="dhead">
						<ul>
							<li class="W8 ">번호</li>
							<li class="title">제목</li>
<!-- 							<li class="W10">첨부파일</li> -->
							<li class="W10">작성자</li>
							<li class="W13">등록일</li>
						</ul>
					</div>
					<div class="dbody" id="listView">
						<c:forEach items="${postList }" var="post">
							<c:if test="${post.post_stat eq 1 }">
								<ul class="notice1">
									<li class="W8">${post.post_seq }</li>
									<li class='title' aria-title='제목'>
										<a href='${cp }/post/${post.post_seq}'>${post.post_title }</a>
									</li>
										<li class='W10 m-br file' aria-title='첨부파일'></li>
										<li class='W10 nowrap m-br' aria-title="작성자">${post.mem_id }</li>
										<li class='W10 m-br' aria-title="등록일">
											<fmt:formatDate value="${post.post_reg }" pattern="yyyy/MM/dd HH:mm"/>
										</li>
								</ul>
							</c:if>
						</c:forEach>
					</div>
				</div>
				
				<!-- pagination -->  
				<div class="board_pager">
					<!--   "<<"   -->
					<a href="${cp }/postList/${board.board_seq }/1" class="pageFirst" title="첫페이지">
						<i class="fas fa-angle-double-left"></i>
					</a>

					<!--   "<"   -->
					<c:choose>
						<c:when test="${page <= 1 }">
							<a href="" class="pagePrev" title="이전페이지"><i class="fas fa-angle-left"></i></a>
						</c:when>
						<c:otherwise>
							<a href="${cp }/postList/${board.board_seq }/${page - 1 }" class="pagePrev" title="이전페이지"><i class="fas fa-angle-left"></i></a>
						</c:otherwise>
					</c:choose>

					<!--   "page"   -->
					<c:forEach begin="1" end="${pageTotalCnt }" var="i">
						<c:choose>
							<c:when test="${i eq page }">
								<a href="#" class="pageNow" title="${i }페이지"><strong>${i }</strong></a>
							</c:when>
							<c:otherwise>
								<a href="${cp }/postList/${board.board_seq }/${i }" class="pageNone" title="${i }페이지">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!--   ">"   -->
					<c:choose>
						<c:when test="${page == pageTotalCnt }">
							<a href="" class="pageNext" title="다음페이지"><i class="fas fa-angle-right"></i></a>
						</c:when>
						<c:otherwise>
							<a href="${cp }/postList/${board.board_seq }/${page + 1 }" class="pageNext" title="다음페이지"><i class="fas fa-angle-right"></i></a>
						</c:otherwise>
					</c:choose>

					<!--   ">>"   -->
					<a href="${cp }/postList/${board.board_seq }/${pageTotalCnt}" class="pageLast" title="마지막페이지"><i class="fas fa-angle-double-right"></i></a>
				</div>

				<div class="BtnArea">
					<c:if test="${S_MEM.grade == 0 or board.board_write == 1}">
						<button type="button" id="insertPost" class="pi-btn btn_list" value="글쓰기">글쓰기</button>
					</c:if>
				</div>
			</section>
			<!--// #content_detail, .content_body -->
		</section>
		<!--// #content -->
	</div>
<!--// #contentWrap -->
</section><!-- #container -->

<!-- js -->
<script>
	$(function() {
		$("#insertPost").on("click", function() {
			$("#frm").attr("action", "${cp }/postForm");
			$("#frm").append("<input type='hidden' name='board_seq' value='${board.board_seq }'/>");
			$("#frm").submit();
		});
	});
</script>