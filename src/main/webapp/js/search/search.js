$('#searchText').text(seasrchText + `의 검색결과`);

code = '';
$.each(list, function(i, v){
  code += /* html */ `
  <li>
    <a href='${mypath}/product/productDetail.do?prod_no=${v.prod_no}'>
      <span class="img_box">
        <img src="<%=request.getContextPath() %>/images/shop/product1.png" alt="prod_img1" />
      </span>
      <span class="txt_box">
        <span>${v.prod_name}</span>
        <b>${v.prod_price}원</b>
      </span>
    </a>
  </li>
  `;
});
$('#prod_list>ul').html(code);
