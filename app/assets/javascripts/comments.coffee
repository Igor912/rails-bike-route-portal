$(document).on "turbolinks:load", ->
  $('#comments_link').click ->
    $('#comments_section').fadeToggle()
    $('#comment_name_field').focus()