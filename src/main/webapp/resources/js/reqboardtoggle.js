$('.accordion').on("click", ".js-title", function() {
	var copy = '.js-copy';
	$(this).next(copy).slideToggle();
	$(this).parent().siblings().children().next().slideUp();
	console.log('--' + $(this).parent().siblings().children().next().html());
	return false;

})
$('input[type=radio]:checked').parent().css('color', '#f56a6a');
$('input[type=radio]').change(function() {
	console.log($('input[type=radio]:checked').val());
	$('input[type=radio]:checked').parent().css('color', '#f56a6a');
	$('input[type=radio]:not(:checked)').parent().css('color', '#7f888f');

})
