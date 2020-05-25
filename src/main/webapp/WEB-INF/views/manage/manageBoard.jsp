<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section id="container">
	<div id="contentWrap">
		<section id="content">
			<section class="content_info">
				<!-- 상단 제목 -->
				<h1 class="title">게시판 관리</h1>
			</section>
			<section id="content_detail" class="content_body">
				<h3 class="manage_h3">사용중인 게시판
					<button id="btnInsertBoard" style="float: right;">게시판 생성</button>
				</h3>
				<div class="divManageBoard">
					<!-- 동적 추가 -->
				</div>
				
				<br><br><br>
				
				<h3 class="manage_h3">숨겨진 게시판</h3>
				<div class="divHideBoard">
					<!-- 동적 추가 -->
				</div>
			</section><!--// #content_detail, .content_body -->
		</section><!--// #content -->
	</div><!--// #contentWrap -->
</section><!-- #container -->
<script>
//동적으로 댓글들을 생성하기 위한 함수
	function showBoard() { // .reply 내용 생성
		$.ajax({ // replyList 요청 후 각각 내용 생성
			url: "${cp }/getBoardList",
			type: "post",
		}).done(function(data) {
			$(".divManageBoard").empty(); // 보이는 게시판 내용 제거
			$(".divHideBoard").empty(); // 보이지 않는 게시판 내용 제거
			var htmlShow = '';
			var htmlHide = '';
			
			$.each(data.boardList, function(i, board) {
				if(board.board_stat == 1) { // 보이는 게시판
					htmlShow += "<ul class='ulManageBoard'>";
					htmlShow += "	<li class='liManageBoard' data-seq='" + board.board_seq + "' data-loc='" + board.board_loc
									+ "' data-stat='" + board.board_stat + "' data-write='" + board.board_write
									+ "' data-title='" + board.board_name + "'>";
					htmlShow += "		<span>";
					htmlShow += "			<button type='button' class='btnManageBoard'>" + board.board_name + "</button>";
					htmlShow += "		</span>";
					htmlShow += "		<br>";
					htmlShow += "		<span class='updateForm'></span>";
					htmlShow += "	</li>";
					htmlShow += "</ul>";
				} else { // 숨겨진 게시판
					htmlHide += "<ul class='ulHideBoard'>";
					htmlHide += "	<li class='liHideBoard' data-seq='" + board.board_seq + "'>";
					htmlHide += "		<span>";
					htmlHide += "			<button type='button' class='btnHideBoard'>" + board.board_name + "</button>";
					htmlHide += "		</span>";
					htmlHide += "	</li>";
					htmlHide += "</ul>";
				}
				
			});
			
			$(".divManageBoard").append(htmlShow); // 내용 추가
			$(".divHideBoard").append(htmlHide); // 내용 추가
		});
	};

	$(function() {
		showBoard(); // 보드리스트 출력
		
		// insert board
		$("#btnInsertBoard").on("click", function() {
			var objData = { // 전송할 데이터
// 					"board_seq"   : liTag.data("seq"),
// 					"board_loc"   : liTag.data("loc"),
					"mem_id"	  : "${S_MEM.mem_id }",
					"board_name"  : "새로운 게시판",
					"board_stat"  : "1",
					"board_write" : "0"
			};
			
			$.ajax({ // insert
				url: "${cp }/insertBoard",
				data: objData,
				dataType: "json",
				type: "post",
				success: function() {
					location.reload();
				}
			});
		});
		
		$("body").on("click", ".btnManageBoard", function() {
			// 만들어진 form지우기
			$(".updateForm").empty();
			
			// 위치 지정
			var updateForm = $(this).parent().siblings(".updateForm")
			
			// 상위 요소
			var liTag = updateForm.parent();
			
			// 태그 생성
			var html = "";
			// 방향 버튼
			html += "<button type='button' class='btnLeft'>";
			html += "	<i class='far fa-caret-square-left'></i>";
			html += "</button>"
			html += "<button type='button' class='btnRight'>";
			html += "	<i class='far fa-caret-square-right'></i>";
			html += "</button>"
			// 제목
			html += "<input type='text' class='board_name inputTag' value='" + liTag.data("title") + "'/>";
			// 보이기 여부
			html += "<span class='form-select'>";
			html += "	<span class='selabel'>보이기 여부:</span>";
			html += "	<select class='board_stat inputTag'>";
			if(liTag.data("stat") == 1) {
				html += "		<option value='1' selected>네</option>";
				html += "		<option value='0'>아니오</option>";
			} else {
				html += "		<option value='1'>네</option>";
				html += "		<option value='0' selected>아니오</option>";
			}
			html += "	</select>";
			html += "</span>";
			html += "<br>";
			// 글쓰기 권한
			html += "<span class='form-select'>";
			html += "	<span class='selabel'>글쓰기 권한:</span>";
			html += "	<select class='board_write inputTag'>";
			if(liTag.data("write") == 1) {
				html += "		<option value='0'>관리자</option>";
				html += "		<option value='1' selected>회원</option>";
			} else {
				html += "		<option value='0' selected>관리자</option>";
				html += "		<option value='1'>회원</option>";
			}
			html += "	</select>";
			html += "</span>";
			html += "<br>";
			// 적용 버튼
			html += "<button type='button' class='updateBoard'>적용</button>";
			// 취소 버튼
			html += "<button type='button' class='cancelUpdate'>취소</button>";
			
			// 태그 삽입
			updateForm.append(html);
		});
		
		// 왼쪽 클릭
		$("body").on("click", ".btnLeft", function() {
// 			var liTag = $(this).closest(".liManageBoard");
			
// 			if(liTag.data("loc") == 1) return; // 1이면 왼쪽으로 이동 금지
			
// 			liTag.data("loc", liTag.data("loc")-1);
// 			console.log(liTag.data("loc"));
// 			$(this).parents(".liManageBoard").remove();
		});

		// 오른쪽 클릭
		$("body").on("click", ".btnRight", function() {
			
		});
		
		// 적용
		$("body").on("click", ".updateBoard", function() {
			var liTag = $(this).closest(".liManageBoard"); // 현재 선택된 요소 
			
			var objData = { // 전송할 데이터
					"board_seq"   : liTag.data("seq"),
					"board_loc"   : liTag.data("loc"),
					"mem_id"	  : "${S_MEM.mem_id }",
					"board_name"  : $(liTag).find(".board_name").val(),
					"board_stat"  : $(liTag).find(".board_stat").val(),
					"board_write" : $(liTag).find(".board_write").val()
			};
			
			$.ajax({ // update
				url: "${cp }/updateBoard",
				data: objData,
				dataType: "json",
				type: "post",
				success: function() {
					location.reload();
				}
			});
		});
		
		// 취소
		$("body").on("click", ".cancelUpdate", function() {
			showBoard();
		});
		
		// 미사용 게시판 클릭
		$("body").on("click", ".btnHideBoard", function() {
			var liTag = $(this).closest(".liHideBoard"); // 현재 선택된 요소
			
			Swal({
				title: '사용하시겠습니까?',
				type: 'warning',
				showCancelButton: true,
				focusConfirm: false,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '네',
				cancelButtonText: '아니오'
			}).then(function(result) {
				if (result.value) {
					console.log(liTag.data("seq"));
					$.ajax({ // update
						url: "${cp }/updateBoardStat",
						data: "board_seq=" + liTag.data("seq"),
						type: "post",
						success: function() {
							location.reload();
						}
					});
				}
			});
		});
	});
</script>