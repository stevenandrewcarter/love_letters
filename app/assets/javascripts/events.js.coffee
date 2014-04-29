# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.deleteEvents = () ->
  $('#events tr').each (i, row) ->
    id = $(row).attr("id")
    if id && $('#chk_event_' + id)[0].checked
      window.deleteEvent(id)
  $(this).addClass "selected"
  $('.error-message').hide()

window.deleteEvent = (id) ->
  $.ajax
    url: '/events/' + id
    type: 'DELETE'
    success: (data, status, response) ->
      if data.error == true
        $('#delete_events').removeClass('selected')
      else
        $('#' + id).remove();
        window.location.reload()
    error: ->
      $('#delete_events').removeClass('selected')
    dataType: "json"

$ ->
  $('select#event_country_code').change (event) ->
    select_wrapper = $('#state_code_wrapper')
    $('select', select_wrapper).attr('disabled', true)
    country_code = $(this).val()
    url = "/events/subregion_options?country_code=#{country_code}&owner=event"
    select_wrapper.load(url)

  $('select#locale').change (event) ->
    $(@).closest('form').submit()