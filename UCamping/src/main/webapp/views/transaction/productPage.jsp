<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>     

<jsp:include page="/views/common/header.jsp">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
        <div class="product_box">
            <div class="categories_box">
                <ul>
                    <li>
                        <a href="Home.html">HOME</a>
                    </li>
                    <li>
                        <a href="bigCategories.html">
                            > 
                            대분류 카테고리
                        </a>
                    </li>
                    <li>
                        <a href="subCategoreis.html">
                            > 
                            중분류 카테고리
                        </a>
                    </li>
                </ul>
            </div>
            <div class="product_main_box">

            </div>
        </div>
        <div class="user_comment">
        </div>
    </section>

</body>
</html>

<jsp:include page="/views/common/footer.jsp" />