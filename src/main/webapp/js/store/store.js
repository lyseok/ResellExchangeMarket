/**
 * 
 */




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
	let codeStorename =
		`
		<input type="text" value="${memAlias}" id="kcy_editAlias">
		<div class="mem_ck">`;
	storenameDiv.html(codeStorename);
	
	let storeintroductPtag = $("#kcy_storeintroduct"); 
	let prInfo = storeintroductPtag.text();
	let storeintroduct = $("<textarea>", {id: "kcy_editPrInfo"});
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







