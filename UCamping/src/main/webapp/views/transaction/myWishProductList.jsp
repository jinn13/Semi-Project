<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>     

<jsp:include page="/views/common/header.jsp" />
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ path }/resources/css/myWishProductList.css">
    <title>내가 찜한 상품</title>
</head>
<body>
    <div>
    <section>
            <div class="item_list_area">
                <div class="categories_box">
                    <ul>
                        <li>
                            <a href="${ path }/main.jsp">HOME</a>
                        </li>
                        <li>
                            <a href="${ path }/mypage">
                                > 
                                마이페이지
                            </a>
                        </li>
                        <li>
                        	<a href="">
                            	> 
                            	내가 찜한 상품
                        	</a>
                        </li>
                    </ul>
                </div>
                <div class="item_list_main_area">
                        <div class="item_list_main">
                            <div class="my_profile_left">
                                <div class="item_user_info">
                                    <div class="profile_img">
                                        <a href="">
                                            <img class="profile" src="${ path }/resources/images/pro_photo.jpg" alt="users_profile_img">
                                        </a>
                                    </div>
                                    <div class="nick">
                                        <a href="">
                                            ${ saleboard.writerId }
                                        </a>
                                    </div>
                                    <div class="users_count_review">
                                        <div class="users_review_box">
                                            <a href="">
                                                <span class="users_item_count_title">상품</span>
                                                <span class="users_item_count_number">10</span>
                                            </a>
                                        </div>
                                        <div class="users_review_box">
                                            <a href="">
                                                <span class="review_tag">거래후기</span>
                                                <span class="review_count_rating">
                                                    (0)
                                                </span>
                                                <span class="review_count_rating_img">
                                                    <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star1">
                                                    <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star2">
                                                    <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star3">
                                                    <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star4">
                                                    <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star5">
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <section class="left_main my_item_right">
                                <!-- 상품리스트 -->
                                <div class="item_list_content">
                                    <!-- 전체수량 -->
                                    <div class="my_itme_list_count">
                                        전체&nbsp;
                                        <span>4</span>
                                    <!-- 정렬순 -->
                                    <div class="my_categories_box">
                                        <!-- 선택 / 옵션 -->
                                        <div class="checked_delete_box">
                                            <div class="checked_mark">
                                                <input type="checkbox" value="del_check" class="checked_btn" id="chk_all">
                                            </div>
                                            <div class="checked_delete_title">
                                                <button type="button" class="checked_del_btn">선택삭제</button>
                                            </div>
                                        </div>
                                        <div class="categories_sort">
                                        <div class="my_item_list_sort my_item_categorie_sort">
                                            <select>
									            <option value="all" selected>전체</option>
									            <option value="Tent&Tarf">텐트 및 타프</option>
									            <option value="Bedding&Equipment">침구 및 캠핑용품</option>
									            <option value="Furniture&accept">가구 및 수납</option>
									            <option value="Cooking">취사용품</option>
									            <option value="Clothes&Lantern&Stuff">의류/조명/잡화</option>
                                            </select>
                                        </div>
                                        <div class="my_item_list_sort my_item_categorie_sort_wish">
                                            <select>
                                                <option value>찜한 상품순</option>
                                                <option value="high-wish">찜 많은 상품순</option>
                                                <option value="lowprice">저가순</option>
                                                <option value="highprice">고가순</option>
                                            </select>
                                        </div>
                                        </div>
                                    </div>
                                    </div>
                                    <!-- 상품영역 -->
                                    <div class="my_item_content">
                                            <ul class="main_row profile_main_row">
                                                <li class="main_col_3">
                                                    <a class="card card_list" href="">
                                                        <div class="card_box">
                                                            <div class="img_wrap">
                                                                <div class="img_outside_box">
                                                                    <div class="img_box">
                                                                        <img class="thumbnail_img" src="${ path }/resources/images/item/item26.jpg" alt="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="cont">
                                                                <div class="item_title">${ saleboard.title }</div>
                                                                <div class="item_price profile_price">
                                                                    ${ saleboard.price }
                                                                    원
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <div class="img_wish_box">
                                                        <input type="checkbox" name="chk" value="del_check" class="wish_check_btn">
                                                    </div>
                                                </li>
                                           	</ul>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    </div>
    <script src="./lib/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="${ path }/resources/js/myWishProduct.js"></script>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />