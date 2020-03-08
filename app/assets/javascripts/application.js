// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require_tree .
//= require chartkick
//= require Chart.bundle
//= require jquery.turbolinks

$(function(){
	$('#calendar').fullCalendar({
		titleFormat: 'YYYY年 M月',
		dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
		navLinks: true,
		selecttable: true,
		selectHelper: true,
		events: '/user/training_managements.json',
		editable: true
	});
});

$(function(){
	$('.main_title').hide().fadeIn(5000);
});

$(function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });

 });