<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="container d-flex">

      <div class="logo mr-auto">
<!--         <h1 class="text-light"><a href="index.html">Flattern</a></h1> -->
        <!-- Uncomment below if you prefer to use an image logo -->
        <a href="${cp }/"><img src="${cp }/Flattern/assets/img/logo.png" alt="" class="img-fluid"></a>
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <!-- 아래 active~~가 없으니 첫번째 회사소개 드롭다운이 오른쪽으로 쏠림 그래서 가로0px 유지 -->
          <li class="active"><a href=""></a></li>
          	<c:forEach items="${S_BOARDLIST }" var="board">
          		<c:if test="${board.board_stat == 1 }">
	          		<li><a href="${cp }/postList/${board.board_seq }/1">${board.board_name }</a></li>
          		</c:if>
			</c:forEach>
			<c:if test="${S_MEM.grade == 0 }">
				<li class="drop-down"><a href="">관리</a>
					<ul>
						<li><a href="${cp }/manageBoard">게시판</a></li>
					</ul>
				</li>
			</c:if>
<!--           <li class="drop-down"><a href="">Drop Down</a> -->
<!--             <ul> -->
<!--               <li><a href="#">Drop Down 1</a></li> -->
<!--               <li class="drop-down"><a href="#">Drop Down 2</a> -->
<!--                 <ul> -->
<!--                   <li><a href="#">Deep Drop Down 1</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 2</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 3</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 4</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 5</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li><a href="#">Drop Down 3</a></li> -->
<!--               <li><a href="#">Drop Down 4</a></li> -->
<!--               <li><a href="#">Drop Down 5</a></li> -->
<!--             </ul> -->
<!--           </li> -->
			<c:choose>
				<c:when test="${empty S_MEM }">
		          <li id="login"><a href="${cp }/login">로그인</a></li>
				</c:when>
				<c:otherwise>
		          <li id="logout"><a href="${cp }/logout">로그아웃</a></li>				
				</c:otherwise>
			</c:choose>
        </ul>
      </nav><!-- .nav-menu -->

    </div>