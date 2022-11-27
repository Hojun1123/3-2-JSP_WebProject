function CheckAddBook() {

	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var id = document.getElementById("id");
	var author = document.getElementById("author");
	var publisher = document.getElementById("publisher");
	var releaseDate = document.getElementById("releaseDate");
	
	// 도서명 체크
	if (name.value.length < 2 || name.value.length > 16) {
		alert("[도서명]\n최소 2자에서 최대 16자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	//ISBN체크
	if(id.value.length != 13 || isNaN(id.value)){
		alert("[ISBN]\n13자리 숫자로 입력하세요.");
		id.select();
		id.focus();
		return false;
	}
	
	// 도서 가격 체크
	if (price.value.length == 0 || isNaN(price.value)) {
		alert("[가격]\n숫자만 입력하세요");
		price.select();
		price.focus();
		return false;
	}

	if (!price.value) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		price.select();
		price.focus();
		return false;
	}
	
	if (!author.value) {
		alert("[지은이]\n지은이를 입력해주세요.");
		author.select();
		author.focus();
		return false;
	}
	
	if (!publisher.value) {
		alert("[출판사]\n출판사를 입력해주세요.");
		publisher.select();
		publisher.focus();
		return false;
	}
	
	if(!releaseDate){
		alert("[출판일]\n출판일을 입력해주세요.");
		releaseDate.select();
		releaseDate.focus();
		return false;
	}

	 document.newBook.submit()
}
