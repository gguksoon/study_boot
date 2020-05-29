<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
            </div>
              <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>${board.board_name}  
                    	<small>					
							<span class="total_page">전체 <b>${postTotalCnt }건</b> </span>
							<span class="current_page">현재 페이지 <b>${page }</b></span>/<strong>${pageTotalCnt}</strong>
						</small>
					</h2>
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content">

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th class="column-title">번호 </th>
                            <th class="column-title">제목 </th>
                            <th class="column-title">작성자 </th>
                            <th class="column-title">작성일 </th>
                            <th class="bulk-actions" colspan="4">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                         <c:forEach items="${postList }" var="post">
							<c:if test="${post.post_stat eq 1 }">
	                          <tr class="even pointer" id="${post.post_seq }">
								<td>${post.post_seq }</td>
								<td>${post.post_title }</td>
								<td>${post.mem_id }</td>
								<td><fmt:formatDate value="${post.post_reg }" pattern="yyyy/MM/dd HH:mm"/></td>
	                          </tr>
							</c:if>
						</c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                <!-- pagination -->  
				<div class="actionBar" style="text-align: center;">
				  <div class="btn-group mr-2" role="group" aria-label="First group">
					<!--   "<<"   -->
					<c:choose>
						<c:when test="${page <= 1 }">
							<button type="button" class="btn btn-secondary">
								<i class="fa fa-angle-double-left"></i>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-secondary" onclick="location.href='${cp }/postList/${board.board_seq }/1'">
								<i class="fa fa-angle-double-left"></i>
							</button>
						</c:otherwise>
					</c:choose>
					

					<!--   "<"   -->
					<c:choose>
						<c:when test="${page <= 1 }">
							<button type="button" class="btn btn-secondary">
								<i class="fa fa-angle-left"></i>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-secondary" onclick="location.href='${cp }/postList/${board.board_seq }/${page - 1 }'">
								<i class="fa fa-angle-left"></i>
							</button>
						</c:otherwise>
					</c:choose>

					<!--   "page"   -->
					<c:forEach begin="1" end="${pageTotalCnt }" var="i">
							<c:choose>
								<c:when test="${i eq page }">
									<button type="button" class="btn btn-secondary">
										<strong style="font-size: 22px;">${i }</strong>	
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-secondary" onclick="location.href='${cp }/postList/${board.board_seq }/${i }'">
										${i }
									</button>
								</c:otherwise>
							</c:choose>
					</c:forEach>

					<!--   ">"   -->
					<c:choose>
						<c:when test="${page == pageTotalCnt }">
							<button type="button" class="btn btn-secondary">
								<i class="fa fa-angle-right"></i>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-secondary" onclick="location.href='${cp }/postList/${board.board_seq }/${page + 1 }'">
								<i class="fa fa-angle-right"></i>
							</button>
						</c:otherwise>
					</c:choose>

					<!--   ">>"   -->
					<button type="button" class="btn btn-secondary" onclick="location.href='${cp }/postList/${board.board_seq }/${pageTotalCnt}'">
						<i class="fa fa-angle-double-right"></i>
					</button>
					
				</div>
					<!-- 글쓰기 버튼 -->
					<c:if test="${S_MEM.grade == 0 or board.board_write == 1}">
						<button type="button" id="insertPost" class="btn btn-secondary" value="글쓰기" style="float: right;">글쓰기</button>
					</c:if>

                </div>
                </div>
              </div>
            </div>
          </div>

<!-- js -->
<form id="frm" method="post"></form>
<script>
	$(function() {
		$("#insertPost").on("click", function() {
			$("#frm").attr("action", "${cp }/postForm");
			$("#frm").append("<input type='hidden' name='board_seq' value='${board.board_seq }'/>");
			$("#frm").submit();
		});
		
		$("body").on("click", ".even", function() {
			location.href='${cp }/post/' + $(this).attr("id");
		});
	});
</script>