$(document).ready(function() {
	// Override summernotes image manager
	$('.summernote').each(function() {
		var element = this;
		
		$(element).summernote({
			disableDragAndDrop: true,
			height: 300,
			emptyPara: '',
			
			lang : 'zh-TW',
			toolbar: [
				['style', ['undo', 'redo', 'style']],
				['font', ['bold', 'underline', 'clear']],
				['fontname', ['fontname','fontsize','height']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table','hr']],
				['insert', ['link', 'image', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			fontNames: [
				'Microsoft JhengHei', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New',
				'Helvetica Neue', 'Helvetica', 'Impact', 'Lucida Grande',
				'Tahoma', 'Times New Roman', 'Verdana'
			],
			fontSizes: ['8', '9', '10', '11', '12', '13', '14', '15', '16', '18', '20', '24', '30', '36'],
				
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;

					// create button
					var button = ui.button({
						contents: '<i class="note-icon-picture" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();
						
							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									
									$('#modal-image').modal('show');
									
									$('#modal-image').delegate('a.thumbnail', 'click', function(e) {
										e.preventDefault();
										
										$(element).summernote('insertImage', $(this).attr('href'));
																	
										$('#modal-image').modal('hide');
									});
								}
							});						
						}
					});
				
					return button.render();
				}
  			}
		});
	});
	
});
