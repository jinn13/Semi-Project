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
    <link rel="stylesheet" href="${ path }/resources/css/productDetail.css">
    <title>제품 상세 페이지</title>
</head>
<body>
    <div>
    <section>
        <div class="product_box">
            <div class="categories_box">
                <ul>
                    <li>
                        <a href="${ path }/main.jsp">HOME</a>
                    </li>
                    <li>
                        <a href="${ path }/saleboard/salelist">
                            > 
                            목록으로
                        </a>
                    </li>
                </ul>
            </div>
            <div class="product_main_area">
                <section class="product_main">
                    <div class="detail_box">
                        <article class="detail_box_top">
                            <section class="detail_box_area">
                                <div class="photo_area">
                                    <div class="main-img">
                                        <a><img alt="main-img" style="background-color: yellow;" class="main_img" src="${ path }/resources/upload/saleboard/${ SaleBoard.fileSystemName }"></a>
                                    </div>
                                    <!--<div class="img_viewport">
                                        <div class="img_viewport_prev"></div>
                                        <div class="img_viewport_container">
                                            <div class="img_item img_normal_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/item/item24.jpg"></a>
                                            </div>
                                            <div class="img_item img_normal_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/item/item23.jpeg"></a>
                                            </div>
                                            <div class="img_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/blank_img.jpeg"></a>
                                            </div>
                                            <div class="img_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/blank_img.jpeg"></a>
                                            </div>
                                        </div>
                                        <div class="img_viewport_next"></div>
                                    </div>
                                     --> 
                                </div>
                                <div class="item_info">
                                    <div class="item_name_price_info">
                                        <h1 class="item_name">${ SaleBoard.title }</h1>
                                        <div>
                                            <div class="item_price">
                                                ${ SaleBoard.price }
                                                <span>원</span>
                                            </div>
                                            <div class="report_user">
                                                <a href="">
                                                    신고
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item_count_sales_box">
                                        <div class="item_info_count">
                                            <ul>
                                                <li><img src="${ path }/resources/images/wish_heart.png" width="15px" height="15px">0
                                                </li>
                                                <li>조회 <%-- ${ saleBoard.readCount } --%>
                                                </li>
                                                <li>채팅 0
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item_price_description">
                                            <table>
                                                <tbody>
                                                    <tr class="description_sales_table">
                                                        <td class="title">거래방법</td>
                                                        <td class="description">${ SaleBoard.dealStatus }</td>
                                                    </tr>
                                                    <tr class="description_sales_table">
                                                        <td class="title">상품상태</td>
                                                        <td class="description">${ SaleBoard.goodsStatus }</td>
                                                    </tr>
                                                    <tr class="description_sales_table">
                                                        <td class="title">상품상태</td>
                                                        <td class="description">${ SaleBoard.goodsStatus }</td>
                                                   	</tr>
                                                    <tr class="description_sales_table">
                                                        <td class="title">작성일</td>
                                                        <td class="description">${ SaleBoard.createDate }</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="item_sns">
                                        <div class="item_chat">
                                            <button type="button" class="item_chat_submit">1:1채팅하기</button>
                                        </div>
                                        <div class="item_wish">
                                            <button type="button" class="item_wish_myproduct">찜</button>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section>
                                <div class="detail_comment_box">
                                    <div class="detail_comment">
                                        <section class="description">
                                            <h3 class="description_title_h3">
                                                <div class="description_title">상세설명</div>
                                            </h3>
                                            <div class="description_text">${ SaleBoard.content }</div>
                                        </section>
                                        <section class="item_user_info">
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
                                            <div class="users_item_count">
                                                <a href="">
                                                    <span class="users_item_count_title">상품</span>
                                                    <span class="users_item_count_number">10</span>
                                                </a>
                                            </div>
                                            <div class="detail_profile_review">
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
                                        </section>
                                    </div>
                                </div>
                            </section>
                        </article>
                    </div>
                </section>
                <section class="member_comment">
                    <div class="member_comment_count">
                        <section class="comment_count">
                            <span class="comment_count_all">댓글</span>
                            <span>0</span>
                        </section>
                        <section class="input_comment">
                            <div class="cmt_in_box">
                                <textarea type="text" placeholder="댓글을 입력해주세요." class="input_txt"></textarea>
                            </div>
                            <div class="cmt_btn_box">
                                <div class="cmt_send_btn">댓글등록</div>
                            </div>
                        </section>
                    </div>
                </section>
            </div>
        </div>
    </section>
    </div>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />