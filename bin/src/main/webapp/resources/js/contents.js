$(function() {
    $('.tab-menu li').click(function(){
		var activeTab = $(this).attr('data-tab');

		$('.tab-menu li').removeClass('active');
		$('.tab-content').removeClass('active');

		$(this).addClass('active');
		$("." + activeTab).addClass('active');
	})
});