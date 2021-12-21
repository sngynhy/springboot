<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${b_type eq 'info'}">
		<h3 class="title-underline">정보 공유 게시판</h3>
		<div class="common-btn-area">
			<form method="post" action="/getBoardList.do">
				<select name="cate_id" class="category-btn-area" onchange="changeCateId(this)">
				<c:forEach var="v" items="${sidebarData.cateData}">
					<c:if test="${cate_id eq v.cate_id}">
						<option value="${v.cate_id}" selected>${v.category}</option>
					</c:if>
					<c:if test="${cate_id ne v.cate_id}">
						<option value="${v.cate_id}">${v.category}</option>
					</c:if>
				</c:forEach>
				</select>
			</form>
		</div>
	</c:when>
	<c:when test="${b_type eq 'ask'}">
		<h3 class="title-underline">자유 질문 게시판</h3>
	</c:when>
	<c:when test="${b_type eq 'review'}">
		<h3 class="title-underline">여행 후기 게시판</h3>
		<div class="common-btn-area">
		<form method="post" action="/getBoardList.do">
			<select name="n_id" class="category-btn-area" onchange="changeN_Id(this)">
			<c:forEach var="v" items="${sidebarData.nationData}">
				<c:if test="${n_id eq v.n_id}">
					<option value="${v.n_id}" selected>${v.nation}</option>
				</c:if>
				<c:if test="${n_id ne v.n_id}">
					<option value="${v.n_id}">${v.nation}</option>
				</c:if>
			</c:forEach>
			</select>
		</form>
		</div>
	</c:when>
</c:choose>