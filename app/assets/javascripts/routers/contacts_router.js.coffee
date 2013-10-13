class Mycontacts.Routers.Contacts extends Backbone.Router
  routes:
  	'': 'index'

  initialize: ->
  	@collection = new Mycontacts.Collections.Contacts()

  index: ->
    @collection.fetch
      success: =>
      	view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	$('#main_container').html(view.render().el)