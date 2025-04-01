/**
 * 
 */

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







