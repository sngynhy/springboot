// 3. CKEditor5를 생성할 textarea 지정
ClassicEditor
	.create( document.querySelector('#editor') )
	.then( editor => { 

        console.log( editor ); 

    } )
	.catch( error => {
		console.error( error );
	} );