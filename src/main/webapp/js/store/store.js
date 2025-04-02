/**
 * 
 */
function timeAgo(dateString) {
    const now = new Date(); // 현재 시간
    const targetDate = new Date(dateString); // 입력된 날짜 문자열을 Date 객체로 변환
    const diff = now - targetDate; // 현재 시간과의 차이 (밀리초 단위)

    const seconds = Math.floor(diff / 1000); // 초 단위로 변환
    const minutes = Math.floor(seconds / 60); // 분 단위
    const hours = Math.floor(minutes / 60); // 시간 단위
    const days = Math.floor(hours / 24); // 일 단위
    const years = Math.floor(days / 365); // 년 단위

    if (years > 0) {
        return `${years}년 전`;
    } else if (days > 0) {
        return `${days}일 전`;
    } else if (hours > 0) {
        return `${hours}시간 전`;
    } else if (minutes > 0) {
        return `${minutes}분 전`;
    } else {
        return `${Math.abs(seconds)}초 전`;
    }
}

const loadTabContent = () => {
	$(".store_tab_box li").on("click", function () {
		$(".store_tab_box li").removeClass("on");
		$(this).addClass("on");
	
	    // 데이터 속성으로부터 탭 이름 가져오기
		const tabName = $(this).data("tab");
		
		const formData = new FormData();
		formData.append("storeId", storeId);
		formData.append("tabName", tabName);
		
		$.ajax({
			url: mypath + "/store/tabContent.do",
			type: "POST",
			data: formData,
			dataType: "json",
			contentType: false,
			processData: false,
			success: function(data){
				let tabList = "상품";
				let tabCnt = 0;
				let htmlCode = `<ul>`;
				console.log(mypath);
				switch(tabName){
				case "tabProd":
					data.forEach(vo => {
						$("#prod_list").removeClass("kcy_rev");
						let dateAnnounce = timeAgo(vo.prod_newing);
						if(vo.prod_tr_status==1)
							htmlCode +="<li class='sold_out' data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
						else if(vo.prod_tr_status==0)
							htmlCode +="<li data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
						htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
						htmlCode +="</span><span class='txt_box'><span>" +vo.prod_name+ "</span>";
						htmlCode +="<span id='priceNdate'><span><b>" +vo.prod_price.toLocaleString("ko-KR")+ "</b></span><span>"+ dateAnnounce+ "</span></span>";
						htmlCode +="</span></a></li>";
						tabCnt++;
					});
					break;
				case "tabReview":
					tabList = "상점후기";
					data.forEach(vo => {
						$("#prod_list").addClass("kcy_rev");
						let prodName = vo.prod_name;
						let memAlias = vo.mem_alias;
						console.log(memAlias);
						let filePath = vo.file_path;
						let reviewRating = vo.review_rating;
						let reviewCont = vo.review_cont
						let prodPrice = vo.prod_price.toLocaleString("ko-KR");
						let reviewTimestamp = vo.review_timestamp;
						let dateAnnounce = timeAgo(reviewTimestamp);
						let txnNo = vo.txn_no;
						htmlCode +="<li id='rev"+txnNo+"' data-price='"+prodPrice+"' data-date='"+reviewTimestamp+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'>";
						htmlCode +="<span class='img_box'>";
						htmlCode +="<img src='"+filePath+"' alt='" +memAlias+ "' class='thumb'/></span>";
						htmlCode +="<span class='txt_box'>"
						htmlCode +="<span id='memName'><b>" +memAlias+ "</b></span>";
						htmlCode +="<span class='kcy_reviewRating'>";
						htmlCode +="<span class='material-symbols-outlined star' style='color:yellow;'>star_half</span><span>"+reviewRating+"</span>";
/*						htmlCode +="<span class='material-symbols-outlined star' data-const='1' data-rating='"+reviewRating+"'>star</span>";
						htmlCode +="<span class='material-symbols-outlined star' data-const='2' data-rating='"+reviewRating+"'>star</span>";
						htmlCode +="<span class='material-symbols-outlined star' data-const='3' data-rating='"+reviewRating+"'>star</span>";
						htmlCode +="<span class='material-symbols-outlined star' data-const='4' data-rating='"+reviewRating+"'>star</span>";
						htmlCode +="<span class='material-symbols-outlined star' data-const='5' data-rating='"+reviewRating+"'>star</span>";
*/						htmlCode +="</span>";
						//htmlCode +="<span id='prodName'><b>" +prodName+ "</b></span>";
						htmlCode +="<input type='button' value='" +prodName+ "' id='"+prodName+"' style='margin-botton: 10px;'>";
						htmlCode +="<span id='reviewCont'>" +reviewCont+ "</span>"
						htmlCode +="</span>"
						htmlCode +="<span class='date_box'>";
						htmlCode +="<p>"+dateAnnounce+"</p>";
						htmlCode +="</span>";
						htmlCode +="</a></li>";
						tabCnt++;
					});
					reviewRatingScore();
					break;
				case "tabSoldout":
					data.forEach(vo => {
						$("#prod_list").removeClass("kcy_rev");

						let dateAnnounce = timeAgo(vo.prod_newing);
						if(vo.prod_tr_status==1)
							htmlCode +="<li class='sold_out' data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
						else if(vo.prod_tr_status==0)
							htmlCode +="<li data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
						htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
						htmlCode +="</span><span class='txt_box'><span>" +vo.prod_name+ "</span>";
						htmlCode +="<span id='priceNdate'><span><b>" +vo.prod_price.toLocaleString("ko-KR")+ "</b></span><span>"+ dateAnnounce+ "</span></span>";
						htmlCode +="</span></a></li>";
						tabCnt++;
					});
					break;
				case "tabWishlist":
					tabList = "찜 목록";
					data.forEach(vo => {
						$("#prod_list").removeClass("kcy_rev");

						let dateAnnounce = timeAgo(vo.prod_newing);
						if(vo.prod_tr_status==1)
							htmlCode +="<li class='sold_out' data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
						else if(vo.prod_tr_status==0)
							htmlCode +="<li data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
						htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
						htmlCode +="</span><span class='txt_box'><span>" +vo.prod_name+ "</span>";
						htmlCode +="<span id='priceNdate'><span><b>" +vo.prod_price.toLocaleString("ko-KR")+ "</b></span><span>"+ dateAnnounce+ "</span></span>";
						htmlCode +="</span></a></li>";
						tabCnt++;
					});
					break;
				}
				
				htmlCode+=`</ul>`;
				
				$(".store_list_cnt").html(tabList+" <span>"+tabCnt+"</span>");
				$("#prod_list").empty();
				$("#prod_list").append(htmlCode);
			},
			error: function(xhr){
				console.log("상태:: " + xhr.status);
			}
		});
	});
}


