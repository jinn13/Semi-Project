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
<link rel="stylesheet" href="${ path }/resources/css/sellgoods.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<form action="${ pageContext.request.contextPath }/board/salewrite" method="post"
		enctype="multipart/form-data">
    <div>
        <div style="font-weight: bold; font-size:30px;
            text-align: center;" class="" spellcheck="false">판매하기</div>
            <br>
        <table id="tbl-sellgoods"class="goodsregist">
        	<!--<tr>
                <th>판매자</th>
                <td style="width:100px;"></td>
                <td><textarea id="selltext" name="writerNo" value="${ loginMember.id }" readonly></textarea></td>
            </tr>-->
        
            <tr>
                <th>상품명</th>
                <td style="width:100px;"></td>
                <td><textarea id="selltext" name="title" placeholder="상품명을 입력해주세요."></textarea></td>
            </tr>

            <tr>
                <th>가격</th>
                <td style="width:100px;"></td>
                <td><textarea id="selltext" name="price" placeholder="희망 가격을 입력해주세요."></textarea></td>
            </tr>

            <tr>
                <th>카테고리</th>
                <td style="width:100px;"></td>
                <td>
                	<c:if test="${ category =='TentAndTarf' }">
                		<label><input type="radio" name="category" value="TentAndTarf" checked>텐트 및 타프</label>
                	</c:if>
                	<c:if test="${ category !='TentAndTarf' }">
                		<label><input type="radio" name="category" value="TentAndTarf">텐트 및 타프</label>
                	</c:if>
                	<c:if test="${ category =='BeddingAndEquipment' }">
                	    <label><input type="radio" name="category" value="BeddingAndEquipment" checked>침구 및 캠핑용품</label>
                	</c:if>
                	<c:if test="${ category !='BeddingAndEquipment' }">
                		<label><input type="radio" name="category" value="BeddingAndEquipment">침구 및 캠핑용품</label>
                	</c:if>
                	<c:if test="${ category =='FurnitureAndAccept' }">
                		<label><input type="radio" name="category" value="FurnitureAndAccept" checked>가구 및 수납</label><br>
                	</c:if>
                	<c:if test="${ category !='FurnitureAndAccept' }">
                		<label><input type="radio" name="category" value="FurnitureAndAccept">가구 및 수납</label><br>
                	</c:if>
                	<c:if test="${ category =='Cooking' }">
                		<label><input type="radio" name="category" value="Cooking" checked>취사용품</label>
                	</c:if>
                	<c:if test="${ category !='Cooking' }">
                		<label><input type="radio" name="category" value="Cooking">취사용품</label>
                	</c:if>
                	<c:if test="${ category =='ClothesAndLanternAndStuff' }">
                		<label><input type="radio" name="category" value="ClothesAndLanternAndStuff" checked>의류/조명/잡화</label>
                	</c:if>
                	<c:if test="${ category !='ClothesAndLanternAndStuff' }">
                		<label><input type="radio" name="category" value="ClothesAndLanternAndStuff">의류/조명/잡화</label>
                	</c:if>
                </td>
            </tr>

            <tr>
                <th rowspan="2">상품 이미지</th>
                <td class="goodsimage" style="width:100px;"></td>
                <td class="goodsimage">
                    <!--<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/> 
                    <div id="image_container"></div>-->
                    <div id='image_preview'>
                    <input type='file' id='btnAtt' name="upfile" multiple='multiple' />
                    <div id='att_zone'
                        data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width:100px;"></td>
                <td class="goodsimage1">상품의 상태를 확인할 수 있도록 전체 사진을 찍어주세요.<br>
                    (이미지 1개 이상 첨부 필수, 4장까지만 업로드 해주세요. 
                    저작권이 있는 이미지 또는 타 회원의 상품 이미지 사용 불가)</td>
            </tr>

            <tr>
                <th>상품 상태</th>
                <td style="width:100px;"></td>
                <td>
                    <div class="state" style="width:100px;">
                        <label><input type="radio" name="goodsStatus" value="NOP">미개봉</label>
                    </div>
                    <div class="state" style="width:110px;">
                        <label><input type="radio" name="goodsStatus" value="NEW">거의 새 것</label>
                    </div>
                    <div class="state" style="width:100px;">
                        <label><input type="radio" name="goodsStatus" value="USD">사용감 있음</label>
                    </div>
                </td>
            </tr>

            <tr>
                <th>배송방법</th>
                <td style="width:100px;"></td>
                <td>
                    <div class="dealtype" style="width:100px;">
                        <label><input type="checkbox" name="dealStatus" value="MAIL">택배</label>
                    </div>
                    <div class="dealtype" style="width:130px;">
                        <label><input type="checkbox" name="dealStatus" value="DRCT">만나서 거래</label>
                    </div>
                    <div class="dealtype" style="width:100px;">
                        <label><input type="checkbox" name="dealStatus" value="SAFE">안전거래</label>
                    </div>
                </td>
            </tr>
        </table>
        <br>
        <div class="sellnotice">
            <div class="sellnotice1">
                            1. 개인거래이므로 만나서 거래 혹은 안전거래를 부탁드리며 거래의 모든 책임은 거래 당사자간에 있습니다. <br>
                            2. 판매양식을 변경 또는 수정할 경우, 본인이 찍은 사진이 아닌 경우, 판매 이외의 글 및 질문은 삭제처리됩니다.<br>
                            3. 외부링크, 카톡, 밴드, 댓글로만 거래유도 시 조심하세요.<br><br>
                            
                            * 게시판에 등록된 게시물에 대해서는 인증상품이 아닌 회원님들이 직접 등록하신 것의 개인간 거래에 대해서는<br>
                            (주)UCamping에서는 중재 및 책임을 지지 않습니다.<br>
            </div>
        </div>
        <br>
        <div class="goodsinfo">
            <textarea class="goodsinfo1" name="content" placeholder="상품의 정보를 입력해주세요."></textarea>
        </div>
        
    </div>

    <div id="btns">
        
            <input type="reset" id="resetbtn" value="초기화">
            <input type="submit" id="registbtn" value="작성하기">
        
            <!--<button type="reset" id="resetbtn">초기화</button>
            <button type="button" id="registbtn">작성하기</button>-->
    </div>
    </form>
    <br>
     

      <!--<script> 
        function setThumbnail(event) { 
            for (var image of event.target.files) { 
                var reader = new FileReader(); 
                    reader.onload = function(event) { 
                    var img = document.createElement("img");
                    img.setAttribute("src", event.target.result); 
                    document.querySelector("div#image_container").appendChild(img);
                    }; 
                    console.log(image); 
                    reader.readAsDataURL(image);
                    } 
                } 
        </script>-->
        <script>
            ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
              imageView = function imageView(att_zone, btn){
            
                var attZone = document.getElementById(att_zone);
                var btnAtt = document.getElementById(btn)
                var sel_files = [];
                
                // 이미지와 체크 박스를 감싸고 있는 div 속성
                var div_style = 'display:inline-block;position:relative;'
                              + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
                // 미리보기 이미지 속성
                var img_style = 'width:100%;height:100%;z-index:none';
                // 이미지안에 표시되는 체크박스의 속성
                var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                              + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
              
                btnAtt.onchange = function(e){
                  var files = e.target.files;
                  var fileArr = Array.prototype.slice.call(files)
                  for(f of fileArr){
                    imageLoader(f);
                  }
                }  
                
              
                // 탐색기에서 드래그앤 드롭 사용
                attZone.addEventListener('dragenter', function(e){
                  e.preventDefault();
                  e.stopPropagation();
                }, false)
                
                attZone.addEventListener('dragover', function(e){
                  e.preventDefault();
                  e.stopPropagation();
                  
                }, false)
              
                attZone.addEventListener('drop', function(e){
                  var files = {};
                  e.preventDefault();
                  e.stopPropagation();
                  var dt = e.dataTransfer;
                  files = dt.files;
                  for(f of files){
                    imageLoader(f);
                  }
                  
                }, false)
                
            
                
                /*첨부된 이미지들을 배열에 넣고 미리보기 */
                imageLoader = function(file){
                  sel_files.push(file);
                  var reader = new FileReader();
                  reader.onload = function(ee){
                    let img = document.createElement('img')
                    img.setAttribute('style', img_style)
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                  }
                  
                  reader.readAsDataURL(file);
                }
                
                /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
                makeDiv = function(img, file){
                  var div = document.createElement('div')
                  div.setAttribute('style', div_style)
                  
                  var btn = document.createElement('input')
                  btn.setAttribute('type', 'button')
                  btn.setAttribute('value', 'x')
                  btn.setAttribute('delFile', file.name);
                  btn.setAttribute('style', chk_style);
                  btn.onclick = function(ev){
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for(var i=0 ;i<sel_files.length; i++){
                      if(delFile== sel_files[i].name){
                        sel_files.splice(i, 1);      
                      }
                    }
                    
                    dt = new DataTransfer();
                    for(f in sel_files) {
                      var file = sel_files[f];
                      dt.items.add(file);
                    }
                    btnAtt.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                  }
                  div.appendChild(img)
                  div.appendChild(btn)
                  return div
                }
              }
            )('att_zone', 'btnAtt')
            
            </script>

</body>
</html>

<jsp:include page="/views/common/footer.jsp" />