window.Mycontacts =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

$(document).ready ->
  Mycontacts.initialize() unless $('#main').length == 0