const loadProdTabAtFirst = () => {
	const formDataAT = new FormData();
	formDataAT.append("storeId", storeId);
	formDataAT.append("tabName", "tabProd");
	$.ajax({
		url: mypath + "/store/tabContent.do",
		type: "POST",
		data: formDataAT,
		dataType: "json",
		contentType: false,
		processData: false,
		success: function(data){
			let tabList = "상품";
			let tabCnt = 0;
			let htmlCode = `<ul>`;
			data.forEach(vo => {
				let dateAnnounce = timeAgo(vo.prod_newing);
				console.log(vo.prod_name, vo.prod_price);
				if(vo.prod_tr_status==1)
					htmlCode +="<li class='sold_out' data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
				else if(vo.prod_tr_status==0)
					htmlCode +="<li data-price='"+vo.prod_price+"' data-date='"+vo.prod_newing+"'><a href='"+mypath+"/product/productDetail.do?prod_no="+vo.prod_no+"'><span class='img_box'>";
				htmlCode +="<img src='"+vo.file_path+"' alt='" +vo.prod_name+  "'/>";
				htmlCode +="</span><span class='txt_box'><span>" +vo.prod_name+ "</span>";
				htmlCode +="<span id='priceNdate'><span><b>" +vo.prod_price.toLocaleString("ko-KR")+ "</b></span><span>"+ dateAnnounce+ "</span></span>";
				htmlCode +="</span></a></li>";
				tabCnt++;
			});
			htmlCode+=`</ul>`;
			
			$(".store_list_cnt").html(tabList+" <span>"+tabCnt+"</span>");
			$("#prod_list").empty();
			$("#prod_list").append(htmlCode);
		},
		error: function(xhr){
			console.log("상태:: " + xhr.status);
		}
	});
}

function tabFiltering() {
	$("#sort_price_asc").on("click", function () {
	    $(".store_list_filter li").removeClass("on");
	    $(this).addClass("on");
	    sortList("price", "asc");
	});

	$("#sort_price_desc").on("click", function () {
	    $(".store_list_filter li").removeClass("on");
	    $(this).addClass("on");
	    sortList("price", "desc");
	});

	$("#sort_date").on("click", function () {
	    $(".store_list_filter li").removeClass("on");
	    $(this).addClass("on");
	    sortList("date", "desc");
	});
}

