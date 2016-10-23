
# app/assets/javascripts/cable/subscriptions/web_notifications.coffee
# Client-side which assumes you've already requested
# the right to send web notifications.
window.game = {}
window.player = {}

App.cable.subscriptions.create "GameChannel",
   # Called when the subscription is ready for use on the server.
  connected: ->

   # Called when the WebSocket connection is closed.
  disconnected: ->

  received: (data) ->
    switch data.operation
      
      when "create"
        if Number(window.player.id) != Number(data.player_id)
          panel = $('nav#players_panel')
          panel.append("<a class='panel-block' herf='#' id='#{data.player_id}'><span class='panel-icon'><i class='fa fa-user'></i></span>#{data.player_name}</a>")  
      
      when "destroy"
        $("a\##{data.player_id}").remove()
      
      when "start"
        if Number(window.game.id) == Number(data.game_id)
          $('a.button#start-game').attr('disabled', true)

        if Number(window.player.id) == Number(data.current_player_id)
          $('a.card-footer-item#roll-dice').removeClass('is-disabled')
