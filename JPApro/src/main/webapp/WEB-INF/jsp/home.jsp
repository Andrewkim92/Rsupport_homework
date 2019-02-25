<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>home</title>

</head>

<script>
	var boardCnt = 0;
	
	if(${fn:length(voList.content) }>0){
		boardCnt  = ${fn:length(voList.content) };
		
	}else{
		
	}
	
</script>
<body>
	<h1>
		<button>
			<a href="/">홈 home</a>
		</button>
	</h1>

	<button>
		<a href="writeBoard">공지사항 등록</a>
	</button>
	<div id="boardArea">
		<table id="bList" width="800" border="3" bordercolor="lightgray">
			<tr heigh="30">
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성시간</td>
				<td>최근 수정시간</td>
			</tr>

			<c:forEach var="board" items="${voList.content}">
				<tr>
					<td>${board.id}</td>
					<td><a href="detailBoard?id=${board.id }">${board.subject}</a></td>
					<td>${board.writer}</td>
					<td>${board.createdDate}</td>
					<td>${board.modifiedDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="searchArea">
		<form id="searchForm" method="GET" action="searchBoardPage">
			<select name="opt">
				<option value="subject">제목</option>
				<option value="createdDate">작성일</option>
				<option value="writer">작성자</option>
				<option value="modifiedDate">최종수정일</option>
				<option value="content">내용</option>
			</select> <input type="text" size="20" name="condition" />&nbsp; <input
				type="submit" value="검색" />
		</form>
	</div>
	<div id="pageNumArea">
		<div class="pager">
<!--         <ul> -->
        		<c:if test="${hasPrevious}">
                       <a href="/?page=${curPageNum-1}">◀</a>
               </c:if> 
<%--                <c:if test="${ boardCnt > 5 && !empty kwd }"> --%>
<%--                        <li><a href="searchBoardPage?page=${ blockStartNum - 1 }&kwd=${ kwd }">◀</a></li> --%>
<%--                </c:if> --%>
<%--                <c:if test="${ boardCnt > 5 }"> --%>
<%--                        <li><a href="/mysite/board?page=${ blockStartNum - 1 }">◀</a></li> --%>
<%--                </c:if> --%>
               
                       <c:forEach var="i" begin="${startPage}" end="${ endPage }">
                              <c:choose>
<%--                                       <c:when test="${ i > lastPageNum }"> --%>
<%--                                              <li>${ i }</li> --%>
<%--                                       </c:when> --%>
                                      <c:when test="${ i == curPageNum+1}">
                                             ${i}
                                      </c:when>
<%--                                       <c:when test="${ !empty kwd}"> --%>
<%--                                              <li><a href="/searchBoardPage?a=search&page=${ i }&condition=${ condition }">${ i }</a></li> --%>
<%--                                       </c:when> --%>
                                      <c:otherwise>
                                             <a href="/?page=${ i-1 }">${ i }</a>
                                      </c:otherwise>
                              </c:choose>
                       </c:forEach>
                       
               <c:if test="${hasNext}">
                       <a href="/?page=${ curPageNum+1}">▶</a>
               </c:if>        
<%--                <c:if test="${ lastPageNum > blockLastNum && !empty kwd }"> --%>
<%--                        <li><a href="/mysite/board?a=search&page=${ blockLastNum + 1 }&kwd=${ kwd }">▶</a></li> --%>
<%--                </c:if> --%>
<%--                <c:if test="${ lastPageNum > blockLastNum }"> --%>
<%--                        <li><a href="/mysite/board?page=${ blockLastNum + 1 }">▶</a></li> --%>
<%--                </c:if> --%>
<!--         </ul> -->
</div>  

	</div>
</body>
</html>