function sortList(criteria, order) {
    let $list = $("#prod_list ul"); // ul 요소 선택
    let $items = $list.children("li"); // 모든 li 요소 가져오기

    $items.sort(function (a, b) {
        let aValue = $(a).data(criteria); // 첫 번째 요소의 data 값
        let bValue = $(b).data(criteria); // 두 번째 요소의 data 값

        if (criteria === "price") {
            aValue = parseFloat(aValue); // 숫자로 변환
            bValue = parseFloat(bValue); // 숫자로 변환
        } else if (criteria === "date") {
            aValue = new Date(aValue.replace(" ", "T").replace("/", "-")); // 날짜로 변환
            bValue = new Date(bValue.replace(" ", "T").replace("/", "-")); // 날짜로 변환
            console.log(aValue, bValue);
        }

        // 정렬 기준에 따라 오름차순 또는 내림차순 결정
        return order === "asc" ? aValue - bValue : bValue - aValue;
    });

    // 정렬된 li를 ul에 다시 추가
    $list.html($items);
}

const viewRatingScore = () => {
	$(".ratingView .star").each(function(){
		const rating = parseInt($(this).data('const'));
		console.log(rating);
		if(rating>avgRating)
			$(this).addClass('disable');
		else
			$(this).addClass('able');
	});
}

const reviewRatingScore = () => {
	$(".kcy_reviewRating .star").each(function(){
		var rating = parseInt($(this).data('const'));
		var revRat = $(this).data('rating');
		if(rating>revRat)
			$(this).addClass('revDisable');
		else
			$(this).addClass('revAble');
	});
}

const backgroundThumbnail = () => {
    $('#kcy_imageInput').on('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const imageUrl = e.target.result; // Data URL 생성

                // CSSOM을 통해 :after 가상 선택자의 background 동적으로 설정
                const styleSheet = document.styleSheets[0];
                const rules = styleSheet.cssRules || styleSheet.rules;

                for (let i = 0; i < rules.length; i++) {
                    if (rules[i].selectorText === '.store_info_box:after') {
						console.log(rules[i].selectorText);
                        rules[i].style.background = `url('${imageUrl}') no-repeat center / cover`;
                        break;
                    }
                }
            };
            reader.readAsDataURL(file); // 파일을 Data URL로 변환
        }
    });
}


const editProfileForm = () => {
	storeImgDiv = $(".store_info_box");
		thumbnailDiv = $(".thumb");
		profileImg = $("#kcy_previewImg");
	storeTxtDiv = $(".store_info_txt_wrap");
		storenameDiv = $(".info_txt_tit");
		introductDiv = $(".store_info_txt_box");
		editclickDiv = $(".edit");
	
		
	let imgUploadAct = $("<input>", {type:"file", id:"kcy_imageInput", accept:"image/*", style:"display: none;"});
	let imgUploadLie = $("<span>", {class: "material-symbols-outlined", onclick:"document.getElementById('kcy_imageInput').click();"});
	storeImgDiv.append(imgUploadAct);
	storeImgDiv.append(imgUploadLie.text("perm_media"));
		
		
	let memAlias = $("#kcy_storename").text();
	let storename = $("<input>", {type:"text", value:memAlias, id:"kcy_editAlias", style:"font-size:20px; color:#898989; font-weight:bold;"});
	let storenameAfterDiv = $("<div>", {class: "mem_ck"});
		//`
		//<input type="text" value="${memAlias}" id="kcy_editAlias">
		//<div class="mem_ck">`;
	storenameDiv.empty();
	storenameDiv.append(storename);
	storenameDiv.append(storenameAfterDiv);
	
	let storeintroductPtag = $("#kcy_storeintroduct"); 
	let prInfo = storeintroductPtag.text();
	let storeintroduct = $("<textarea>", 
		{id: "kcy_editPrInfo", 
		 style: "height: 100%; font-size: 20px;background-color: #8b8b8b1c;resize: none;color: black;border: none;border-bottom: 2px solid #0000007e;outline: none;"});
	storeintroductPtag.before(storeintroduct.text(prInfo));
	storeintroductPtag.remove();

	
	/*let sirenDiv = $("<div>", {class: "siren"});
	let sirenChildSpan_i = $("<span>",  {class:"material-symbols-outlined"}).text("siren");
	let sirenChildSpan_ii= $("<span>").text("신고하기");
	sirenDiv.append(sirenChildSpan_i);
	sirenDiv.append(sirenChildSpan_ii);*/
	
	let completeEdit = $("<div>", {class: "completeEdit"});
	let completeEditChild_i = $("<span>", {class:"material-symbols-outlined"}).text("save");
	let completeEditChild_ii= $("<span>").text("저장하기");
	completeEdit.append(completeEditChild_i); 
	completeEdit.append(completeEditChild_ii); 
	
	/*editclickDiv.before(sirenDiv);*/
	editclickDiv.before(completeEdit);
	editclickDiv.remove();
};







