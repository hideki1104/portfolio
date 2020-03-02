# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#calendar').fullCalendar ({
  height:700,
  titleFormat: 'YYYY年 M月',
  dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
  })
  return