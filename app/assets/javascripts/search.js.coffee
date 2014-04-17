# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.app =
  addToFavourites: (user_id, favourite_user_id) ->
    $.ajax
      url: '/users/' + user_id + '/favourites'
      type: 'POST'
      data:
        favourite_user_id: favourite_user_id
      success: (data, status, response) ->
        if data.error == true
          console.log data
        else
          console.log data
          window.location.reload()
      error: ->
        console.log data
      dataType: "json"

  removeFromFavourites: (user_id, favourite_user_id) ->
    $.ajax
      url: '/users/' + user_id + '/favourites/' + favourite_user_id
      type: 'DELETE'
      data:
        favourite_user_id: favourite_user_id
      success: (data, status, response) ->
        if data.error == true
          console.log data
        else
          console.log data
          window.location.reload()
      error: ->
        console.log data
      dataType: "json"