class Mycontacts.Routers.Contacts extends Backbone.Router
  routes:
  	'': 'index'
  	'contacts/new': 'createContact'
  	'contacts/:id': 'showContact'
  	'contacts/:id/edit': 'editContact'

  initialize: ->
  	@collection = new Mycontacts.Collections.Contacts()

  index: ->
    @collection.fetch
      success: =>
      	view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	$('#main_container').html(view.render().el)
      error: =>
          console.log "error!"

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
        error: =>
          console.log "error!"
    else
      model = @collection.get(id)
      view = new Mycontacts.Views.ContactShow(model: model)
      $('#contacts_info').html(view.render().el)

  editContact: (id) ->
  	alert "Editing Contact #{id}"

  createContact: ->
  	# Fetching collection if not already fetched
  	if @collection.length == 0
  	  @collection.fetch
        success: (new_collection, response, options) =>
      	  view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	  $('#main_container').html(view.render().el)
      	  # ExecJS::RuntimeError in Main#index
        error: =>
          console.log "error!"
    else
      view = new Mycontacts.Views.ContactNew(collection: @collection)
      $('#contacts_info').html(view.render().el)