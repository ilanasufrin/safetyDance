
jQuery( document ).ready(function( $ ) {
	$('#searchButton').click(function(){
		$(this).removeClass('fui-search').addClass('glyphicon glyphicon-refresh')
	})
});