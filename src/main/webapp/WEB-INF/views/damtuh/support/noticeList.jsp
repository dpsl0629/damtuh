<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="contents">
	<div class="notice-box">
		<div class="search-form">
			<form id="search-form" action="${contextPath}/support/noticeList"
				method="get">
				<div class="search-form-box">
					<div class="search-form-select">
						<select title="검색 필터 선택" name="type">
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' :'' }"/>>전체</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' :'' }"/>>내용</option>
						</select>
					</div>
					<div class="search-form-inp">
						<input type="text" name="keyword" title="검색어를 입력해 주세요"
							placeholder="검색어를 입력해 주세요"
							value="<c:out value='${pageMaker.cri.keyword}'/>"> <input
							type="hidden" value="<c:out value='${pageMaker.cri.pageNum }'/>"
							name="pageNum" value="${pageMaker.cri.pageNum }"> <input
							type="hidden" value="<c:out value='${pageMaker.cri.amount }'/>"
							name="amount" value="${pageMaker.cri.amount }">
						<button type="button" class="search-form-btn">검색</button>
					</div>
				</div>
			</form>
		</div>
		<div class="board">
			<div class="board-header">
				<ul class="board-lst">
					<li class="board-item"><span class="board-col num">번호</span> <span
						class="board-col tit">제목</span> <span class="board-col date">등록일</span>
						<span class="board-col file">첨부파일</span> <span
						class="board-col hits">조회수</span></li>
				</ul>
			</div>
			<div class="board-body">
				<ul class="board-lst">
					<c:choose>
						<c:when test="${list == null }">
							<p>게시글이 없습니다.</p>
						</c:when>
						<c:when test="${list != null}">
							<c:forEach items="${list}" var="board">
								<li class="board-item"><span class="board-col num">
										<span class="opt-screen-out">번호</span> <span
										class="notice-num"><c:out value="${board.bno}" /></span>
								</span> <span class="board-col tit opt-tl opt-dotline"> <span
										class="opt-screen-out">제목</span> <a class="move"
										href="<c:out value='${board.bno }'/>"><c:out
												value="${board.title}" /> </a>
								</span> <span class="board-col date"> <span
										class="opt-screen-out">등록일</span> <fmt:formatDate
											pattern="yyyy-MM-dd" value="${board.writeDate}" />
								</span> <span class="board-col file"> <span
										class="opt-screen-out">첨부파일</span> <c:choose>
											<c:when test="${board.attach==1}">
												<span class="ico-file" title="첨부파일 있음"><img
													src="${contextPath }/resources/images/sub/attach.png" /></span>
											</c:when>
										</c:choose>
								</span> <span class="board-col hits"> <span
										class="opt-screen-out">조회수</span> <c:out value="${board.hits}" />
								</span></li>
							</c:forEach>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<form id="write-form" action="${contextPath }/support/noticeWrite"
				method="get">
				<div class="btn-box right-box opt-clearfix">
					<a href="${contextPath}/support/noticeWrite" class="btn-green"
						type="button">글쓰기</a>
				</div>
			</form>
		</sec:authorize>
		<div class="paging">
			<div class="paging-box">
				<c:if test="${pageMaker.prev }">
					<a href="${pageMaker.startPage-1 }" class="paging-item prev"><span
						class="opt-screen-out">이전</span></a>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage }">
					<a href="${num}"
						class="paging-item ${pageMaker.cri.pageNum == num ? 'active':''}">${num }</a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a href="${pageMaker.endPage + 1 }" class="paging-item next"><span
						class="opt-screen-out">다음</span></a>
				</c:if>
			</div>
		</div>

		<form id="action-form" action="${contextPath }/support/noticeList"
			method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						var actionForm = $("#action-form");

						$(".paging-item").on(
								"click",
								function(e) {
									e.preventDefault();

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move").on("click",function(e) {
							e.preventDefault();

							actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
							actionForm.attr("action","/support/noticeView");
							actionForm.submit();
						});

						var searchForm = $("#search-form");

						$("#search-form").on("click","button", function(e) {
	
								if (!searchForm.find(
										"input[name='keyword']").val()) {
									alert("키워드를 입력하세요.");
									return false;
								}
	
								searchForm.find("input[name='pageNum']")
										.val("1");
								e.preventDefault();
	
								searchForm.submit();
							});
					});
</script>