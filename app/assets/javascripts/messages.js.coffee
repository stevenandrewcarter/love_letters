# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.app =
  setup: () ->
    $('a.delete_selected').click (ev) ->
      ev.preventDefault()
      $('#messages tr').each (i, row) ->
        id = $(row).attr("id")
        if id && $('#chk_message_' + id)[0].checked
          app.deleteMessage(id)
      $(this).addClass "selected"
      $('.error-message').hide()

  deleteMessage: (id) ->
    $.ajax
      url: '/messages/' + id
      type: 'DELETE'
      success: (data, status, response) ->
        if data.error == true
          $('a.delete_selected').removeClass('selected')
        else
          $('#' + id).remove();
          window.location.reload()
      error: ->
        $('a.delete_selected').removeClass('selected')
      dataType: "json"