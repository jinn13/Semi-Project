<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>     

<jsp:include page="/views/common/header.jsp" />      

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/buygoods.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>
    <div id="categories">
        <select id="categories2">
            <option value="all" selected>전체</option>
            <option value="Tent&Tarf">텐트 및 타프</option>
            <option value="Bedding&Equipment">침구 및 캠핑용품</option>
            <option value="Furniture&accept">가구 및 수납</option>
            <option value="Cooking">취사용품</option>
            <option value="Clothes&Lantern&Stuff">의류/조명/잡화</option>
        </select>
    </div>
    <div>
        <table class="buygoods" id="tbl-board">
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td id="images" colspan="" rowspan="5" width="370px" height="">
                            <img src="./semi.resources/images/텐트.jpg" width="318px" height="174px"/>
                        </td>
                        <td style="font-size: 18px;" id="title"colspan="2" width="646px" height="35px">에버닌 팝업텐트 L(4~5)인용 감성 캠핑 원터치텐트</td>   
                    </tr>
                    <tr>
                        <td></td>
                        <td style="font-size: 16px;" width="200px"><img src="./semi.resources/images/icons8-star-96.png" width="20" height="20"> 관심상품 등록</td>
                    </tr>
                    <tr>
                        
                        <td width="646px" style="font-size: 16px;">사 놓고 얼마 쓸 일이 없어 판매하게 됐습니다</td>
                        
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">가격 : 100,000원</td>
                        <td width="200px" style="font-size: 16px;"><img src="./semi.resources/images/icons8-chat-64.png" width="20" height="20"> 채팅 보내기</td>
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">판매자 : yss</td>
                        
                    </tr>
                    <tr></tr>
                    
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td id="images" colspan="" rowspan="5" width="370px" height="">
                            <img src="./semi.resources/images/텐트.jpg" width="318px" height="174px"/>
                        </td>
                        <td style="font-size: 18px;" id="title"colspan="2" width="646px" height="35px">에버닌 팝업텐트 L(4~5)인용 감성 캠핑 원터치텐트</td>   
                    
                    </tr>
                    <tr>
                        <td></td>
                        <td style="font-size: 16px;" width="200px"><img src="./semi.resources/images/icons8-star-96.png" width="20" height="20"> 관심상품 등록</td>
                    </tr>
                    <tr>
                        
                        <td width="646px" style="font-size: 16px;">사 놓고 얼마 쓸 일이 없어 판매하게 됐습니다</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">가격 : 100,000원</td>
                        <td width="200px" style="font-size: 16px;"><img src="./semi.resources/images/icons8-chat-64.png" width="20" height="20"> 채팅 보내기</td>
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">판매자 : yss</td>
                        <td></td>
                    </tr>
                    <tr></tr>

                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td id="images" colspan="" rowspan="5" width="370px" height="">
                            <img src="./semi.resources/images/텐트.jpg" width="318px" height="174px"/>
                        </td>
                        <td style="font-size: 18px;" id="title"colspan="2" width="646px" height="35px">에버닌 팝업텐트 L(4~5)인용 감성 캠핑 원터치텐트</td>   

                    </tr>
                    <tr>
                        <td></td>
                        <td style="font-size: 16px;" width="200px"><img src="./semi.resources/images/icons8-star-96.png" width="20" height="20"> 관심상품 등록</td>
                    </tr>
                    <tr>
                        
                        <td width="646px" style="font-size: 16px;">사 놓고 얼마 쓸 일이 없어 판매하게 됐습니다</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">가격 : 100,000원</td>
                        <td width="200px" style="font-size: 16px;"><img src="./semi.resources/images/icons8-chat-64.png" width="20" height="20"> 채팅 보내기</td>
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">판매자 : yss</td>
                        <td></td>
                    </tr>
                    <tr></tr>

                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <td id="images" colspan="" rowspan="5" width="370px" height="">
                            <img src="./semi.resources/images/텐트.jpg" width="318px" height="174px"/>
                        </td>
                        <td style="font-size: 18px;" id="title"colspan="2" width="646px" height="35px">에버닌 팝업텐트 L(4~5)인용 감성 캠핑 원터치텐트</td>   
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td style="font-size: 16px;" width="200px"><img src="./semi.resources/images/icons8-star-96.png" width="20" height="20"> 관심상품 등록</td>
                    </tr>
                    <tr>
                        
                        <td width="646px" style="font-size: 16px;">사 놓고 얼마 쓸 일이 없어 판매하게 됐습니다</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">가격 : 100,000원</td>
                        <td width="200px" style="font-size: 16px;"><img src="./semi.resources/images/icons8-chat-64.png" width="20" height="20"> 채팅 보내기</td>
                    </tr>
                    <tr>
                        <td style="font-size: 16px;">판매자 : yss</td>
                        <td></td>
                    </tr>
                    <tr></tr>

                    
        </table>
    </div>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />