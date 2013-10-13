class Mycontacts.Routers.Contacts extends Backbone.Router
  routes:
  	'': 'index'
  	'contacts/:id': 'showContact'

  initialize: ->
  	@collection = new Mycontacts.Collections.Contacts()

  index: ->
    @collection.fetch
      success: =>
      	view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	$('#main_container').html(view.render().el)

  showContact: (id) ->
  	# Fetching collection if not already fetched
  	if @collection.length == 0
  	  @collection.fetch
        success: (new_collection, response, options) =>
      	  view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	  $('#main_container').html(view.render().el)
      	  # ExecJS::RuntimeError in Main#index
      	  #model = @collection.get(id)
          #view = new Mycontacts.Views.ContactShow(model: model)
          #$('#contacts_info').html(view.render().el)
    else
      model = @collection.get(id)
      view = new Mycontacts.Views.ContactShow(model: model)
      $('#contacts_info').html(view.render().el)