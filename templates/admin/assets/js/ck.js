// CKEDITOR.replace("id_textarea");

let editors = document.getElementsByClassName('editor');
// console.log(editors);

for (let i = 0; i < editors.length; i++) {
	idCkeditor = 'editor_'+ (i);
	editors.item(i).id = idCkeditor;
	CKEDITOR.replace(idCkeditor);
}


// CKFinder
function selectFileWithCKFinder( elementId ) {
	CKFinder.popup( {
		chooseFiles: true,
		width: 800,
		height: 600,
		onInit: function( finder ) {
			finder.on( 'files:choose', function( evt ) {
				var file = evt.data.files.first();
				var output = document.getElementById( elementId );
				output.value = file.getUrl();
			} );

			finder.on( 'file:choose:resizedImage', function( evt ) {
				var output = document.getElementById( elementId );
				output.value = evt.data.resizedUrl;
			} );
		}
	} );
}